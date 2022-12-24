# coding: utf-8
from sqlalchemy import BigInteger, Column, DateTime, Integer, String
from sqlalchemy.schema import FetchedValue
from application import db





class Access(db.Model):
    __tablename__ = 'access'

    id = db.Column(db.BigInteger, primary_key=True)
    title = db.Column(db.String(50), nullable=False, unique=True)
    urls = db.Column(db.String(1000), nullable=False)
    status = db.Column(db.Integer, nullable=False, server_default=db.FetchedValue())
    updated_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue())
    created_time = db.Column(db.DateTime, nullable=False, server_default=db.FetchedValue())
