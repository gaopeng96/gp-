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

<%--******查看修改公告******--%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style type="text/css">

    </style>


    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">

        //判断公告内容是否为空
        function  isNcontent() {
            var content = $("#ncontent").val();
            if (content == null||content == ""){
                alert("公告内容不能为空");
                //重新获取焦点并将text中border设置为红色
                window.setTimeout (function(){
                    $("#ncontent").select().css("border-color","red");
                });
            }else {
                $("#ncontent").css("border-color","green");
                return true;
            }
        }

        //检查表单 即如果用户不处理红色提示，点击注册之后没有反应
        function checkForm() {
            if(isNcontent()){
                if(confirm("确定修改吗？")){
                    alert("修改成功！");
                    return true;
                }
            }else {
                return false;
            }
        }
    </script>
    <title>查看修改公告</title>
    管理员${user.ano}
    <span>查看修改公告页面</span>
</head>
<body>
<div class="container" id="a">

    <form class="form-horizontal" id="updateNotice" onsubmit="checkForm()" role="form" action="/user/updateNotice" method="post">

        <div class="form-group">
            <label class="col-sm-2 control-label">编号</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="nno" value="${notice.nno}" readonly="readonly">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">公告内容</label>
            <div class="col-sm-10">
                <textarea rows="4" cols="50" name="ncontent" id="ncontent" form="updateNotice" onblur="isNcontent()">
                    ${notice.ncontent}
                </textarea>
            </div>

        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">保存</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
