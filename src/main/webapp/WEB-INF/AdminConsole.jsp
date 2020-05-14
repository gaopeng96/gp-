<%--
  Created by IntelliJ IDEA.
  User: 高鹏
  Date: 2020/4/9
  Time: 10:47
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
    <meta charset="utf-8">
    <title>控制台</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="css/admin.css" media="all">
</head>
<body>
<div class="layui-fluid">
    <blockquote class="layui-elem-quote">欢迎管理员：
        <span class="x-red">${user.ano}</span>&nbsp;&nbsp;&nbsp;&nbsp;现在时间：<span id="cont"></span>
    </blockquote>
</div>
<div class="layui-col-md12">
    <div class="layui-card">
        <fieldset class="layui-elem-field layui-field-title">
            <legend>数据统计</legend>
        </fieldset>
        <div class="layui-card-body ">
            <ul class="layui-row layui-col-space10 layui-this x-admin-carousel x-admin-backlog">
                <li class="layui-col-md2 layui-col-xs6">
                    <a href="javascript:;" class="x-admin-backlog-body">
                        <h3>管理员数</h3>
                        <p><cite>1个</cite></p>
                    </a>
                </li>
                <li class="layui-col-md2 layui-col-xs6">
                    <a href="javascript:;" class="x-admin-backlog-body">
                        <h3>班级数</h3>
                        <p><cite>${classNum}个</cite></p>
                    </a>
                </li>
                <li class="layui-col-md2 layui-col-xs6">
                    <a href="javascript:;" class="x-admin-backlog-body">
                        <h3>教师数</h3>
                        <p><cite>${teaNum}个</cite></p>
                    </a>
                </li>
                <li class="layui-col-md2 layui-col-xs6">
                    <a href="javascript:;" class="x-admin-backlog-body">
                        <h3>学生数</h3>
                        <p><cite>${stuNum}个</cite></p>
                    </a>
                </li>
                <li class="layui-col-md2 layui-col-xs6">
                    <a href="javascript:;" class="x-admin-backlog-body">
                        <h3>公告数</h3>
                        <p><cite>${noticeNum}个</cite></p>
                    </a>
                </li>

            </ul>
        </div>
    </div>
</div>
</body>
</html>
<script src="lib/layui/layui.js"></script>
<script type="text/javascript">
    var tew=document.getElementById('cont')
    // ti.innerHTML="你好";


    function getTime(){     	//获取时间
        var date=new Date();

        var year=date.getFullYear();
        var month=date.getMonth() + 1;
        var day=date.getDate();

        var hour=date.getHours();
        var minute=date.getMinutes();
        var second=date.getSeconds();

        //这样写显示时间在1~9会挤占空间；所以要在1~9的数字前补零;
        if (hour<10) {
            hour='0'+hour;
        }
        if (minute<10) {
            minute='0'+minute;
        }
        if (second<10) {
            second='0'+second;
        }


        var x=date.getDay();//获取星期


        var time=year+'/'+month+'/'+day+'/'+hour+':'+minute+':'+second
        tew.innerHTML=time;//将时间显示在div内
    }
    getTime();
    setInterval(getTime,1000);

</script>
