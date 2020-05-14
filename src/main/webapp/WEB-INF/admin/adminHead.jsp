<%--
  Created by IntelliJ IDEA.
  User: 高鹏
  Date: 2020/4/9
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>管理员头部</title>
</head>
<body>
管理员${user.ano}<br>
<span>公告管理</span><br>
<a href="${pageContext.request.contextPath}/user/selectNotice">公告展示</a><br/>
<span>班级管理</span>
<a href="${pageContext.request.contextPath}/user/selectClass">班级管理</a><br/>
<span>教师管理</span>
<a href="${pageContext.request.contextPath}/user/selectTeacher">显示所有教师</a><br/>
<span>学生管理</span>
<a href="${pageContext.request.contextPath}/user/selectStudent">显示所有学生</a><br/>

</body>
</html>
