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

<%--******查看作业详情******--%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="css/admin.css" media="all">
    <style type="text/css">

    </style>


    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="lib/layui/layui.js" type="text/javascript"></script>
    <script src="js/admin.js" type="text/javascript"></script>

    <title>查看作业详情页面</title>
    老师${user.tno}
</head>
<body>
<div class="container" id="a">

    <form class="layui-form layui-form-pane"  role="form" action="" method="post">

        <div class="layui-form-item">
            <label class="layui-form-label">发布老师</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text"  id="tno" name="tno"  value="${hwork.tno}" readonly="readonly" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">作业编号</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text"  id="hno" name="hno"  value="${hwork.hno}" readonly="readonly" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">作业名称</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text"  id="hname" name="hname"  value="${hwork.hname}" readonly="readonly" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">作业题目</label>
            <div class="layui-input-block">
                    <textarea rows="4" cols="50"  name="hcontent" id="hcontent" type="text/plain"  readonly="readonly" form="updateGrade">
                        ${hwork.hcontent}
                    </textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">发布班级</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text"  id="cno" name="cno"  value="${hwork.cno}" readonly="readonly" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">发布时间</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text"  id="htime" name="htime"  value="${hwork.htime}" readonly="readonly" class="layui-input">
            </div>
        </div>

    </form>
</div>
</body>
</html>
