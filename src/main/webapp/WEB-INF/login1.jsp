<%--
  Created by IntelliJ IDEA.
  User: 高鹏
  Date: 2020/4/9
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
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
    <title>登录</title>
    <link rel="stylesheet" href="lib/layui/css/layui.css" />
    <link rel="stylesheet" href="css/login.css" />
</head>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="js/login.js" charset="utf-8"></script>
<script type="text/javascript">
    function checkAccount() {
        //学号格式为至少9位的纯数字
        var reg = /^\d{2,}$/;
        var username = $("#user_id").val();
        if (username == null || username == "") {
            alert("账户不能为空！");
            return false;
        } else if (!reg.test(username)) {
            alert("请输入符合格式的账号！")
            return false;
        }else{
            return true;
        }
    }
    //判断密码非空
    function  checkPWD() {
        var password = $("#pwd").val();
        if(password == null || password == ""){
            alert("密码不能为空");
            return false;
        }else{
            return true;
        }
    }
</script>
<script type="text/javascript">
    //检查表单
    function checkForm() {
        if(checkAccount()&&checkPWD()){
            return true;
        }else {
            return false;
        }
    }
</script>

<body class="login-bg">
<div class="login layui-anim layui-anim-up">
    <div class="message">后台管理</div>
    <div id="darkbannerwrap"></div>
    <form method="post" class="layui-form" onsubmit="return checkForm();" action="/user/login">
        <input type="text" name="user_id" id="user_id" placeholder="用户名"  class="layui-input" onchange="checkAccount()">
        <hr class="hr15">
        <input type="password" name="pwd" id="pwd" placeholder="密码"  class="layui-input" onchange="checkPWD()">
        <hr class="hr15">
        <select name="userType" id="userType" class="layui-input" style="width:135px">
            <option value="1">管理员</option>
            <option value="2">教师</option>
            <option value="3">学生</option>
        </select>
        <hr class="hr15">
        <div>
            <span style="color: red">${msg}</span>
        </div>
        <input value="登录" lay-submit lay-filter="login" type="submit">
        <hr class="hr10" >
    </form>
</div>
</body>
</html>
