;
var role_set_ops = {
    init:function(){
        this.eventBind();
    },
    eventBind:function(){
        $(".wrap_role_set .save").click(function(){
            var btn_target = $(this);
            if( btn_target.hasClass("disabled") ){
                common_ops.alert("正在处理!!请不要重复提交~~");
                return;
            }

            var rolename_target = $(".wrap_role_set input[name=rolename]");
            var rolename = rolename_target.val();



            if( rolename.length < 1 ){
                common_ops.tip( "请输入符合规范的角色名~~",rolename_target );
                return false;
            }


            btn_target.addClass("disabled");

            var data = {
                rolename: rolename,
                rid:$(".wrap_role_set input[name=rid]").val()
            };

            $.ajax({
                url:common_ops.buildUrl( "/role/set" ),
                type:'POST',
                data:data,
                dataType:'json',
                success:function( res ){
                    btn_target.removeClass("disabled");
                    var callback = null;
                    if( res.code == 200 ){
                        callback = function(){
                            window.location.href = common_ops.buildUrl("/role/index");
                        }
                    }
                    common_ops.alert( res.msg,callback );
                }
            });


        });
    }
};

$(document).ready( function(){
    role_set_ops.init();
} );