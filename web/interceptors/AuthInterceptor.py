from application import app
from flask import request,g,redirect
from common.models.User import ( User )
from common.models.UserRole import UserRole
from common.models.RoleAccess import RoleAccess
from common.models.Access import Access
from common.libs.user.UserService import ( UserService )
from common.libs.UrlManager import ( UrlManager )
from common.libs.LogService import LogService
from common.libs.Helper import selectFilterObj,ops_render
import re
@app.before_request
def before_request():
    ignore_urls = app.config['IGNORE_URLS']
    ignore_check_login_urls = app.config['IGNORE_CHECK_LOGIN_URLS']
    path = request.path

    # 如果是静态文件就不要查询用户信息了
    pattern = re.compile('%s' % "|".join(ignore_check_login_urls))
    if pattern.match(path):
        return

    if '/api' in path:
        return


    user_info = check_login()
    g.current_user = None
    if user_info:
        g.current_user = user_info

    #加入日志
    LogService.addAccessLog()
    pattern = re.compile('%s' % "|".join(ignore_urls))
    if pattern.match(path):
        return

    if not user_info :
        return redirect( UrlManager.buildUrl( "/user/login" ) )

    user_list = User.query.filter_by( uid=g.current_user.uid).first()
    if user_list.is_admin == 1:
        return
    privilege_urls = getRolePrivilege()
    if request.path not in privilege_urls:
        return ops_render( 'error/forbidden.html',{ 'status':403,'msg':'很抱歉！您无权访问该页面，请联系管理员处理' } )

    return


'''
判断用户是否已经登录
'''
def check_login():
    cookies = request.cookies
    auth_cookie = cookies[app.config['AUTH_COOKIE_NAME']] if app.config['AUTH_COOKIE_NAME'] in cookies else None


    if '/api' in request.path:
        app.logger.info(request.path)
        auth_cookie = request.headers.get("Authorization")
        app.logger.info( request.headers.get("Authorization") )

    if auth_cookie is None:
        return False

    auth_info = auth_cookie.split("#")
    if len(auth_info) != 2:
        return False

    try:
        user_info = User.query.filter_by(uid=auth_info[1]).first()
    except Exception:
        return False

    if user_info is None:
        return False

    if auth_info[0] != UserService.geneAuthCode( user_info ):
        return False

    if user_info.status != 1:
        return False

    return user_info

'''
判断权限的逻辑：
1、取出当前登录用户的所属角色
2、在通过角色取出所属权限
3、在权限列表中取出权限链接
4、判断当前访问的链接是否在所拥有的权限中
'''
def getRolePrivilege(uid=0):

    if not uid and g.current_user:
        uid = g.current_user.uid

    privilege_urls = []
    role_list = UserRole.query.filter_by(uid=uid).all()
    #  取出所有的角色ID
    role_ids = selectFilterObj(role_list,'role_id')

    # 通过角色取出所属权限
    if role_ids:
        access_list = RoleAccess.query.filter(RoleAccess.role_id.in_(role_ids)).all()
        access_ids = selectFilterObj(access_list,'access_id')
        # 在权限列表中取出权限链接
        access_list = Access.query.filter(Access.id.in_(access_ids)).all()
        tmp_urls = ''
        if access_list:
            for item in access_list:
                tmp_urls = tmp_urls + item.urls + ","

            privilege_urls = list(tmp_urls[:-1].split(","))

    return privilege_urls