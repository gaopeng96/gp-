<%--
  Created by IntelliJ IDEA.
  User: 高鹏
  Date: 2020/4/8
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<%--**********查看学生成绩页面1*********--%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style type="text/css">

    </style>


    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>查看学生成绩页面1</title>
    编号： ${user.tno}
    查看学生成绩页面1
</head>
<body>
<div class="container" id="a">
    <table class="table table-bordered">
        <tr>
            <th>作业编号</th>
            <th>作业名称</th>
            <th>班级编号</th>
            <th>作业题目</th>
            <th>发布时间</th>
            <th>操作</th>
        </tr>

        <c:forEach items="${tHworkList}" var="item">
            <tr>
                <td>${item.hno}</td>
                <td>${item.hname}</td>
                <td>${item.cno}</td>
                <td>${item.hcontent}</td>
                <td>${item.htime}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/user/showGrade/${item.hno}">查看成绩</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <div>


    </div>
</div>
</body>
</html>
