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

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style type="text/css">

    </style>


    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>

        $(document).ready(function () {
            $("#show").ready(function () {
                var a = ${item.shtime};
                if(a==null){
                    document.write("未提交")
                }else {
                    document.write(a);
                }
            })
        })

        //重新打分
        function update(hno,sno) {
            location.href="/user/showUpdateNotice?hno=" + hno + "&sno"+sno;
        }
    </script>
    <title>老师查看学生作业成绩</title>
</head>
<body>
<div class="container" id="a">
    <table class="table table-bordered">
        <tr>
            <th>作业编号</th>
            <th>学生编号</th>
            <th>班级编号</th>
            <th>作业名称</th>
            <th>作业题目</th>
            <th>学生答案</th>
            <th>得分</th>
            <th>操作</th>
        </tr>

        <c:forEach items="${showGradeList}" var="item">
            <tr>
                <td>${item.hno}</td>
                <td>${item.sno}</td>
                <td>${item.cno}</td>
                <td>${item.hname}</td>
                <td>${item.hcontent}</td>
                <td>${item.shcontent}</td>
                <td>${item.grade}</td>
                <td>
                    <button type="button" class="btn btn-default" onclick="update('${item.hno}','${item.sno}')">重新打分</button>
                </td>
            </tr>
        </c:forEach>
    </table>


</div>
</body>
</html>
