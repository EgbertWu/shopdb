# -*- coding: utf-8 -*-
from application import app,db
import time
import hashlib
import requests


class PrintService():

    @staticmethod
    def signature(STIME):
        return hashlib.sha1(app.config['PRINTER']['USER'] + app.config['PRINTER']['UKEY'] + STIME).hexdigest()

    def addPrinter(self,snlist):
        STIME = str(int(time.time()))  # 不需要修改

        params = {
            'user': app.config['PRINTER']['USER'],
            'sig': self.signature(STIME),
            'stime': STIME,
            'apiname': 'Open_printerAddlist',  # 固定值,不需要修改
            'printerContent': snlist
         }
        response = requests.post(app.config['PRINTER']['URL'], data=params, timeout=30)
        code = response.status_code  # 响应状态码
        if code == 200:
            app.logger.info(response.content)
            return code
        else:
            app.logger.info("add printer error")
            return False
    def printOrder(self,sn,content):
        STIME = str(int(time.time()))  # 不需要修改
        params = {
            'user':app.config['PRINTER']['USER'] ,
            'sig': self.signature(STIME),
            'stime': STIME,
            'apiname': 'Open_printMsg',  # 固定值,不需要修改
            'sn': sn,
            'content': content,
            'times': '1'  # 打印联数
        }
        response = requests.post(app.config['PRINTER']['URL'], data=params, timeout=30)
        code = response.status_code  # 响应状态码
        if code == 200:
            app.logger.info(response.content)
            return code# 服务器返回的JSON字符串,建议要当做日志记录起来
        else:
            app.logger.info("error printOrder")
            return False