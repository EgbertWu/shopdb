DEBUG = True
DBPASS = "Nai!123456%"
SQLALCHEMY_ECHO = True
SQLALCHEMY_DATABASE_URI = 'mysql://naixiaojun:%s@127.0.0.1/shop_db' % DBPASS
SQLALCHEMY_TRACK_MODIFICATIONS = False
SQLALCHEMY_ENCODING = "utf-8"
RELEASE_VERSION = '20200610001'

APP = {
	'domain':'https://www.naixiaojun.cn'
}
