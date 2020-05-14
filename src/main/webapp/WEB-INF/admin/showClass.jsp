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

<%--******查看所有班级******--%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style type="text/css">

    </style>


    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#showAddNotice").click(function () {
                location.href="/user/showInsertClass";
            })
        })

        //删除指定班级
        function del() {
            var r = confirm("确认要删除吗!");
            if(r){
                alert("删除成功！")
                return true;
            }else {
                return false;
            }
        }
        function remove(nno) {
            if(del()){
                location.href="/user/deleteNotice?nno=" + nno;
            }
        }

        //修改班级
        function update(cno) {
            location.href="/user/showUpdateClass?cno=" + cno;
        }
        //判断用户是否存在
        function isExists() {
            //学号格式为至少9位的纯数字
            var reg = /^[0-9]*$/;
            //获取用户输入的账号
            var account = $("#selectNno").val();
            if(account == null || account == ""){
                alert("编号号不能为空");
                //重新获取焦点并将text中border设置为红色
                window.setTimeout (function(){
                    $("#selectNno").select().css("border-color","red");
                });
            }else if(!reg.test(account)){//不符合格式提示弹窗
                alert("请输入正确的编号");
                window.setTimeout (function(){
                    $("#selectNno").select().css("border-color","red");
                });
            }else {
                $.ajax({
                    url: "user/selectNoticeByNo",//请求路径
                    type: "post", //请求方式
                    data: "account=" + account, //传给后台的值
                    dataType: "text", //返回类型
                    success: function (responseContent) {
                        //如果返回值为"true" 提示信息；反之不提示；
                        if (responseContent == "true") {
                            $("#account_msg").text("该公告已存在");
                            window.setTimeout (function(){
                                $("selectNno").select().css("border-color","red");
                            });
                        } else {
                            $("#account_msg").text("");
                            $("selectNno").css("border-color","green");
                        }
                    }
                });
            }
        }
    </script>
    <title>查看所有班级</title>
    管理员${user.ano}
</head>
<body>
<div class="container" id="a">
    <div>
        <button type="button" class="btn btn-default" id="showAddNotice">增加班级</button>
    </div>
    <table class="table table-bordered">
        <tr>
            <th>班级编号</th>
            <th>班级名称</th>
            <th>学生数量</th>
            <th>操作</th>
        </tr>

        <c:forEach items="${numList}" var="item">
            <tr>
                <td>${item.cno}</td>
                <td>${item.cname}</td>
                <td>${item.account}</td>
                <td>
                    <button type="button" class="btn btn-default" onclick="update('${item.cno}')">修改</button>
                    <%--<a href="${pageContext.request.contextPath}/user/deleteNotice/${item.nno}">删除</a>--%>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
