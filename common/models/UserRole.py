# coding: utf-8
from sqlalchemy import BigInteger, Column, DateTime
from sqlalchemy.schema import FetchedValue
from application import db




class UserRole(db.Model):
    __tablename__ = 'user_role'
    id = db.Column(db.BigInteger, primary_key=True)
    uid = db.Column(db.BigInteger, nullable=False)
    role_id = db.Column(db.BigInteger, nullable=False)
    updated_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue())
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue())
