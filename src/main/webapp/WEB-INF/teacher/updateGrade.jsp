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

<%--******给学生打分页面******--%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style type="text/css">

    </style>


    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">

    </script>
    <title>给学生打分页面</title>
    老师${user.tno}
</head>
<body>
<div class="container" id="a">

    <form class="form-horizontal" id="updateGrade" role="form" action="/user/updateGrade" method="post">

        <div class="form-group">
            <label class="col-sm-2 control-label">学生编号</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="sno" value="${updateGrade.sno}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">学生姓名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="sname" value="${updateGrade.sname}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">所在班级</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="cname"  value="${updateGrade.cname}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">作业编号</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="hno"  value="${updateGrade.hno}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">作业名称</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="hname"  value="${updateGrade.hname}">
            </div>
        </div>


        <div class="form-group">
            <label class="col-sm-2 control-label">作业题目</label>
            <div class="col-sm-10">
                <textarea rows="4" cols="50" name="hcontent"  form="updateGrade">
                    ${updateGrade.hcontent}
                </textarea>
            </div>
        </div>


        <div class="form-group">
            <label class="col-sm-2 control-label">学生答案</label>
            <div class="col-sm-10">
                <textarea rows="4" cols="50" name="shcontent" form="updateGrade">
                    ${updateGrade.shcontent}
                </textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">打分</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="grade" >
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
