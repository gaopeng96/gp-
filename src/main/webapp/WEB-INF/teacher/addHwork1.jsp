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

<%--******新增作业******--%>
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
        //判断作业号是否存在
        function isExists() {
            //学号格式为至少9位的纯数字
            var reg = /^[0-9]*$/;
            //获取用户输入的账号
            var account = $("#hno").val();
            if(account == null || account == ""){
                $("#account_msg").text("作业编号不能为空！");
                //重新获取焦点并将text中border设置为红色
                window.setTimeout (function(){
                    $("#hno").select().css("border-color","red");
                });
            }else if(!reg.test(account)){//不符合格式提示弹窗
                alert("请输入正确的编号");
                window.setTimeout (function(){
                    $("#hno").select().css("border-color","red");
                });
            }else {
                $.ajax({
                    url: "user/insertHworkCheck",//请求路径
                    type: "post", //请求方式
                    data: "account=" + account, //传给后台的值
                    dataType: "text", //返回类型
                    success: function (responseContent) {
                        //如果返回值为"true" 提示信息；反之不提示；
                        if (responseContent == "true") {
                            $("#account_msg").text("该作业编号已存在");
                            window.setTimeout (function(){
                                $("#hno").select().css("border-color","red");
                            });
                        } else {
                            $("#account_msg").text("");
                            $("#hno").css("border-color","green");
                        }
                    }
                });
            }
        }

        //判断作业内容是否为空
        function  isNcontent() {
            var content = $("#hcontent").val();
            if (content == null || content==""){
                $("#hcontent_msg").text("作业内容不能为空！")
                //重新获取焦点并将text中border设置为红色
                window.setTimeout (function(){
                    $("#hcontent").select().css("border-color","red");
                });
            }else {
                $("#hcontent").css("border-color","green");
                return true;
            }
        }

        //判断作业名称是否为空

        function isHname() {
            var content = $("#hname").val();
            if (content == null || content==""){
                $("#name_msg").text("作业名称不能为空！")
                //重新获取焦点并将text中border设置为红色
                window.setTimeout (function(){
                    $("#hname").select().css("border-color","red");
                });
            }else {
                $("#hname").css("border-color","green");
                $("#name_msg").text("")
                return true;
            }
        }

        //检查表单 即如果用户不处理红色提示，点击注册之后没有反应
        function checkForm() {
            if(isExists()&&isNcontent()&&isHname()){
                alert("添加作业成功!");
                return true;
            }else {
                return false;
            }
        }
    </script>
    <title>新增作业</title>
    老师${user.tno}
</head>
<body>
<div class="container" id="a">

    <form class="layui-form layui-form-pane" id="insertHwork"  role="form" action="/user/insertHwork" method="post">

        <div class="layui-form-item">
            <label class="layui-form-label">教师编号</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text" name="tno" id="tno" value="${user.tno}" readonly="readonly" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">作业编号</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text" name="hno" id="hno" placeholder="请输入作业编号" onblur="isExists()"  class="layui-input">
                <span style="color: red" id="account_msg"></span>
            </div>
            <div class="layui-form-mid layui-word-aux">请输入作业编号</div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">作业名称</label>
            <div class="layui-input-inline layer-inputs">
                <input type="text" name="hname" id="hname" placeholder="请输入作业编号" onblur="isHname()"  class="layui-input">
                <span style="color: red" id="name_msg"></span>
            </div>
            <div class="layui-form-mid layui-word-aux">请输入作业名称</div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">作业题目</label>
            <div class="layui-input-block">
                    <textarea rows="4" cols="50"  name="hcontent" id="hcontent" type="text/plain"  placeholder="请输入作业题目" form="insertHwork" onblur="isNcontent()">

                    </textarea>
                <span style="color: red" id="hcontent_msg"></span>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">发布班级</label>
            <div class="layui-input-inline layer-inputs">
                <select name="clas.cno"  lay-filter="system_role_id">
                    <c:forEach items="${classList}" var="clas">
                        <option value="${clas.cno}">${clas.cname}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="layui-form-mid layui-word-aux">请选择班级</div>
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
