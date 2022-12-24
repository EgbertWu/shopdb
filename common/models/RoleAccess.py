# coding: utf-8
from sqlalchemy import BigInteger, Column, DateTime, Integer
from sqlalchemy.schema import FetchedValue
from application import db




class RoleAccess(db.Model):
    __tablename__ = 'role_access'

    id = db.Column(db.BigInteger, primary_key=True)
    role_id = db.Column(db.BigInteger, nullable=False)
    access_id = db.Column(db.BigInteger, nullable=False)
    status = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    updated_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue())
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue())
