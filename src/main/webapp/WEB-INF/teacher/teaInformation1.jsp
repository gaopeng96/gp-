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
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="css/admin.css" media="all">
    <style type="text/css">
        .container{
            margin-top: 10px;
            height: 50%;
            width: 80%;
            position: relative;
        }
    </style>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script src="js/admin.js"></script>
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
        <form class="layui-form layui-form-pane" action="" id="frm-reg" >
            <div class="layui-form-item">
                <label class="layui-form-label">教师编号</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="tno" id="tno" value="${infomation.tno}" readonly="readonly" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">教师姓名</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="tname" id="tname" value="${infomation.tname}" readonly="readonly" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="tname" id="tsex" value="${infomation.tsex}" readonly="readonly" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">年龄</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="tage"  id="tage" value="${infomation.tage}" readonly="readonly" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">所在班级</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="cno" value="${clas.cname}" readonly="readonly" class="layui-input">
                </div>
            </div>

            <div class="form-group">
                <div class="layui-form-item" style="margin-left: 50px;margin-top: 20px;">
                    <button type="button" class="layui-btn" id="update" style="width: 20%"><i class="layui-icon layui-icon-form"></i>修改个人信息</button>
                </div>
            </div>
        </form>

    </div>
</div>
</body>
</html>
