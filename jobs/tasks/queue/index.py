# -*- coding: utf-8 -*-
from application import app, db
from common.models.queue.QueueList import QueueList
import json, requests, datetime 
from common.libs.Helper import getCurrentDate
from common.libs.pay.WeChatService import WeChatService
from common.libs.PrintService import PrintService
from common.models.pay.PayOrder import PayOrder
from common.models.pay.PayOrderItem import PayOrderItem
from common.models.member.OauthMemberBind import OauthMemberBind
from common.models.food.Food import Food
from common.models.food.FoodSaleChangeLog import FoodSaleChangeLog
from twilio.rest import Client
from sqlalchemy import func

'''
python manager.py runjob -m queue/index
'''


class JobTask():
    def __init__(self):
        pass

    def run(self, params):
        list = QueueList.query.filter_by(status=-1) \
            .order_by(QueueList.id.asc()).limit(1).all()
        for item in list:
            if item.queue_name == "pay":
                self.handlePay(item)

            item.status = 1
            item.updated_time = getCurrentDate()
            db.session.add(item)
            db.session.commit()

    def handlePay(self, item):
        data = json.loads(item.data)
        if 'member_id' not in data or 'pay_order_id' not in data:
            return False

        oauth_bind_info = OauthMemberBind.query.filter_by(member_id=data['member_id']).first()
        if not oauth_bind_info:
            return False

        pay_order_info = PayOrder.query.filter_by(id=data['pay_order_id']).first()
        if not pay_order_info:
            return False

        # 更新销售总量
        pay_order_items = PayOrderItem.query.filter_by(pay_order_id=pay_order_info.id).all()
        notice_content = []
        if pay_order_items:
            date_from = datetime.datetime.now().strftime("%Y-%m-01 00:00:00")
            date_to = datetime.datetime.now().strftime("%Y-%m-31 23:59:59")
            for item in pay_order_items:
                tmp_food_info = Food.query.filter_by(id=item.food_id).first()
                if not tmp_food_info:
                    continue

                notice_content.append("%s %s份" % (tmp_food_info.name, item.quantity))

                # 当月数量
                tmp_stat_info = db.session.query(FoodSaleChangeLog, func.sum(FoodSaleChangeLog.quantity).label("total")) \
                    .filter(FoodSaleChangeLog.food_id == item.food_id) \
                    .filter(FoodSaleChangeLog.created_time >= date_from,
                            FoodSaleChangeLog.created_time <= date_to).first()
                tmp_month_count = tmp_stat_info[1] if tmp_stat_info[1] else 0
                tmp_food_info.total_count += 1
                tmp_food_info.month_count = tmp_month_count
                db.session.add(tmp_food_info)
                db.session.commit()



        ##消息内容
        keyword1_val = "无" if pay_order_info.note=="undefined" else pay_order_info.note
        keyword2_val = "、".join(notice_content)
        keyword3_val = str(pay_order_info.order_sn)[22:]
        keyword4_val = "¥" + str(pay_order_info.total_price) + "元"
        keyword5_val = ""
        keyword6_val = ""
        if pay_order_info.express_info:
            express_info = json.loads(pay_order_info.express_info)
            keyword5_val =  str(express_info['address'])[9:]
            keyword6_val =  str(express_info['mobile'])
        #发送飞蛾云打印订单信息
        target_print = PrintService()
        target_print.addPrinter(app.config['PRINTER']['SN'])
        content = "<CB>奶小君小程序商城订单</CB><BR>"
        content += "名称            数量<BR>"
        content += "-------------------------<BR>"
        for item in notice_content:
            content += item + "<BR>"

        content += "备注："+ keyword1_val + "<BR>"
        content += "-------------------------<BR>"
        content += "合计：" +str(pay_order_info.total_price)+ "元<BR>"
        content += "送货地点:" + keyword5_val + "<BR>"
        content += "联系电话:"+ keyword6_val +"<BR>"
        content += "订餐时间："+ pay_order_info.created_time +"<BR>"
        target_print.printOrder(app.config['PRINTER']['SN'],content)
        # 发送商家短信提醒消息
        account_sid = 'AC08e0af10cd0c1443eff7c993d93a58f0'
        auth_token = '3b7092819d6e2b199ac37f0158795a91'
        client = Client(account_sid, auth_token)
        '''to_list = ['+8615208306035','+8618721013930']
        for to_ in to_list:
            message = client.messages.create(to = to_,
            from_ = "+17575173366",
            body = "小程序新订单提醒：\n"+ "备注:" + keyword1_val +"\n" + "订单编号:" + keyword3_val + "\n" + "订单金额:" + keyword4_val )  
            app.logger.info(message)
            app.logger.info("--------")'''
        message = client.messages.create(to = '+8617313140322',
        from_ = "+17575173366",
        body = "\n小程序新订单提醒：\n"+ "备注:" + keyword1_val +"\n" + "订单编号:" + keyword3_val + "\n" + "订单金额:" + keyword4_val )  
        app.logger.info(message)
        # 发送模板消息
        if pay_order_info.prepay_id != "1":
            # 当prepay_id == 1表示用户接受发订阅消息
            app.logger.info("skip notice~~")
            return
        target_wechat = WeChatService()
        access_token = target_wechat.getAccessToken()
        headers = {'Content-Type': 'application/json'}
        url = "https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token=%s" % access_token
        params = {
            "touser": oauth_bind_info.openid,
            "template_id":"fRKYM_Rv60TYbvzV2NxrSKnr6rfegoByy4bU72wuYA4",
            "page": "pages/my/order_list",
            "data": {
                "thing26": {
                    "value": keyword1_val
                },
                "thing27": {
                    "value": keyword2_val
                },
                "character_string37": {
                    "value": keyword3_val
                },
                "amount12": {
                    "value": keyword4_val
                },
                "thing23": {
                    "value": keyword5_val
                }
            }
        }

        r = requests.post(url=url, data=json.dumps(params).encode('utf-8'), headers=headers)
        r.encoding = "utf-8"
        app.logger.info(r.text)

        return True
