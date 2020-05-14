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

<%--******给学生批改页面******--%>
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
    <script type="text/javascript">

        function isExists() {
            var reg = /^[0-9]*$/;
            var content = $("#grade").val();
            if (content == null || content==""){
                $("#account_msgC").text("得分不能为空！")
                //重新获取焦点并将text中border设置为红色
                window.setTimeout (function(){
                    $("#grade").select().css("border-color","red");
                });
            }else if(!reg.test(content)){//不符合格式提示弹窗
                alert("请输入正确的分数！");
                window.setTimeout (function(){
                    $("#grade").select().css("border-color","red");
                });}
            else {
                $("#grade").css("border-color","green");
                $("#account_msgC").text("")
                return true;
            }
        }
    </script>
    <title>给学生批改页面</title>
    老师${user.tno}
</head>
<body>
<div class="container" id="a">

    <form class="layui-form layui-form-pane" id="updateGrade" role="form" action="/user/updateGrade" method="post">

        <div class="layui-form-item">
            <label class="layui-form-label">学生编号</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text"  id="sno" name="sno" value="${updateGrade.sno}" readonly="readonly" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">学生姓名</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text"  id="sname" name="sname" value="${updateGrade.sname}" readonly="readonly" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">所在班级</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text"  id="cname" name="cname"  value="${updateGrade.cname}" readonly="readonly" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">作业编号</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text"  id="hno" name="hno"  value="${updateGrade.hno}" readonly="readonly" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">作业名称</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text"  id="hname" name="hname"  value="${updateGrade.hname}" readonly="readonly" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">作业题目</label>
            <div class="layui-input-block">
                    <textarea rows="4" cols="50"  name="hcontent" id="hcontent" type="text/plain"  readonly="readonly" form="updateGrade">
                        ${updateGrade.hcontent}
                    </textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">学生答案</label>
            <div class="layui-input-block">
                    <textarea rows="4" cols="50"  name="shcontent" form="updateGrade" type="text/plain"  readonly="readonly" form="updateGrade">
                        ${updateGrade.shcontent}
                    </textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">得分</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text"  name="grade" id="grade"  class="layui-input" onblur="isExists()">
                <span style="color: red" id="account_msgC"></span>
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
