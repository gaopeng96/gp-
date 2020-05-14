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
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style type="text/css">

    </style>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        //校验密码的长度
        function checkPwdLength(){
            //获取用户输入的密码
            var password = $("#spwd1").val();
            var length = password.length;
            if(length >= 6 && length <= 10){
                $("#password_msg1").text("");
                $("#spwd1").css("border-color","green");
                return true;
            }else{
                $("#password_msg1").text("密码长度应该在6-10位");
                $("#spwd1").css("border-color","red");
                return false;

            }
        }
        //校验两次密码是否一致
        function confirmPwd() {
            var password = $("#spwd1").val();
            var conPassword = $("#spwd").val();
            if(conPassword != password){
                $("#password_msg2").text("两次密码不一致");
                $("#spwd").css("border-color","red");
                return false;
            }else if(conPassword == null || conPassword == ''){
                $("#password_msg2").text("不能为空！");
                $("#spwd").css("border-color","red");
                return false;
            }else {
                $("#password_msg2").text("");
                $("#spwd").css("border-color","green");
                return true;
            }
        }

        //校验输入的和旧密码是否一致
        function pwd() {
            var password = $("#rspwd").val();
            var repassword = ${student.spwd};
            if(repassword != password){
                $("#password_msg").text("和旧密码不一致");
                $("#rspwd").css("border-color","red");
                return false;
            }else{
                $("#password_msg").text("");
                $("#rspwd").css("border-color","green");
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
            }else {
                alert("修改失败！")
                return false;
            }
        }
    </script>
    <title>学生修改个人密码</title>
    ${user.sname}
</head>
<body>
<div>
    <div class="container">
        <form class="form-horizontal" role="form"  onsubmit="return checkForm();"  action="/user/updateStuPwd" method="post">

            <div class="form-group">
                <label class="col-sm-2 control-label">学生编号：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="sno" id="sno" value="${student.sno}" readonly="readonly">
                </div>
            </div>

            <div class="form-group" style="display: none">
                <label class="col-sm-2 control-label">学生姓名：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="sname" id="sname" value="${student.sname}">
                </div>
            </div>
            <div class="form-group" style="display: none">
                <label class="col-sm-2 control-label">性别：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="ssex"  value="${student.ssex}">
                </div>
            </div>
            <div class="form-group" style="display: none">
                <label class="col-sm-2 control-label">年龄：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="sage"  value="${student.sage}">
                    <span style="color: red" id="age_msg"></span>
                </div>
            </div>
            <div class="form-group" style="display: none">
                <label class="col-sm-2 control-label">班级：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="clas.cno" value="${student.cno}">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">请输入旧密码：</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control"  id="rspwd" placeholder="输入旧密码" onblur="pwd()">
                    <span style="color: red" id="password_msg"></span>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2 control-label">请输入新密码：</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" name="spwd1" id="spwd1" placeholder="输入新密码" onblur="checkPwdLength()">
                    <span style="color: red" id="password_msg1"></span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">再次输入新密码：</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" name="spwd" id="spwd" placeholder="确认密码"  onblur="confirmPwd()">
                    <span style="color: red" id="password_msg2"></span>
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
