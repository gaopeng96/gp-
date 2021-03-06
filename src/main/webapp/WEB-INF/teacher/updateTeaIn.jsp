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
    <style type="text/css">

    </style>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        //校验密码的长度
        function checkPwdLength(){
            //获取用户输入的密码
            var password = $("#tpwd1").val();
            var length = password.length;
            if(length >= 6 && length <= 10){
                $("#password_msg1").text("");
                $("#tpwd1").css("border-color","green");
                return true;
            }else{
                $("#password_msg1").text("密码长度应该在6-10位");
                $("#tpwd1").css("border-color","red");
                return false;

            }
        }
        //校验两次密码是否一致
        function confirmPwd() {
            var password = $("#tpwd1").val();
            var conPassword = $("#tpwd").val();
            if(conPassword != password){
                $("#password_msg2").text("两次密码不一致");
                $("#tpwd").css("border-color","red");
                return false;
            }else if(conPassword == null || conPassword == ''){
                $("#password_msg2").text("不能为空！");
                $("#tpwd").css("border-color","red");
                return false;
            }else {
                $("#password_msg2").text("");
                $("#tpwd").css("border-color","green");
                return true;
            }
        }

        //校验输入的和旧密码是否一致
        function pwd() {
            var password = $("#rtpwd").val();
            var repassword = ${teacher.tpwd};
            if(repassword != password){
                $("#password_msg").text("和旧密码不一致");
                $("#rtpwd").css("border-color","red");
                return false;
            }else{
                $("#password_msg").text("");
                $("#rtpwd").css("border-color","green");
                return true;
            }
        }

        //检测姓名
        function checkName() {
            //姓名格式:中英文不能同时出现，英文可以包含英文的点，长度在20个以内
            var reg = /^([\u4e00-\u9fa5]{1,20}|[a-zA-Z\.\s]{1,20})$/;
            //获取用户输入的姓名
            var name = $("#tname").val();
            if(!reg.test(name)){
                $("#tname").css("border-color","red");
                $("#name_msg").text("请输入正确的姓名！不能含有特殊符号！");
                return false;
            }else{
                $("#tname").css("border-color","green");
                return true;
            }

        }

        //检测年龄
        function checkAge() {
            //年龄必须为纯数字
            var reg = /^[0-9]*$/;
            //获取用户输入的年龄
            var userAge = $("#tage").val();
            if(!reg.test(userAge)){
                $("#age_msg").text("年龄必须为纯数字");
                $("#tage").css("border-color","false");
                return false;
            }else if(userAge <= 15 || userAge >= 120){
                $("#age_msg").text("年龄应该在15-120之间");
                $("#tage").css("border-color","false");
                return false;
            }else{
                $("#age_msg").text("");
                $("#tage").css("border-color","green");
                return true;
            }
        }
    </script>
    <script type="text/javascript">
        function checkForm() {
            if(checkAge()&&checkName()){
                if(confirm("确定修改吗?")){
                    alert("修改成功！");
                    return true;
                }
            }else {
                return false;
            }
        }
    </script>
    <title>教师修改个人信息</title>
    ${user.tname}
</head>
<body>
<div>
    <div class="container">
        <form class="form-horizontal" role="form"  onsubmit="return checkForm();"  action="/user/updateTeacher1" method="post">

            <div class="form-group">
                <label class="col-sm-2 control-label">老师编号：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="tno" id="tno" value="${teacher.tno}" readonly="readonly">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">老师姓名：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="tname" id="tname" value="${teacher.tname}" onblur="checkName()">
                    <span style="color: red" id="name_msg"></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">性别：</label>
                <div class="col-sm-10">
                    <select class="form-control" name="tsex">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">年龄：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="tage"  id="tage" value="${teacher.tage}" onblur="checkAge()">
                    <span style="color: red" id="age_msg"></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">班级：</label>
                <div class="col-sm-10">
                    <%--<input type="text" class="form-control" name="clas.cno" value="${teacher.cno}">--%>
                    <select class="form-control" name="clas.cno">
                        <c:forEach items="${classList}" var="clas">
                            <option value="${clas.cno}">${clas.cname}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group" style="display: none">
                <label class="col-sm-2 control-label">再次输入新密码：</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" name="tpwd" id="tpwd"  value="${teacher.tpwd}">
                    <span style="color: red" id="password_msg2"></span>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary">提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
