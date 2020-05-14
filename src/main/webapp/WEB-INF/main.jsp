

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>作业管理系统</title>
    <link rel="stylesheet" href="lib/layui/css/layui.css">
    <link rel="stylesheet" href="css/admin.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">作业管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <c:if test="${userType == 1}">
                <li class="layui-nav-item layui-this" data-nav="1"><a href="javascript:;">管理员登录</a></li>
            </c:if>
            <c:if test="${userType == 2}">
                <li class="layui-nav-item layui-this" data-nav="1"><a href="javascript:;">教师登录</a></li>
            </c:if>
            <c:if test="${userType == 3}">
                <li class="layui-nav-item layui-this" data-nav="1"><a href="javascript:;">学生登录</a></li>
            </c:if>

        </ul>
        <ul class="layui-nav layui-layout-right">
            <c:if test="${userType == 1}">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <img src="images/logins.png" class="layui-nav-img">${user.ano}
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="user/aa">退出登录</a></dd>
                    </dl>
                </li>
            </c:if>
            <c:if test="${userType == 2}">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <img src="images/logins.png" class="layui-nav-img">${user.tname}
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="user/aa">退出登录</a></dd>
                    </dl>
                </li>
            </c:if>
            <c:if test="${userType == 3}">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <img src="images/logins.png" class="layui-nav-img">${user.sname}
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="user/aa">退出登录</a></dd>
                    </dl>
                </li>
            </c:if>
            <li class="layui-nav-item"><a href="javascript:location.reload() ;">首页</a></li>
        </ul>
    </div>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll" id="layui_nav_left_1">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <%--管理员登录列表--%>
                <c:if test="${userType == 1}">
                    <li class="layui-nav-item layui-nav-itemed">
                        <a class="" href="javascript:;">公告管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" data-url="user/selectNotice">公告列表</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;">班级管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" data-url="user/selectClass">班级列表</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;">课程管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" data-url="user/selectClass">课程列表</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;">学生管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" data-url="user/selectStudent">学生列表</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;">教师管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" data-url="user/selectTeacher">教师列表</a></dd>
                        </dl>
                    </li>
                    </c:if>

                <%--教师登录列表--%>
                <c:if test="${userType == 2}">
                        <li class="layui-nav-item layui-nav-itemed">
                            <a href="javascript:;">作业管理</a>
                            <dl class="layui-nav-child">
                                <dd><a href="javascript:;" data-url="/user/selectTeaHwork">已发布作业</a></dd>
                                <dd><a href="javascript:;" data-url="/user/selectTeaShwork">已发布选择题作业</a></dd>
                                <dd><a href="javascript:;" data-url="/user/selectNewHwork">未批改作业</a></dd>
                            </dl>
                        </li>
                        <li class="layui-nav-item layui-nav-itemed">
                            <a href="javascript:;">学生管理</a>
                            <dl class="layui-nav-child">
                                <dd><a href="javascript:;" data-url="/user/selectGradeByTea">查看成绩</a></dd>
                                <dd><a href="javascript:;" data-url="/user/selectSGradeByTea">查看选择题成绩</a></dd>
                                <dd><a href="javascript:;" data-url="/user/selectNotHwork">未提交学生</a></dd>
                                <dd><a href="javascript:;" data-url="/user/selectNotSHwork">选择题未提交学生</a></dd>
                            </dl>
                        </li>
                        <li class="layui-nav-item layui-nav-itemed">
                            <a href="javascript:;">个人信息</a>
                            <dl class="layui-nav-child">
                                <dd><a href="javascript:;" data-url="/user/infm">查看个人信息</a></dd>
                                <dd><a href="javascript:;" data-url="/user/showUpdateTeaPwd">修改密码</a></dd>
                            </dl>
                        </li>
                    </c:if>

                <%--学生登录列表--%>
                <c:if test="${userType == 3}">
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;">作业管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" data-url="/user/searchHwork">查看新作业</a></dd>
                            <dd><a href="javascript:;" data-url="/user/searchShwork">查看选择题</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;">成绩管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" data-url="/user/searchGrade">查看成绩</a></dd>
                            <dd><a href="javascript:;" data-url="/user/selectSGrade">查看选择题成绩</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;">个人信息</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" data-url="/user/stuInfm">查看个人信息</a></dd>
                            <dd><a href="javascript:;" data-url="/user/showUpdateStuPwd">修改密码</a></dd>
                        </dl>
                    </li>
                </c:if>
            </ul>
        </div>

    </div>
    <div class="layui-body" id="LAY_app_body">
        <div class="layui-tabsbody-item layui-show">
            <c:if test="${userType == 1}">
                <iframe src="/user/selectNum" frameborder="0" class="layui-iframe" style="padding: 15px;"></iframe>
            </c:if>
            <c:if test="${userType == 2}">
                <iframe src="/user/teaConsole" frameborder="0" class="layui-iframe" style="padding: 15px;"></iframe>
            </c:if>
            <c:if test="${userType == 3}">
                <iframe src="/user/stuConsole" frameborder="0" class="layui-iframe" style="padding: 15px;"></iframe>
            </c:if>
        </div>
    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © 作业管理系统
    </div>
</div>
</body>
</html>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="lib/layui/layui.js"></script>
<script src="js/admin.js"></script>