;
var food_clear_ops = {
    init:function(){
        this.eventBind();
    },
    eventBind: function () {
        var that = this;
        $(".clear-food").click(function () {

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
                common_ops.alert("请勾选需操作的产品");
                return;
            }

            btn_target.addClass("disabled");
            var callback = {
                'ok': function () {
                    $.ajax({
                        url: common_ops.buildUrl("/food/clearfood"),
                        type: 'POST',
                        data: {
                            id: idstr
                        },
                        dataType: 'json',
                        success: function (res) {
                            btn_target.removeClass("disabled");
                            var callback = null;
                            if (res.code == 200) {
                                callback = function () {
                                    window.location.href = common_ops.buildUrl("/food/index");
                                }
                            }
                            common_ops.alert(res.msg, callback);
                        }
                    });
                },
                'cancel': null
            };
            common_ops.confirm(("彻底删除产品后不可恢复，确定删除？"), callback);
        });
    }
};

$(document).ready( function(){
    food_clear_ops.init();
} );