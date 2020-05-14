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
    <script src="lib/layui/layui.js"></script>
    <script src="js/admin.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">

        //判断用户是否存在
        function isExists() {
            //学号格式为纯数字
            var reg = /^[0-9]*$/;
            //获取用户输入的账号
            var account = $("#tno").val();
            if(account == null || account == ""){
                alert("编号号不能为空");
                //重新获取焦点并将text中border设置为红色
                window.setTimeout (function(){
                    $("#tno").select().css("border-color","red");
                });
            }else if(!reg.test(account)){//不符合格式提示弹窗
                alert("请输入正确的编号");
                window.setTimeout (function(){
                    $("#tno").select().css("border-color","red");
                });
            }else {
                $.ajax({
                    url: "user/insertTeaCheck",//请求路径
                    type: "post", //请求方式
                    data: "account=" + account, //传给后台的值
                    dataType: "text", //返回类型
                    success: function (responseContent) {
                        //如果返回值为"true" 提示信息；反之不提示；
                        if (responseContent == "true") {
                            $("#account_msg").text("该教师编号已存在");
                            window.setTimeout (function(){
                                $("#tno").select().css("border-color","red");
                            });
                        } else {
                            $("#account_msg").text("");
                            $("#tno").css("border-color","green");
                        }
                    }
                });
            }
        }
        //判断公告内容是否为空
        function  isNcontent() {
            var content = $("#ncontent").val();
            if (content == null || content==""){
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
        //校验年龄是否满足在15-120之间
        function checkAge() {
            //年龄必须为纯数字
            var reg = /^[0-9]*$/;
            //获取用户输入的年龄
            var userAge = $("#tage").val();
            if(!reg.test(userAge)){
                alert("年龄必须为纯数字");
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

        //校验姓名格式：要么全中文要么英文含有英文空格和英文点
        function checkName() {
            //姓名格式:中英文不能同时出现，英文可以包含英文的点，长度在20个以内
            var reg = /^([\u4e00-\u9fa5]{1,20}|[a-zA-Z\.\s]{1,20})$/;
            //获取用户输入的姓名
            var name = $("#tname").val();
            if(!reg.test(name)){
                alert("请输入正确的姓名！不能含有特殊符号！");
                $("#tname").css("border-color","red");
                return false;
            }else{
                $("#tname").css("border-color","green");
                return true;
            }

        }
    </script>
    <script type="text/javascript">
        //检查表单 即如果用户不处理红色提示，点击注册之后没有反应
        function checkForm() {
            if(checkName()&&checkAge()){
                alert("添加老师成功!");
                return true;
            }else {
                return false;
            }
        }
    </script>

    <title>增加老师</title>
</head>
<body>

<div>
    <div class="container">
        <form class="layui-form layui-form-pane" role="form"  onsubmit="checkForm()"  action="/user/insertTeacher" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">老师编号</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="tno" id="tno"  placeholder="请输入编号" onblur="isExists()"  class="layui-input">
                    <span style="color: red" id="account_msg"></span>
                </div>
                <div class="layui-form-mid layui-word-aux">请输入老师编号</div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="password" name="tpwd" id="tpwd" value="123456" readonly="readonly" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">原始密码:123456</div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">老师姓名</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="tname" id="tname"  placeholder="请输入姓名"  onblur="checkName()" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">请输入老师姓名</div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-inline layer-inputs">
                    <select name="tsex"  lay-filter="system_role_id">
                        <option value="男" selected="selected">男</option>
                        <option value="女" selected="selected">女</option>
                    </select>
                </div>
                <div class="layui-form-mid layui-word-aux">请选择性别</div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">年龄</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="tage"  id="tage"  placeholder="请输入年龄"  onblur="checkAge()" class="layui-input">
                    <span style="color: red" id="age_msg"></span>
                </div>
                <div class="layui-form-mid layui-word-aux">请输入老师年龄</div>
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
                <div class="layui-form-mid layui-word-aux">请选择班级</div>
            </div>

            <div class="form-group">
                <div class="layui-form-item" style="margin-left: 50px;margin-top: 20px;">
                    <button type="submit" class="layui-btn" style="width: 70%"><i class="layui-icon layui-icon-form"></i>保存</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
