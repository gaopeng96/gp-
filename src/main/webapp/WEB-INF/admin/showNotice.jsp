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

<%--******查看所有公告******--%>
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
                location.href="/user/showAddNotice";
            }),
                $("#select").click(function () {
                    $("#table1").css("display","none");
                    $("#btn1").attr("style","display:inline");
                    $("#btn2").attr("style","display:inline");
                    var nno= $("#selectNno").val();
                    location.href="/user/selectNoticeByNo?nno=" + nno;
                })
        })

        //删除指定公告
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

        //修改公告
        function update(nno) {
            location.href="/user/showUpdateNotice?nno=" + nno;
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

        //根据nno查找公告
        function select() {

        }
    </script>
    <title>查看所有公告</title>
    管理员${user.ano}
</head>
<body>
<div class="container" id="a">
    <div>
        <button type="button" class="btn btn-default" id="showAddNotice">增加公告</button>
    </div>
    <table class="table table-bordered" id="table1">
        <tr>
            <th>公告编号</th>
            <th>公告内容</th>
            <th>公告时间</th>
            <th>操作</th>
        </tr>

        <c:forEach items="${noticeList}" var="item">
            <tr>
                <td>${item.nno}</td>
                <td>${item.ncontent}</td>
                <td>${item.ntime}</td>
                <td>
                    <button type="button" class="btn btn-default" onclick="update('${item.nno}')">修改</button>
                    <button type="button" class="btn btn-default" onclick="remove('${item.nno}')">删除</button>
                    <%--<a href="${pageContext.request.contextPath}/user/deleteNotice/${item.nno}">删除</a>--%>
                </td>
            </tr>
        </c:forEach>
        <div id="div1">
            <tr style="height: 5px">
                <td>${notice.nno}</td>
                <td>${notice.ncontent}</td>
                <td>${notice.ntime}</td>
                <td>
                    <button type="button" style="display: none" id="btn1" class="btn btn-default" onclick="update('${notice.nno}')">修改</button>
                    <button type="button" style="display: none" id="btn2" class="btn btn-default" onclick="remove('${notice.nno}')">删除</button>
                </td>
            </tr>
        </div>
    </table>
    <form method="post">
        <div>
            公告编号：<input type="text" name="nno" id="selectNno">
            <button type="button" class="btn btn-default" id="select">查询公告</button>
        </div>
        <div id="di" style="display: none">
            <div class="form-group">
                <label class="col-sm-2 control-label">公告编号：</label>
                <div class="col-sm-10">
                    <input type="text" name="nno" id="nno"  value="${notice.nno}">
                    <span style="color: red" id="account_msg"></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">公告内容：</label>
                <div class="col-sm-10">
                    <textarea rows="4" cols="50"  name="ncontent" id="ncontent">
                        ${notice.ncontent}
                    </textarea>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
