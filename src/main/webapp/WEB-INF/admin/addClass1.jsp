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

    <style type="text/css">
       .container{
           height: 50%;
           width: 80%;
           position: relative;
       }
    </style>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">

        //判断用户是否存在
        function isExists() {
            //学号格式为至少9位的纯数字
            var reg = /^[0-9]*$/;
            //获取用户输入的账号
            var account = $("#cno").val();
            if(account == null || account == ""){
                $("#account_msg").text("编号不能为空！")
                //重新获取焦点并将text中border设置为红色
                window.setTimeout (function(){
                    $("#cno").select().css("border-color","red");
                });
            }else if(!reg.test(account)){//不符合格式提示弹窗
                alert("请输入正确的编号");
                window.setTimeout (function(){
                    $("#cno").select().css("border-color","red");
                });
            }else {
                $.ajax({
                    url: "user/insertClassCheck",//请求路径
                    type: "post", //请求方式
                    data: "account=" + account, //传给后台的值
                    dataType: "text", //返回类型
                    success: function (responseContent) {
                        //如果返回值为"true" 提示信息；反之不提示；
                        if (responseContent == "true") {
                            $("#account_msg").text("该班级已存在");
                            window.setTimeout (function(){
                                $("#cno").select().css("border-color","red");
                            });
                        } else {
                            $("#account_msg").text("");
                            $("#cno").css("border-color","green");
                        }
                    }
                });
            }
        }
        //判断班级名称是否为空
        function  isNcontent() {
            var content = $("#cname").val();
            if (content == null||content == ""){
                $("#name_msg").text("班级名称不能为空！")
                $("#cname").select().css("border-color","red");
            }else {
                $("#cname").css("border-color","green");
                $("#name_msg").text("")
                return true;
            }
        }
    </script>
    <script type="text/javascript">
        //检查表单 即如果用户不处理红色提示，点击注册之后没有反应
        function checkForm() {
            if(isNcontent()&&isNcontent()){
                alert("添加班级成功!");
                return true;
            }else {
                return false;
            }
        }
    </script>

    <title>增加班级</title>
</head>
<body>

<div>
    <div class="container">
        <form class="form-horizontal" role="form" onsubmit="checkForm();" action="/user/insertClass" method="post" id="addClass">

            <div class="form-group">
                <label class="col-sm-2 control-label">班级编号：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="cno" id="cno" placeholder="请输入编号"  style="width: 30%;" onblur="isExists()">
                    <span style="color: red" id="account_msg"></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">班级名称：</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="cname" id="cname" placeholder="请输入班级名称"  style="width: 30%;" onblur="isNcontent()">
                    <span style="color: red" id="name_msg"></span>
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
