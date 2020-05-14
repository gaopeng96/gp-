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

<%--******查看所有学生******--%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="css/admin.css" media="all">
    <style type="text/css">

    </style>


    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="lib/layui/layui.js" type="text/javascript" charset="UTF-8"></script>
    <script src="js/admin.js" type="text/javascript" charset="UTF-8"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#showInsertStudent").click(function () {
                location.href="/user/showInsertStudent";
            })
        })

        //修改学生
        function update(sno) {
            location.href="/user/showUpdateStudent?sno=" + sno;
        }

        //删除指定学生
        function del() {
            if(confirm("确定要删除吗？")){
                alert("删除成功!")
                return true;
            }else {
                return false;
            }
        }
        function remove(sno) {
            if(del()){
                location.href="/user/deleteStudent?sno=" + sno;
            }
        }
    </script>
    <title>查看所有学生</title>
    管理员${user.ano}
</head>
<body>
<div class="layui-fluid">
    <div class="layui-col-md12">
        <div class="layui-navs">
					<span class="layui-breadcrumb" lay-separator="—">
						<a href="javascript:;">系统设置</a>
						<a href="javascript:;">学生管理</a>
						<a><cite>学生列表</cite></a>
					</span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;float:right;height: 36px;" href="javascript:location.replace(location.href);" title="刷新">
                <i class="layui-icon layui-icon-refresh" style="line-height:36px;font-size: 16px;"></i>
            </a>
        </div>
    </div>
    <div class="layui-col-md12">
        <div class="layui-card">
            <c:if test="${studentList.size()!=0}">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5">

                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="name" value=""  placeholder="请输入ID、名称、账号" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn" onclick="execute_open('添加学生', '/user/showInsertStudent', '1000', '550')"><i class="layui-icon"></i>添加学生</button>
                </div>
                <div class="layui-card-body">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>学生编号</th>
                            <th>学生姓名</th>
                            <th>性别</th>
                            <th>年龄</th>
                            <th>所在班级</th>
                            <th>管理</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${studentList}" var="item">

                            <tr>
                                <td>${item.sno}</td>
                                <td>${item.sname}</td>
                                <td>${item.ssex}</td>
                                <td>${item.sage}</td>
                                <td>${item.cno}</td>
                                <td>
                                    <a class="layui-btn layui-btn-sm layui-btn-normal" title="编辑" onclick="execute_open('编辑学生', 'user/showUpdateStudent?sno=${item.sno}', 1000, 550)" href="javascript:;"><i class="layui-icon layui-icon-edit"></i>编辑</a>
                                    <a class="layui-btn layui-btn-sm layui-btn-danger" title="删除" onclick="execute_del(this, 1, '')" href="javascript:;"><i class="layui-icon layui-icon-delete"></i>删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="page" style="text-align: center">
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${pageInfo.hasPreviousPage}">
                                <li><a href="/user/selectStudent?pageNum=1">首页</a></li>
                                <li><a href="/user/selectStudent?pageNum=${pageInfo.prePage}">上一页</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="active"><span>首页</span></li>
                                <li class="disabled"><span>上一页</span></li>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach var = "index" begin="1" end="${pageInfo.pages}">
                            <li class="active"
                                    <c:if test="${index==pageInfo.pageNum}"></c:if>>
                                <a href="javascript:/user/selectStudent?pageNum=${index}">${index}</a>
                            </li>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${pageInfo.hasNextPage}">
                                <li><a href="/user/selectStudent?pageNum=${pageInfo.nextPage}">下一页</a></li>
                                <li><a href="/user/selectStudent?pageNum=${pageInfo.pages}">尾页</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="disabled"><span>下一页</span></li>
                                <li class="active"><span>尾页</span></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </c:if>
            <c:if test="${studentList.size()==0}">
                <div class="maincol maincol-right left">
                    <dl>
                        <dt>还未添加学生！</dt>
                        <dd>
                            <ul>
                                <li></li>
                            </ul>
                        </dd>
                    </dl>
                </div>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
