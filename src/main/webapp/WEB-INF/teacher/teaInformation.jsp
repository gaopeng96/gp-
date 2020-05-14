<%--
  Created by IntelliJ IDEA.
  User: 高鹏
  Date: 2020/4/10
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style type="text/css">
        .form-control{
            margin: 5px;
        }
        .col-sm-2{
            margin-top: 10px;
        }
        .btn-primary{
            margin-top: 20px;
            margin-left: 100px;
        }
    </style>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#updatePwd").click(function () {
                location.href="/user/showUpdateTeaPwd";
            }),
                $("#update").click(function () {
                    location.href="/user/showUpdateTeacher1";
                })
        })
    </script>
    <title>教师个人信息</title>
    ${user.tname}
</head>
<body>

<div>
    <div class="container">
            <div class="form-group">
                <label class="col-sm-2 control-label">老师编号：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="tno" id="tno" value="${infomation.tno}" readonly="readonly">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">老师姓名：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="tname" id="tname" value="${infomation.tname}" readonly="readonly">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">性别：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="tname" id="tsex" value="${infomation.tsex}" readonly="readonly">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">年龄：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="tage"  id="tage" value="${infomation.tage}" readonly="readonly">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">所带班级：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="cno" value="${clas.cno}:${clas.cname}" readonly="readonly">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-primary" id="update">修改个人信息</button>
                    <button type="button" class="btn btn-primary" id="updatePwd">修改密码</button>
                </div>
            </div>
    </div>
</div>
</body>
</html>
