var app = getApp();
Page({
    data: {
        order_list:[],
        statusType: ["待付款", "待发货", "待确认", "待评价", "已完成","已关闭"],
        status:[ "-8","-7","-6","-5","1","0" ],
        currentType: 0,
        tabClass: ["", "", "", "", "", ""]
    },
    statusTap: function (e) {
        var curType = e.currentTarget.dataset.index;
        this.setData({
            currentType: curType
        });
        this.getPayOrder();
    },
    orderDetail: function (e) {
        wx.navigateTo({
            url: "/pages/my/order_info?order_sn=" + e.currentTarget.dataset.id
        })
    },
    onLoad: function (options) {
        // 生命周期函数--监听页面加载
    },
    onShow: function () {
        var that = this;
        this.getPayOrder();
    },
    orderCancel:function( e ){
        this.orderOps( e.currentTarget.dataset.id,"cancel","确认取消订单？" );
    },
    getPayOrder:function(){
        var that = this;
        wx.request({
            url: app.buildUrl("/my/order"),
            header: app.getRequestHeader(),
            data: {
                status: that.data.status[ that.data.currentType ]
            },
            success: function (res) {
                var resp = res.data;
                if (resp.code != 200) {
                    app.alert({"content": resp.msg});
                    return;
                }

                that.setData({
                   order_list:resp.data.pay_order_list
                });
            }
        });
    },
    toPay:function( e ){
        var that = this;
        //这里增加获取用户订阅消息权限，需要将申请的模板id填写进来
        var template_ids = ["gEWJzj_7_7bBej8grUY7V3ZWLLYU2sIp2jNSO5w2Fos" ];
        //默认不能发送消息，当用户明确选择了允许才可以发.
        var can_send = 0;
        var data = {
          order_sn: e.currentTarget.dataset.id,
          can_send: can_send
        };
        wx.requestSubscribeMessage({
          tmplIds: template_ids,
          success:function( res ){
            for (var tmp_id of template_ids ){
              if (res.hasOwnProperty(tmp_id) && res[tmp_id] == "accept"){
                can_send = 1;
              }
            }
            data['can_send'] = can_send;
            //成功调用支付下单
            that.doPay( data );
          },
          fail:function( res ){
            //失败调用支付下单
            that.doPay(data);
          }
        });
    },
    orderConfirm:function( e ){
        this.orderOps( e.currentTarget.dataset.id,"confirm","确认已收到？" );
    },
    orderComment:function( e ){
        wx.navigateTo({
            url: "/pages/my/comment?order_sn=" + e.currentTarget.dataset.id
        });
    },
    orderOps:function(order_sn,act,msg){
        var that = this;
        var params = {
            "content":msg,
            "cb_confirm":function(){
                wx.request({
                    url: app.buildUrl("/order/ops"),
                    header: app.getRequestHeader(),
                    method: 'POST',
                    data: {
                        order_sn: order_sn,
                        act:act
                    },
                    success: function (res) {
                        var resp = res.data;
                        app.alert({"content": resp.msg});
                        if ( resp.code == 200) {
                            that.getPayOrder();
                        }
                    }
                });
            }
        };
        app.tip( params );
    },
    doPay:function( data ){
      wx.request({
        url: app.buildUrl("/order/pay"),
        header: app.getRequestHeader(),
        method: 'POST',
        data: data,
        success: function (res) {
          var resp = res.data;
          if (resp.code != 200) {
            app.alert({ "content": resp.msg });
            return;
          }
          var pay_info = resp.data.pay_info;
          wx.requestPayment({
            'timeStamp': pay_info.timeStamp,
            'nonceStr': pay_info.nonceStr,
            'package': pay_info.package,
            'signType': 'MD5',
            'paySign': pay_info.paySign,
            'success': function (res) {
            },
            'fail': function (res) {
            }
          });
        }
      });
    }
});
