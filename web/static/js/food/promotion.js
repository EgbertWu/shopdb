;
var promotion_ops = {
    init:function(){
        this.eventBind();
    },
    eventBind:function(){
        var that = this;
        $(".promotion-add").click( function(){
            that.ops( "recomm",$(this).attr("data") );
        } );

        $(".promotion-del").click( function(){
            that.ops( "delrecomm",$(this).attr("data") );
        } );
    },
    ops:function( act,id ){
        var that = this;
        var btn_target = $(this);
        if(btn_target.hasClass("disabled")){
            common_ops.alert("正在处理，请勿重复提交~~");
            return;
        }

        var subcheck = new Array();

        $("input[name=sub]:checked").each(function () {
            subcheck.push($(this).attr('id'));
        });

        var idstr = subcheck.join(",");

        if (subcheck.length < 1) {
            common_ops.alert("请勾选需操作的产品或者促销活动");
            return;
        }
        if (subcheck.length > 5) {
            common_ops.alert("首页推荐，勾选产品请不要超过5个");
            return;
        }
        btn_target.addClass("disabled");

        var callback = {
            'ok':function(){
                $.ajax({
                    url:common_ops.buildUrl( "/food/promotion-ops" ),
                    type:'POST',
                    data:{
                        act:act,
                        id:idstr
                    },
                    dataType:'json',
                    success:function( res ){
                        btn_target.removeClass("disabled");
                        var callback = null;
                        if( res.code == 200 ){
                            callback = function(){
                                window.location.href = common_ops.buildUrl("/food/index");;
                            }
                        }
                        common_ops.alert( res.msg,callback );
                    }
                });
            },
            'cancel':null
        };
        common_ops.confirm( ( act == "delrecomm" ? "确定取消推广？":"确定推广已选产品？" ), callback );
    }

};

$(document).ready( function(){
    promotion_ops.init();
} );