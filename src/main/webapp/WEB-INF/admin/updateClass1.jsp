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

<%--******查看修改班级******--%>
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
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        //判断班级名称是否为空
        function  isNcontent() {
            var content = $("#cname").val();
            if (content == null||content == ""){
                $("#name_msg").text("班级名称不能为空！")
                //重新获取焦点并将text中border设置为红色
                window.setTimeout (function(){
                    $("#cname").select().css("border-color","red");
                });
            }else {
                $("#cname").css("border-color","green");
                $("#name_msg").text("")
                return true;
            }
        }
        //检查表单 即如果用户不处理红色提示，点击注册之后没有反应
        function checkForm() {
            if(isNcontent()){
                if(confirm("确定修改吗?")){
                    alert("修改成功！");
                    return true;
                }
            }else {
                return false;
            }
        }
    </script>
    <title>查看修改班级</title>
    管理员${user.ano}
    <span>查看修改班级页面</span>
</head>
<body>
<div class="container" id="a">

    <form class="layui-form layui-form-pane" id="updateClass" onsubmit="checkForm()" role="form" action="/user/updateClass" method="post">

        <div class="layui-form-item">
            <label class="layui-form-label">班级编号：</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text" class="layui-input" name="cno" id="cno" value="${clas.cno}" readonly="readonly">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">班级名称:</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text" class="layui-input" name="cname" id="cname" value="${clas.cname}" onblur="isNcontent()">
                <span style="color: red" id="name_msg"></span>
            </div>
        </div>

        <div class="form-group">
            <div class="layui-form-item" style="margin-left: 50px;margin-top: 20px;">
                <button type="submit" class="layui-btn" style="width: 70%"><i class="layui-icon layui-icon-form"></i>保存</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
