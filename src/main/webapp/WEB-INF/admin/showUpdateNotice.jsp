<%--
  Created by IntelliJ IDEA.
  User: 高鹏
  Date: 2020/4/7
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>


<%--******查看修改公告******--%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style type="text/css">

    </style>


    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#showAddNotice").click(function () {
                location.href="/user/showAddNotice";
            })

        })
    </script>
    <title>查看修改</title>
    管理员${user.ano}
    <span>showUpdateNotice</span>
</head>
<body>
<div class="container" id="a">
    <table class="table table-bordered">
        <tr>
            <th>公告编号</th>
            <th>公告内容姓名</th>
            <th>公告时间</th>
            <th>操作</th>
        </tr>

        <c:forEach items="${noticeList}" var="item">
            <tr>
                <td>${item.nno}</td>
                <td>${item.ncontent}</td>
                <td>${item.ntime}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/user/updateNotice">修改</a>
                    <a href="${pageContext.request.contextPath}/user/searchHwork">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
