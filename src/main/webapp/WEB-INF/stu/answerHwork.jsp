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

<%--******回答作业******--%>
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
    <script type="text/javascript">

    </script>
    <title>做作业页面</title>
    学生${user.sno}
</head>
<body>
<div class="container" id="a">

    <form class="layui-form layui-form-pane" id="answerHwork" name="answerHwork" role="form" action="/user/insertShContent" method="post">

        <div class="layui-form-item">
            <label class="layui-form-label">学生编号</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text"  name="sno" value="${hwork.sno}" readonly="readonly" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">作业编号</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text"  name="hno"  value="${hwork.hno}" readonly="readonly" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">作业名称</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text"  name="hno"  value="${hwork.hname}" readonly="readonly" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">发布老师</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text"  name="tname"  value="${hwork.tname}" readonly="readonly" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">作业题目</label>
            <div class="layui-input-block">
                    <textarea rows="4" cols="50"  name="hcontent" type="text/plain" id="hcontent" placeholder="请输入公告内容" form="answerHwork" readonly="readonly">
                        ${hwork.hcontent}
                    </textarea>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">作业答案</label>
            <div class="layui-input-block">
                    <textarea rows="4" cols="50"  name="shcontent" type="text/plain"  placeholder="请输入答案" form="answerHwork">

                    </textarea>
            </div>
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
