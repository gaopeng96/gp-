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

<%--**********作业发布记录页面*********--%>
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
            $("#addHwork").click(function () {
                location.href="/user/showInsertHwork";
            })
        })

        //删除指定作业
        function del() {
            if(confirm("确定要删除吗？")){
                alert("删除成功!")
                return true;
            }else {
                return false;
            }
        }
        function remove(hno,cno) {
            if(del()){
                location.href="/user/deleteHwork?hno="+ hno + "&cno="+cno;
            }
        }


    </script>
    <title>作业发布记录</title>
    编号： ${user.tno}
  作业发布记录页面
</head>
<body>
<div class="container" id="a">
    <table class="table table-bordered">
        <tr>
            <th width>作业编号</th>
            <th width>作业名称</th>
            <th width>班级编号</th>
            <th width>作业题目</th>
            <th width>发布时间</th>
            <th width>操作</th>
        </tr>

        <c:forEach items="${tHworkList}" var="item">
            <tr>
                <td>${item.hno}</td>
                <td>${item.hname}</td>
                <td>${item.cno}</td>
                <td>${item.hcontent}</td>
                <td>${item.htime}</td>
                <td>
                    <button type="button" class="btn btn-default" onclick="remove('${item.hno}','${item.cno}')">删除</button>
                    <a href="${pageContext.request.contextPath}/student/search">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <div>
        <button type="button" class="btn btn-default" id="addHwork">发布作业</button>
    </div>
</div>
</body>
</html>
