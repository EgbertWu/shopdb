# -*- coding: utf-8 -*-
from flask import Blueprint,request,redirect,jsonify
from common.libs.Helper import ops_render,iPagination,getCurrentDate
from common.libs.UrlManager import UrlManager
from common.libs.user.UserService import UserService
from common.models.log.AppAccessLog import AppAccessLog
from common.models.User import User
from common.models.Role import Role
from common.models.UserRole import UserRole
from sqlalchemy import  or_
from application import app,db

route_account = Blueprint( 'account_page',__name__ )

@route_account.route( "/index" )
def index():
    resp_data = {}
    req = request.values
    page = int( req['p'] ) if ( 'p' in req and req['p'] ) else 1
    query = User.query

    if 'mix_kw' in req:
        rule = or_( User.nickname.ilike( "%{0}%".format( req['mix_kw'] ) ),User.mobile.ilike( "%{0}%".format( req['mix_kw'] ) ) )
        query = query.filter( rule )

    if 'status' in req and int( req['status'] ) > -1:
        query = query.filter( User.status == int( req['status'] ) )

    page_params = {
        'total': query.count(),
        'page_size':app.config['PAGE_SIZE'],
        'page': page,
        'display':app.config['PAGE_DISPLAY'],
        'url': request.full_path.replace( "&p={}".format(page),"" )
    }

    pages = iPagination( page_params )
    offset = ( page - 1 ) * app.config['PAGE_SIZE']
    limit = app.config['PAGE_SIZE'] * page

    list = query.order_by( User.uid.desc() ).all()[ offset:limit ]

    resp_data['list'] = list
    resp_data['pages'] = pages
    resp_data['search_con'] = req
    resp_data['status_mapping'] = app.config['STATUS_MAPPING']
    resp_data['current'] = 'index'
    return ops_render( "account/index.html",resp_data )

@route_account.route( "/info" )
def info():
    resp_data = {}
    req = request.args
    uid = int( req.get('id',0 ))
    reback_url = UrlManager.buildUrl("/account/index")
    if uid < 1:
        return redirect( reback_url )

    info = User.query.filter_by( uid = uid ).first()
    if not info:
        return redirect( reback_url )

    access_list = AppAccessLog.query.filter_by( uid = uid).order_by(AppAccessLog.id.desc() ).limit(10).all()
    user_role_list = UserRole.query.filter_by( uid= uid ).all()
    role_ids = []
    for item in user_role_list:
        role_ids.append(item.role_id)

    role_name_list = [Role.query.with_entities(Role.rolename).filter_by( id = id ).one() for id in role_ids]
    role_name = []
    for item in role_name_list:
        role_name.append(item[0])
    role_name_list = ",".join(role_name)

    resp_data['info'] = info
    resp_data['access_list'] = access_list
    resp_data['role_name_list'] = role_name_list
    resp_data['current'] = 'index'
    return ops_render( "account/info.html",resp_data )

@route_account.route( "/set",methods = [ "GET","POST" ] )
def set():
    default_pwd = "******"
    if request.method == "GET":
        resp_data = {}
        req = request.args
        uid = int( req.get( "id",0 ) )
        info = None
        if uid :
            info = User.query.filter_by( uid = uid ).first()

        role_list = Role.query.order_by( Role.id.desc() ).all()
        user_role_list = UserRole.query.with_entities(UserRole.role_id).filter_by( uid = uid ).all()
        role_ids = []
        for item in user_role_list:
            role_ids.append(item[0])

        resp_data['info'] = info
        resp_data['role_list'] = role_list
        resp_data['user_role_list'] = role_ids
        return ops_render( "account/set.html",resp_data )

    resp = { 'code':200,'msg':'操作成功~~','data':{} }
    req = request.values

    id = req['id'] if 'id' in req else 0
    nickname = req['nickname'] if 'nickname' in req else ''
    mobile = req['mobile'] if 'mobile' in req else ''
    email = req['email'] if 'email' in req else ''
    role_ids = req['role_ids'] if 'role_ids' in req else ''
    login_name = req['login_name'] if 'login_name' in req else ''
    login_pwd = req['login_pwd'] if 'login_pwd' in req else ''

    role_ids = list(role_ids.split(","))

    if nickname is None or len( nickname ) < 1:
        resp['code'] = -1
        resp['msg'] = "请输入符合规范的姓名~~"
        return jsonify( resp )

    if mobile is None or len( mobile ) < 1:
        resp['code'] = -1
        resp['msg'] = "请输入符合规范的手机号码~~"
        return jsonify( resp )

    if email is None or len( email ) < 1:
        resp['code'] = -1
        resp['msg'] = "请输入符合规范的邮箱~~"
        return jsonify( resp )

    if role_ids is None or len( role_ids ) < 1:
        resp['code'] = -1
        resp['msg'] = "请选择用户角色~~"
        return jsonify( resp )

    if login_name is None or len( login_name ) < 1:
        resp['code'] = -1
        resp['msg'] = "请输入符合规范的登录用户名~~"
        return jsonify( resp )

    if login_pwd is None or len( email ) < 6:
        resp['code'] = -1
        resp['msg'] = "请输入符合规范的登录密码~~"
        return jsonify( resp )
      

    has_in = User.query.filter( User.login_name == login_name,User.uid != id ).first()
    if has_in:
        resp['code'] = -1
        resp['msg'] = "该登录名已存在，请换一个试试~~"
        return jsonify(resp)



    user_info = User.query.filter_by( uid = id ).first()
    if user_info:
        model_user = user_info
    else:
        model_user = User()
        model_user.created_time = getCurrentDate()
        model_user.login_salt = UserService.geneSalt()

    model_user.nickname = nickname
    model_user.mobile = mobile
    model_user.email = email
    model_user.login_name = login_name
    if login_pwd != default_pwd:
        if user_info and user_info.uid == 1:
            resp['code'] = -1
            resp['msg'] = "该用户是演示账号，不准修改密码和登录用户名~~"
            return jsonify(resp)

        model_user.login_pwd =  UserService.genePwd( login_pwd,model_user.login_salt  )

    model_user.updated_time = getCurrentDate()
    db.session.add( model_user )
    db.session.commit()

    # 找出删除的角色，假如已有角色集合A，界面传递过来的角色集合B,角色集合A当中没有在角色集合B集合中就应该删除
    user_role_list = UserRole.query.filter_by(uid = model_user.uid).all()
    related_role_ids = []
    if user_role_list :
        for item in user_role_list:
            related_role_ids.append(item.role_id)
            if item.role_id not in role_ids:
                UserRole.query.filter_by(role_id = item.role_id).delete()

    # 找出添加的角色，假如已有角色集合A，界面传递过来的角色集合B,角色集合B当中没有在角色集合A集合中就应该添加
    if user_role_list :
        for item in user_role_list:
            related_role_ids.append(item.role_id)
            if item.role_id not in role_ids:
                UserRole.query.filter_by(role_id = item.role_id).delete()
    if role_ids:
        for rid in role_ids:
            if rid not in related_role_ids:
                model_user_role = UserRole()
                model_user_role.uid = id
                model_user_role.role_id = rid
                model_user_role.created_time = getCurrentDate()
                model_user_role.updated_time = getCurrentDate()
                db.session.add(model_user_role)
                db.session.commit()


    return jsonify(resp)

@route_account.route("/ops",methods = [ "POST" ])
def ops():
    resp = {'code': 200, 'msg': '操作成功~~', 'data': {}}
    req = request.values

    id = req['id'] if 'id' in req else 0
    act = req['act'] if 'act' in req else ''
    if not id :
        resp['code'] = -1
        resp['msg'] = "请选择要操作的账号~~"
        return jsonify(resp)

    if  act not in [ 'remove','recover' ] :
        resp['code'] = -1
        resp['msg'] = "操作有误，请重试~~"
        return jsonify(resp)

    user_info = User.query.filter_by(uid=id).first()
    if not user_info:
        resp['code'] = -1
        resp['msg'] = "指定账号不存在~~"
        return jsonify(resp)

    if act == "remove":
        user_info.status = 0
    elif act == "recover":
        user_info.status = 1

    if user_info and user_info.uid == 1:
        resp['code'] = -1
        resp['msg'] = "该用户是演示账号，不准操作账号~~"
        return jsonify(resp)

    user_info.update_time = getCurrentDate()
    db.session.add(user_info)
    db.session.commit()
    return jsonify(resp)



