<%--
  Created by IntelliJ IDEA.
  User: 高鹏
  Date: 2020/4/9
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
        <%--登录页面--%>

<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style type="text/css">
        /*登录界面样式开始*/
        .login {
            width: 500px;
            height: 250px;
            background: rgba(99, 190, 171, 0.75);
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -170px 0 0 -250px;
        }
        .loginmain {
            padding: 20px;
            color: #fff;
            text-align: center;
        }
        .loginmain ul li {
            margin-top: 15px;
            list-style: none;
        }
        .loginmain ul li span {
            display: inline-block;
            width: 125px;
            height: 30px;
            text-align: right;
            font-size: 14px;
        }
        .loginmain ul li input[type="text"], .loginmain ul li input[type="password"] {
            width: 250px;
            height: 30px;
            padding: 0 5px;
        }
        .loginmain ul li input[type="button"] {
            width: 80px;
            height: 34px;
            border: none;
            background: #297d6d;
            color: #fff;
            font-size: 14px;
            cursor: pointer;
            vertical-align: middle;
            padding: auto;
        }
        .loginmain ul li input[type="button"]:hover {
            background: #3a7d5d;
        }
        .loginmain span#text {
            display: inline-block;
            width: 130px;
            height: 34px;
            line-height: 34px;
        }
        input, select{
            color:black;
        }
        /*登录界面样式结束*/
    </style>
</head>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

    //判断账号非空
    $("#user").change(function () {
        var username = $("#user").val();
        if(username == null || username == ""){
            alert("账户不能为空");
        }
    });
    //判断密码非空
    $("#pwd").change(function () {
        var password = $("#pwd").val();
        if(password == null || password == ""){
            alert("密码不能为空");
        }
    });


</script>


<div class="login">
    <div class="loginmain">
        <h4>欢迎来到学生作业管理系统</h4>
        <form action="${pageContext.request.contextPath }/user/login" onsubmit="checkForm()" role="form" method="post">
            <ul>
                <li>
                    登 &nbsp; 陆: &nbsp;<input type="text" name="user_id" id="user" placeholder="请输入学号或教师号" onblur="isExists()"/><br />
                </li>
                <li>
                    密 &nbsp; 码: &nbsp;<input type="password" name="pwd" id="pwd" placeholder="请输入密码" onblur="isNcontent()"/><br />
                </li>
                <span style="color: red;margin-left: -100px;" id="msg" >${msg}</span>
                <li>
                    选择您的用户类别：
                    <select name="userType" id="userType">
                        <option value="1">管理员</option>
                        <option value="2">教师</option>
                        <option value="3">学生</option>
                    </select>
                    <br />
                </li>
                <li>
                    <input type="submit" name="submit" value="登陆" />
                    &nbsp; &nbsp; &nbsp;
                    <input type="reset" name="reset" value="重置"/>
                    <br />
                </li>
            </ul>
        </form>
    </div>
</div>

</body>
</html>
