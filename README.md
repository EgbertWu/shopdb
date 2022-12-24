# apporder

#### 介绍
小程序商城

#### 软件架构
软件架构说明


#### 安装教程

Python Flask订餐系统
=====================
##启动
* export ops_config=local|production && python manage.py runserver

##flask-sqlacodegen

    flask-sqlacodegen 'mysql://root:123456@127.0.0.1/food_db' --outfile "common/models/model.py"  --flask
    flask-sqlacodegen 'mysql://root:123456@127.0.0.1/food_db' --tables user --outfile "common/models/user.py"  --flask

## 所见即所得编辑器ueditor

    <script src="{{ buildStaticUrl('/plugins/ueditor/ueditor.config.js') }}"></script>
    <script src="{{ buildStaticUrl('/plugins/ueditor/ueditor.all.min.js') }}"></script>
    <script src="{{ buildStaticUrl('/plugins/ueditor/lang/zh-cn/zh-cn.js') }}"></script>


    UE.getEditor('editor',{
       toolbars: [
            [ 'undo', 'redo', '|',
                'bold', 'italic', 'underline', 'strikethrough', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall',  '|','rowspacingtop', 'rowspacingbottom', 'lineheight'],
            [ 'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
                'directionalityltr', 'directionalityrtl', 'indent', '|',
                'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
                'link', 'unlink'],
            [ 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
                'insertimage', 'insertvideo', '|',
                'horizontal', 'spechars','|','inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols' ]

        ],
        enableAutoSave:true,
        saveInterval:60000,
        elementPathEnabled:false,
        zIndex:4,
        serverUrl:common_ops.buildUrl(  '/upload/ueditor' )
    });



##可参考资料
* [python-Flask（jinja2）语法：过滤器](https://www.jianshu.com/p/3127ac233518)
* [SQLAlchemy 各种查询语句写法](https://wxnacy.com/2017/08/14/python-2017-08-14-sqlalchemy-filter/)


#### 使用说明

1.  xxxx
2.  xxxx
3.  xxxx

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request


#### 码云特技

1.  使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2.  码云官方博客 [blog.gitee.com](https://blog.gitee.com)
3.  你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解码云上的优秀开源项目
4.  [GVP](https://gitee.com/gvp) 全称是码云最有价值开源项目，是码云综合评定出的优秀开源项目
5.  码云官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6.  码云封面人物是一档用来展示码云会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
