;
var role_index_ops = {
    init:function(){
        this.eventBind();
    },
    eventBind:function(){
        var that = this;
        $(".wrap_search .search").click(function(){
            $(".wrap_search").submit();
        });

        $(".remove").click( function(){
            that.ops( "remove",$(this).attr("data") );
        } );

        $(".recover").click( function(){
            that.ops( "recover",$(this).attr("data") );
        } );
    },
    ops:function( act,rid ){
        var callback = {
            'ok':function(){
                $.ajax({
                    url:common_ops.buildUrl( "/role/ops" ),
                    type:'POST',
                    data:{
                        act:act,
                        rid:rid
                    },
                    dataType:'json',
                    success:function( res ){
                        var callback = null;
                        if( res.code == 200 ){
                            callback = function(){
                                window.location.href = window.location.href;
                            }
                        }
                        common_ops.alert( res.msg,callback );
                    }
                });
            },
            'cancel':null
        };
        common_ops.confirm( ( act == "remove" ? "确定删除？":"确定恢复？" ), callback );
    }

};

$(document).ready( function(){
    role_index_ops.init();
} );