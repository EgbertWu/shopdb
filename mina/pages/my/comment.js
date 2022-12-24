//获取应用实例
var app = getApp();
Page({
    data: {
        "content": "甜蜜的用餐体验",
        "score": 10,
        "order_sn": ""
    },
    onLoad: function (e) {
        var that = this;
        that.setData({
            "order_sn": e.order_sn
        });
    },
    scoreChange: function (e) {
        this.setData({
            "score": e.detail.value
        });
    },
    contentInput: function (e) {
        this.setData({
            "content": e.detail.value
        });
    },
    doComment: function (e) {
        var that = this;
        app.console(that.data.content);
        wx.request({
            url: app.buildUrl("/my/comment/add"),
            header: app.getRequestHeader(),
            method: "POST",
            data: {
                "content": that.data.content,
                "score": that.data.score,
                "order_sn": that.data.order_sn
            },
            success: function (res) {
                var resp = res.data;
                if (resp.code != 200) {
                    app.alert({"content": resp.msg});
                    return;
                }

                wx.navigateTo({
                    url: "/pages/my/commentList"
                });
            }
        });
    }
});