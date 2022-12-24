;
var access_set_ops = {
    init:function(){
        this.eventBind();
    },
    eventBind:function(){
        $(".wrap_access_set .save").click(function(){
            var btn_target = $(this);
            if( btn_target.hasClass("disabled") ){
                common_ops.alert("正在处理!!请不要重复提交~~");
                return;
            }

            var title_target = $(".wrap_access_set input[name=title]");
            var title = title_target.val();

            var urls_target = $(".wrap_access_set textarea[name=urls]");
            var urls = urls_target.val();

            if( title.length < 1 ){
                common_ops.tip( "请输入符合规范的权限名~~",title_target );
                return false;
            }

            reg = /^(\/\w*\/*[\w-]*,)+$/;
            console.info(reg.test(urls))
            if( urls.length < 1 || !reg.test(urls)){
                common_ops.tip( "请输入规范URLS，以','结尾~~",urls_target );
                return false;
            }



            btn_target.addClass("disabled");

            var data = {
                title: title,
                urls: urls,
                id:$(".wrap_access_set input[name=id]").val()
            };

            $.ajax({
                url:common_ops.buildUrl( "/access/set" ),
                type:'POST',
                data:data,
                dataType:'json',
                success:function( res ){
                    btn_target.removeClass("disabled");
                    var callback = null;
                    if( res.code == 200 ){
                        callback = function(){
                            window.location.href = common_ops.buildUrl("/access/index");
                        }
                    }
                    common_ops.alert( res.msg,callback );
                }
            });


        });
    }
};

$(document).ready( function(){
    access_set_ops.init();
} );