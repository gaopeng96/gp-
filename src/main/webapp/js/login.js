﻿$(function  () {
    layui.use('form', function(){
        var form = layui.form;
        form.on('submit(login)', function(data){
            if(data.field.username == ""){
                layer.msg("请输入登录账号",{icon:2,time:1000});return false;
            }
            if(data.field.password.length < 6){
                layer.msg("登录密码最少6位数",{icon:2,time:1000});return false;
            }
            return false;
        });
    });
})