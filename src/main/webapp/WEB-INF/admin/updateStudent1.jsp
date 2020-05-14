<%--
  Created by IntelliJ IDEA.
  User: 高鹏
  Date: 2020/4/10
  Time: 21:25
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
    <script src="lib/layui/layui.js"></script>
    <script src="js/admin.js"></script>
    <script type="text/javascript">

        //判断用户是否存在
        function isExists() {
            //学号格式为至少9位的纯数字
            var reg = /^[0-9]*$/;
            //获取用户输入的账号
            var account = $("#sno").val();
            if(account == null || account == ""){
                alert("编号号不能为空");
                //重新获取焦点并将text中border设置为红色
                window.setTimeout (function(){
                    $("#sno").select().css("border-color","red");
                });
            }else if(!reg.test(account)){//不符合格式提示弹窗
                alert("请输入正确的编号");
                window.setTimeout (function(){
                    $("#sno").select().css("border-color","red");
                });
            }else {
                $.ajax({
                    url: "user/insertStuCheck",//请求路径
                    type: "post", //请求方式
                    data: "account=" + account, //传给后台的值
                    dataType: "text", //返回类型
                    success: function (responseContent) {
                        //如果返回值为"true" 提示信息；反之不提示；
                        if (responseContent == "true") {
                            $("#account_msg").text("该学生编号已存在");
                            window.setTimeout (function(){
                                $("#sno").select().css("border-color","red");
                            });
                        } else {
                            $("#account_msg").text("");
                            $("#sno").css("border-color","green");
                        }
                    }
                });
            }
        }

        //校验密码的长度
        function checkPwdLength(){
            //获取用户输入的密码
            var password = $("#spwd").val();
            var length = password.length;
            if(length >= 6 && length <= 10){
                $("#password_msg").text("");
                $("#spwd").css("border-color","green");
                return true;
            }else{
                $("#password_msg").text("密码长度应该在6-10位");
                $("#spwd").css("border-color","red");
                return false;

            }
        }
        //校验两次密码是否一致
        function confirmPwd() {
            var password = $("#tpwd").val();
            var conPassword = $("#retpwd").val();
            if(conPassword != password){
                $("#conPwd_msg").text("两次密码不一致");
                $("#retpwd").css("border-color","red");
                return false;
            }else{
                $("#conPwd_msg").text("");
                $("#retpwd").css("border-color","green");
                return true;
            }
        }
        //校验年龄是否满足在15-120之间
        function checkAge() {
            //年龄必须为纯数字
            var reg = /^[0-9]*$/;
            //获取用户输入的年龄
            var userAge = $("#sage").val();
            if(!reg.test(userAge)){
                alert("年龄必须为纯数字");
            }else if(userAge <= 15 || userAge >= 120){
                $("#age_msg").text("年龄应该在15-120之间");
                $("#sage").css("border-color","false");
                return false;
            }else{
                $("#age_msg").text("");
                $("#sage").css("border-color","green");
                return true;
            }
        }

        //校验姓名格式：要么全中文要么英文含有英文空格和英文点
        function checkName() {
            //姓名格式:中英文不能同时出现，英文可以包含英文的点，长度在20个以内
            var reg = /^([\u4e00-\u9fa5]{1,20}|[a-zA-Z\.\s]{1,20})$/;
            //获取用户输入的姓名
            var name = $("#sname").val();
            if(!reg.test(name)){
                alert("请输入正确的姓名！不能含有特殊符号！");
                $("#sname").css("border-color","red");
                return false;
            }else{
                $("#sname").css("border-color","green");
                return true;
            }
        }
    </script>
    <script type="text/javascript">
        //检查表单 即如果用户不处理红色提示，点击注册之后没有反应
        function checkForm() {
            if(checkName()&&checkAge()&&checkPwdLength()){
                if(confirm("确定修改吗?")){
                    alert("修改成功！");
                    return true;
                }
            }else {
                return false;
            }
        }
    </script>

    <title>修改学生信息</title>
</head>
<body>

<div>
    <div class="container">
        <form class="layui-form layui-form-pane" role="form"  onsubmit="checkForm()"  action="/user/updateStudent" method="post">

            <div class="layui-form-item">
                <label class="layui-form-label">学生编号</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="sno" id="sno"  class="layui-input" value="${student.sno}"  onblur="isExists()">
                    <span style="color: red" id="account_msg"></span>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="spwd" id="spwd"  value="${student.spwd}" onblur="checkPwdLength()" class="layui-input">
                    <span style="color: red" id="password_msg"></span>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">学生姓名</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="sname" id="sname"  value="${student.sname}"  onblur="checkName()" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-inline layer-inputs">
                    <select name="ssex"  lay-filter="system_role_id">
                        <option value="男" selected="selected">男</option>
                        <option value="女" selected="selected">女</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">年龄</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="sage"  id="sage"  value="${student.sage}" class="layui-input" onblur="checkAge()">
                    <span style="color: red" id="age_msg"></span>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">班级</label>
                <div class="layui-input-inline layer-inputs">
                    <select name="clas.cno"  lay-filter="system_role_id">
                        <c:forEach items="${classList}" var="clas">
                            <option value="${clas.cno}">${clas.cname}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="layui-form-item" style="margin-left: 50px;margin-top: 20px;">
                    <button type="submit" class="layui-btn" style="width: 30%"><i class="layui-icon layui-icon-form"></i>保存</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
