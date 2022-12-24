# -*- coding: utf-8 -*-
from flask import Blueprint,request,redirect,jsonify
from common.libs.Helper import ops_render,iPagination,getCurrentDate
from common.libs.UrlManager import UrlManager
from common.libs.user.UserService import UserService
from common.models.log.AppAccessLog import AppAccessLog
from common.models.User import User
from common.models.Access import Access
from application import app,db

route_access = Blueprint( 'access_page',__name__ )

@route_access.route( "/index" )
def index():
    resp_data = {}
    req = request.values
    page = int( req['p'] ) if ( 'p' in req and req['p'] ) else 1
    query = Access.query

    if 'mix_kw' in req:
        rule = Access.title.ilike( "%{0}%".format( req['mix_kw'] ) )
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

    list = query.order_by( Access.id.desc() ).all()[ offset:limit ]

    resp_data['list'] = list
    resp_data['pages'] = pages
    resp_data['search_con'] = req
    resp_data['status_mapping'] = app.config['STATUS_MAPPING']
    resp_data['current'] = 'accessindex'
    return ops_render( "access/index.html",resp_data )

@route_access.route( "/info" )
def info():
    resp_data = {}
    req = request.args
    id = int( req.get('id',0 ))
    reback_url = UrlManager.buildUrl("/account/index")
    if id < 1:
        return redirect( reback_url )

    info = Access.query.filter_by( id = id ).first()
    if not info:
        return redirect( reback_url )

    resp_data['info'] = info
    return ops_render( "access/info.html",resp_data )

@route_access.route( "/set",methods = [ "GET","POST" ] )
def set():
    if request.method == "GET":
        resp_data = {}
        req = request.args
        id = int( req.get( "id",0 ) )
        info = None
        if id :
            info = Access.query.filter_by( id = id ).first()
        resp_data['info'] = info
        return ops_render( "access/set.html",resp_data )

    resp = { 'code':200,'msg':'操作成功~~','data':{} }
    req = request.values

    id = req['id'] if 'id' in req else 0
    title = req['title'] if 'title' in req else ''
    urls = req['urls'] if 'urls' in req else ''
    urls = urls[:-1]

    if len(title) < 1 or len( title ) > 20:
        resp['code'] = -1
        resp['msg'] = "请输入符合规范的权限名~~"
        return jsonify( resp )

    if urls is None or len( urls ) < 1:
        resp['code'] = -1
        resp['msg'] = "请输入符合规范的url~~"
        return jsonify( resp )



    has_in = Access.query.filter( Access.title == title,Access.id != id ).first()
    if has_in:
        resp['code'] = -1
        resp['msg'] = "该权限名已存在，请换一个试试~~"
        return jsonify(resp)

    access_info = Access.query.filter_by( id = id ).first()
    if access_info:
        model_access = access_info
    else:
        model_access = Access()
        model_access.created_time = getCurrentDate()

    model_access.title = title
    model_access.urls = urls
    model_access.updated_time = getCurrentDate()
    db.session.add(model_access)
    db.session.commit()
    return jsonify(resp)

@route_access.route("/ops",methods = [ "POST" ])
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



