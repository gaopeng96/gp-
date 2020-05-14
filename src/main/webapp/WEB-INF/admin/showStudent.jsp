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
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">

<%--******查看所有学生******--%>
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
            $("#showInsertStudent").click(function () {
                location.href="/user/showInsertStudent";
            })
        })

        //修改学生
        function update(sno) {
            location.href="/user/showUpdateStudent?sno=" + sno;
        }

        //删除指定学生
        function del() {
            if(confirm("确定要删除吗？")){
                alert("删除成功!")
                return true;
            }else {
                return false;
            }
        }
        function remove(sno) {
            if(del()){
                location.href="/user/deleteStudent?sno=" + sno;
            }
        }
    </script>
    <title>查看所有学生</title>
    管理员${user.ano}
</head>
<body>
<div class="container" id="a">
    <div>
        <button type="button" class="btn btn-default" id="showInsertStudent">增加学生</button>
    </div>
    <table class="table table-bordered">
        <tr>
            <th>学生编号</th>
            <th>学生姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>所在班级</th>
            <th>操作</th>
        </tr>

        <c:forEach items="${studentList}" var="item">
            <tr>
                <td>${item.sno}</td>
                <td>${item.sname}</td>
                <td>${item.ssex}</td>
                <td>${item.sage}</td>
                <td>${item.cno}</td>
                <td>
                    <button type="button" class="btn btn-default" onclick="update('${item.sno}')">修改</button>
                    <button type="button" class="btn btn-default" onclick="remove('${item.sno}')">删除</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
