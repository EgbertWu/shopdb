;
var role_access_set_ops = {
    init:function(){
        this.eventBind();
    },
    eventBind:function(){
        $(".wrap_role_access_set .save").click(function(){

            var btn_target = $(this);
            if( btn_target.hasClass("disabled") ){
                common_ops.alert("正在处理!!请不要重复提交~~");
                return;
            }

            var access_check_ids = [];


            $(".wrap_role_access_set input[name=access_ids]:checked").each(function () {
                access_check_ids.push( $(this).val());
            });

            access_idstr = access_check_ids.join(',');

            btn_target.addClass("disabled");

            var data = {
                access_ids: access_idstr,
                id:$(".wrap_role_access_set input[name=id]").val()
            };

            $.ajax({
                url:common_ops.buildUrl( "/role/roleaccess" ),
                type:'POST',
                data:data,
                dataType:'json',
                success:function( res ){
                    btn_target.removeClass("disabled");
                    var callback = null;
                    if( res.code == 200 ){
                        callback = function(){
                           window.location.href = window.location.href;
                        }
                    }
                    common_ops.alert( res.msg,callback );
                }
            });
        });
    }
};

$(document).ready( function(){
    role_access_set_ops.init();
} );