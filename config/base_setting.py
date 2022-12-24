DEBUG = False
SQLALCHEMY_ECHO = False
SERVER_PORT = 8888
JSON_AS_ASCII = False
AUTH_COOKIE_NAME = "sweet shop"

#过滤url
IGNORE_URLS = {
    "^/user/login",
    "^/error/fobidden"
}

IGNORE_CHECK_LOGIN_URLS = {
    "^/static",
    "^/favicon.ico"

}

API_IGNORE_URLS = {
    "^/api"
}

PAGE_SIZE = 50
PAGE_DISPLAY = 10

STATUS_MAPPING = {
    "1":"正常",
    "0":"已删除"
}

MINA_APP = {
    'appid':'wx7b2b0753da44c725',
    'appkey':'a655a354e17f30a125535f7ac088dd2b',
    'mapkey':'NWIBZ-Y2UWD-G2S4J-PGO46-OGPHQ-LUBK4',
    'shoplocation':'江苏省苏州市昆山市花桥镇商务大道99号中信广场4号楼',
    'paykey':'wangwei18621308412wangweinaixiao',
    'mch_id':'1600245367',
    'callback_url':'/api/order/callback'
}

UPLOAD = {
    'ext':['jpg', 'gif', 'bmp', 'jpeg', 'png'],
    'prefix_path':'/web/static/upload/',
    'prefix_url':'/static/upload/'
}

APP = {
    'domain':'https://www.naixiaojun.cn'
}

PAY_STATUS_MAPPING = {
    "1":"已支付",
    "-8":"待支付",
    "0":"已关闭"
}

PAY_STATUS_DISPLAY_MAPPING = {
    "0":"订单关闭",
    "1":"支付成功",
    "-8":"待支付",
    "-7":"待发货",
    "-6":"待确认",
    "-5":"待评价"
}

PRINTER = {
    'URL':"http://api.feieyun.cn/Api/Open/",
    'USER':"702838050@qq.com",
    'UKEY':"YawWVb2GdnCqDTLD",
    'SN':"921559784"
}