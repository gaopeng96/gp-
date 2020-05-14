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

<%--******回答选择作业******--%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="css/admin.css" media="all">
    <style type="text/css">
        .layui-input{
            width: 370px;
        }
    </style>


    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script src="js/admin.js"></script>

    <script type="text/javascript">
        function onsubmit() {
            var answer = $('input:radio[name="status"]:checked').val();

            location.href="/user/insertHworkContent?answer=" + answer;
        }
    </script>
    <title>做选择题页面</title>
    学生${user.sno}
</head>
<body>
<div class="container" id="a">

    <form class="layui-form layui-form-pane" id="answerHwork" name="answerHwork" role="form" action="/user/insertHworkContent" method="post">

        <div class="layui-form-item">
            <label class="layui-form-label">学生编号</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text"  name="sno" value="${hworkss.sno}" readonly="readonly" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">作业编号</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text"  name="hno"  value="${hworkss.hno}" readonly="readonly" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">作业名称</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text"  name="hname"  value="${hworkss.hname}" readonly="readonly" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">发布老师</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text"  name="tname"  value="${hworkss.tname}" readonly="readonly" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">作业题目</label>

        </div>
        <div class="layui-form-item">
            <div class="layui-form-mid layui-word-aux">${hworkss.hcontent}</div>
        </div>
            <div class="layui-input-block" style="margin-left:10px">
                A：<label><input type="radio" name="shcontent" value="A" checked="checked">${hworkss.selectA}</label>
            </div>
            <div class="layui-input-block" style="margin-left:10px">
                B：<label><input type="radio" name="shcontent" value="B" >${hworkss.selectB}</label>
            </div>
            <div class="layui-input-block" style="margin-left:10px">
                C：<label><input type="radio" name="shcontent" value="C"  >${hworkss.selectC}</label>
            </div>
            <div class="layui-input-block" style="margin-left:10px">
                D：<label><input type="radio" name="shcontent" value="D" >${hworkss.selectD}</label>
            </div>

        <div class="form-group">
            <div class="layui-form-item" style="margin-left: 50px;margin-top: 20px;">
                <button type="submit" class="layui-btn" style="width: 30%"><i class="layui-icon layui-icon-form"></i>保存</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
