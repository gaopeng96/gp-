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
    <title>教师头部</title>
</head>
<body>
编号：${user.tno}
${user.tname}老师
<span>个人信息</span>
<a href="${pageContext.request.contextPath}/user/infm">查看个人信息</a><br/>
<span>作业管理</span>
<a href="${pageContext.request.contextPath}/user/selectTeaHwork">查看已发布作业</a><br/>
<a href="${pageContext.request.contextPath}/user/selectNewHwork">查看未批改作业</a><br/>
<span>学生管理</span>
<a href="${pageContext.request.contextPath}/user/selectGradeByTea">查看成绩</a><br/>
<a href="${pageContext.request.contextPath}/user/selectNotHwork">查看未提交学生</a><br/>
</body>
</html>
