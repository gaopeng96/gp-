<%--
  Created by IntelliJ IDEA.
  User: 高鹏
  Date: 2020/4/10
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

    <style type="text/css">
       .container{
           height: 50%;
           width: 80%;
           position: relative;
       }
    </style>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">

        //判断用户是否存在
        function isExists() {
            //学号格式为至少9位的纯数字
            var reg = /^[0-9]*$/;
            //获取用户输入的账号
            var account = $("#nno").val();
            if(account == null || account == ""){
                $("#account_msg").text("编号不能为空！")
                //重新获取焦点并将text中border设置为红色
                window.setTimeout (function(){
                    $("#nno").select().css("border-color","red");
                });
            }else if(!reg.test(account)){//不符合格式提示弹窗
                alert("请输入正确的编号");
                window.setTimeout (function(){
                    $("#nno").select().css("border-color","red");
                });
            }else {
                $.ajax({
                    url: "user/insertCheck",//请求路径
                    type: "post", //请求方式
                    data: "account=" + account, //传给后台的值
                    dataType: "text", //返回类型
                    success: function (responseContent) {
                        //如果返回值为"true" 提示信息；反之不提示；
                        if (responseContent == "true") {
                            $("#account_msg").text("该公告已存在");
                            window.setTimeout (function(){
                                $("#nno").select().css("border-color","red");
                            });
                        } else {
                            $("#account_msg").text("");
                            $("#nno").css("border-color","green");
                        }
                    }
                });
            }
        }
        //判断公告内容是否为空
        function  isNcontent() {
            var content = $("#ncontent").val();
            if (content == null||content == ""){
                alert("公告内容不能为空");
                //重新获取焦点并将text中border设置为红色
                window.setTimeout (function(){
                    $("#ncontent").select().css("border-color","red");
                });
            }else {
                $("#ncontent").css("border-color","green");
                return true;
            }
        }
    </script>
    <script type="text/javascript">
        //检查表单 即如果用户不处理红色提示，点击注册之后没有反应
        function checkForm() {
            if(isNcontent()&&isExists()){
                if(confirm("确认添加吗？")){
                    layer.closeAll('loading');
                }
                return true;
            }else {
                return false;
            }
        }
    </script>

    <title>增加公告</title>
</head>
<body>

<div>
    <div class="container">
        <form class="form-horizontal" role="form" onsubmit="checkForm();" action="user/insertNotice" method="post" id="addNotice">

            <div class="form-group">
                <label class="col-sm-2 control-label">公告编号：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="nno" id="nno" placeholder="请输入编号"  style="width: 30%;" onblur="isExists()">
                    <span style="color: red" id="account_msg"></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">公告内容：</label>
                <div class="col-sm-10">
                    <textarea rows="4" cols="50"  name="ncontent" id="ncontent" form="addNotice" onblur="isNcontent()">

                    </textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary">提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
