# -*- coding: utf-8 -*-
from flask import Blueprint, request, redirect, jsonify
from common.libs.Helper import ops_render, iPagination, getCurrentDate, selectFilterObj
from common.libs.UrlManager import UrlManager
from common.models.Role import Role
from common.models.UserRole import UserRole
from common.models.RoleAccess import RoleAccess
from common.models.Access import Access
from application import app, db
from builtins import set as b_set


route_role = Blueprint('role_page', __name__)


@route_role.route("/index")
def index():
    resp_data = {}
    req = request.values
    page = int(req['p']) if ('p' in req and req['p']) else 1
    query = Role.query

    if 'mix_kw' in req:
        rule = Role.rolename.ilike("%{0}%".format(req['mix_kw']))
        query = query.filter(rule)

    if 'status' in req and int(req['status']) > -1:
        query = query.filter(Role.status == int(req['status']))

    page_params = {
        'total': query.count(),
        'page_size': app.config['PAGE_SIZE'],
        'page': page,
        'display': app.config['PAGE_DISPLAY'],
        'url': request.full_path.replace("&p={}".format(page), "")
    }

    pages = iPagination(page_params)
    offset = (page - 1) * app.config['PAGE_SIZE']
    limit = app.config['PAGE_SIZE'] * page

    list = query.order_by(Role.id.asc()).all()[offset:limit]

    resp_data['list'] = list
    resp_data['pages'] = pages
    resp_data['search_con'] = req
    resp_data['status_mapping'] = app.config['STATUS_MAPPING']
    resp_data['current'] = 'roleindex'
    return ops_render("role/index.html", resp_data)


@route_role.route("/set", methods=["GET", "POST"])
def set():
    if request.method == "GET":
        resp_data = {}
        req = request.args
        id = int(req.get("id", 0))
        info = None
        if id:
            info = Role.query.filter_by(id=id).first()
        resp_data['info'] = info
        resp_data['current'] = 'roleindex'
        return ops_render("role/set.html", resp_data)

    resp = {'code': 200, 'msg': '操作成功~~', 'data': {}}
    req = request.values

    id = req['id'] if 'id' in req else 0
    rolename = req['rolename'] if 'rolename' in req else ''

    if rolename is None or len(rolename) < 1:
        resp['code'] = -1
        resp['msg'] = "请输入符合角色名~~"
        return jsonify(resp)

    has_in = Role.query.filter(Role.rolename == rolename, Role.id != id).first()
    if has_in:
        resp['code'] = -1
        resp['msg'] = "该角色名已存在，请换一个试试~~"
        return jsonify(resp)

    role_info = Role.query.filter_by(id=id).first()
    if role_info:
        model_role = role_info
    else:
        model_role = Role()
        model_role.created_time = getCurrentDate()

    model_role.rolename = rolename
    model_role.updated_time = getCurrentDate()
    db.session.add(model_role)
    db.session.commit()

    return jsonify(resp)


@route_role.route("/ops", methods=["POST"])
def ops():
    resp = {'code': 200, 'msg': '操作成功~~', 'data': {}}
    req = request.values

    rid = req['rid'] if 'rid' in req else 0
    act = req['act'] if 'act' in req else ''
    if not rid:
        resp['code'] = -1
        resp['msg'] = "请选择要操作的角色~~"
        return jsonify(resp)

    if act not in ['remove', 'recover']:
        resp['code'] = -1
        resp['msg'] = "操作有误，请重试~~"
        return jsonify(resp)

    role_info = Role.query.filter_by(id=rid).first()
    if not role_info:
        resp['code'] = -1
        resp['msg'] = "指定角色不存在~~"
        return jsonify(resp)
    rid = int(rid)
    user_role_info = UserRole.query.filter_by(role_id=rid).first()
    if act == "remove":
        if not user_role_info:
            role_info.status = 0
        else:
            resp['code'] = -1
            resp['msg'] = "该角色下存在用户或已分配权限，删除失败~~"
            return jsonify(resp)
    elif act == "recover":
        role_info.status = 1

    role_info.update_time = getCurrentDate()
    db.session.add(role_info)
    db.session.commit()
    return jsonify(resp)


@route_role.route("/roleaccess", methods=["GET", "POST"])
def roleAccess():
    if request.method == "GET":
        resp_data = {}
        req = request.args
        id = int(req.get("id", 0))
        info = None
        reback_url = UrlManager.buildUrl("/role/index")
        if not id:
            redirect(reback_url)

        info = Role.query.filter_by(id=id).first()
        if not info:
            redirect(reback_url)

        # 取出所有权限记录
        access_list = Access.query.filter_by(status=1).order_by(Access.id.desc()).all()

        # 取出所有已分配权限记录
        role_access_list = RoleAccess.query.filter_by( role_id=id ).all()
        access_ids = selectFilterObj( role_access_list, "access_id" )
        resp_data['info'] = info
        resp_data['access_list'] = access_list
        resp_data['access_ids'] = access_ids
        return ops_render("role/role_access.html", resp_data)

    # 实现保存选中权限的逻辑
    resp = {'code': 200, 'msg': '操作成功~~', 'data': {}}
    req = request.values
    role_id = req['id'] if 'id' in req else 0
    access_ids = req['access_ids'] if 'access_ids' in req else ''
    access_ids = list(access_ids.split(","))

    if role_id is None:
        resp['code'] = -1
        resp['msg'] = "您指定角色不存在~~"
        return jsonify(resp)

    role_info = Role.query.filter( Role.id == role_id ).first()

    if not role_info:
        resp['code'] = -1
        resp['msg'] = "您指定角色不存在~~"
        return jsonify(resp)

    # 取出所有已分配个指定的角色的权限，假如权限A为分配的权限，传过去的权限B中没有A中的权限，就应该删除
    role_access_list = RoleAccess.query.filter_by(role_id=role_id).all()
    assign_access_ids = selectFilterObj(role_access_list, "access_id")
    assign_access_ids = b_set(assign_access_ids)
    access_ids = b_set(access_ids)
    delete_access_ids = assign_access_ids - access_ids
    if delete_access_ids:
        delete_access_list = RoleAccess.query.filter(RoleAccess.role_id == role_id, RoleAccess.access_id.in_( delete_access_ids)).all()
        [db.session.delete(a) for a in delete_access_list]
        db.session.commit()

    # 加入权限A为分配的权限，传过去的权限B不在A的权限中，就应该添加
    new_access_ids = access_ids - assign_access_ids
    if new_access_ids:
        for access_id in new_access_ids:
            tmp_model_role_access = RoleAccess()
            tmp_model_role_access.role_id = role_id
            tmp_model_role_access.access_id = access_id
            tmp_model_role_access.created_time = getCurrentDate()
            tmp_model_role_access.updated_time = getCurrentDate()
            db.session.add(tmp_model_role_access)
            db.session.commit()
    return jsonify(resp)
