<%--
  Created by IntelliJ IDEA.
  User: 高鹏
  Date: 2020/4/10
  Time: 22:50
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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="css/admin.css" media="all">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style type="text/css">
        .container{
            margin-top: 10px;
            height: 50%;
            width: 80%;
            position: relative;
        }
    </style>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script src="js/admin.js"></script>
    <script type="text/javascript">
        //校验密码的长度
        function checkPwdLength(){
            //获取用户输入的密码
            var password = $("#tpwd1").val();
            var length = password.length;
            if(length >= 6 && length <= 10){
                $("#password_msg1").text("");
                $("#tpwd1").css("border-color","green");
                return true;
            }else{
                $("#password_msg1").text("密码长度应该在6-10位");
                $("#tpwd1").css("border-color","red");
                return false;

            }
        }
        //校验两次密码是否一致
        function confirmPwd() {
            var password = $("#tpwd1").val();
            var conPassword = $("#tpwd").val();
            if(conPassword != password){
                $("#password_msg2").text("两次密码不一致");
                $("#tpwd").css("border-color","red");
                return false;
            }else if(conPassword == null || conPassword == ''){
                $("#password_msg2").text("不能为空！");
                $("#tpwd").css("border-color","red");
                return false;
            }else {
                $("#password_msg2").text("");
                $("#tpwd").css("border-color","green");
                return true;
            }
        }

        //校验输入的和旧密码是否一致
        function pwd() {
            var password = $("#rtpwd").val();
            var repassword = ${teacher.tpwd};
            if(repassword != password){
                $("#password_msg").text("和旧密码不一致");
                $("#rtpwd").css("border-color","red");
                return false;
            }else{
                $("#password_msg").text("");
                $("#rtpwd").css("border-color","green");
                return true;
            }
        }
    </script>
    <script type="text/javascript">

        function checkForm() {
            if(checkPwdLength()&&confirmPwd()&&pwd()){
                if(confirm("确定修改吗?")){
                    alert("修改成功！");
                    return true;
                }
                return true;
            }else {
                return false;
            }
        }
    </script>
    <title>教师修改个人密码</title>
    ${user.tname}
</head>
<body>
<div>
    <div class="container">
        <form class="layui-form layui-form-pane" role="form"  onsubmit="checkForm()"  action="/user/updateTeaPwd" method="post">

            <div class="layui-form-item">
                <label class="layui-form-label">教师编号</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="tno" id="tno" value="${teacher.tno}" readonly="readonly" class="layui-input">
                </div>
            </div>


            <div class="form-group" style="display: none">
                <label class="col-sm-2 control-label">老师姓名：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="tname" id="tname" value="${teacher.tname}">
                </div>
            </div>
            <div class="form-group" style="display: none">
                <label class="col-sm-2 control-label">性别：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="tsex"  value="${teacher.tsex}">
                </div>
            </div>
            <div class="form-group" style="display: none">
                <label class="col-sm-2 control-label">年龄：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="tage"  value="${teacher.tage}">
                    <span style="color: red" id="age_msg"></span>
                </div>
            </div>
            <div class="form-group" style="display: none">
                <label class="col-sm-2 control-label">班级：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="clas.cno" value="${teacher.cno}">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">旧密码</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="password"  id="rtpwd"  placeholder="输入旧密码" onblur="pwd()" class="layui-input">
                    <span style="color: red" id="password_msg"></span>
                </div>
                <div class="layui-form-mid layui-word-aux">请输入旧密码</div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">新密码</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="password"  name="tpwd1" id="tpwd1" placeholder="输入新密码" onblur="checkPwdLength()" class="layui-input">
                    <span style="color: red" id="password_msg1"></span>
                </div>
                <div class="layui-form-mid layui-word-aux">请输入新密码</div>
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label">再次输入</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="password"  name="tpwd" id="tpwd" placeholder="确认密码"  onblur="confirmPwd()" class="layui-input">
                    <span style="color: red" id="password_msg2"></span>
                </div>
                <div class="layui-form-mid layui-word-aux">请再次输入新密码</div>
            </div>

            <div class="form-group">
                <div class="layui-form-item" style="margin-left: 50px;margin-top: 20px;">
                    <button type="submit" class="layui-btn" style="width: 20%"><i class="layui-icon layui-icon-form"></i>保存</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
