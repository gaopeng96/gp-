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
    <title>学生头部</title>
</head>
<body>
学号：${user.sno}
${user.sname}同学<br>
<a href="${pageContext.request.contextPath}/user/stuInfm">查看个人信息</a><br/>
<a href="${pageContext.request.contextPath}/user/searchGrade">查看作业成绩</a><br/>
<a href="${pageContext.request.contextPath}/user/searchHwork">查看新作业</a><br/>
</body>
</html>
