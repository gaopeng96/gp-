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

<%--******学生查看作业成绩页面******--%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="css/admin.css" media="all">
    <style type="text/css">
        table{
            table-layout:fixed;
            word-wrap:break-word;

        }
        td {
            white-space:nowrap;
            overflow:hidden;
            text-overflow: ellipsis;
        }
    </style>


    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script src="js/admin.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>

        $(document).ready(function () {
            $("#show").ready(function () {
                var a = ${item.shtime};
                if(a==null){
                    document.write("未提交")
                }else {
                    document.write(a);
                }
            })
        })
    </script>
    <title>作业成绩</title>
    ${user.sno}
</head>
<body>
<div class="layui-fluid">
    <div class="layui-col-md12">
        <div class="layui-navs">
					<span class="layui-breadcrumb" lay-separator="—">
						<a href="javascript:;">系统设置</a>
						<a href="javascript:;">成绩管理</a>
						<a><cite>查看成绩</cite></a>
					</span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;float:right;height: 36px;" href="javascript:location.replace(location.href);" title="刷新">
                <i class="layui-icon layui-icon-refresh" style="line-height:36px;font-size: 16px;"></i>
            </a>
        </div>
    </div>
    <div class="layui-col-md12">
        <div class="layui-card">
            <c:if test="${Hwork.size()!=0}">
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
                <div class="layui-card-body">
                    <table class="layui-table layui-form" id="aa">
                        <thead>
                        <tr>
                            <th>作业编号</th>
                            <th>学生编号</th>
                            <th>班级编号</th>
                            <th>作业名称</th>
                            <th>作业题目</th>
                            <th>学生答案</th>
                            <th>得分</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${Hwork}" var="item">
                            <tr>
                                <td>${item.hno}</td>
                                <td>${item.sno}</td>
                                <td>${item.cno}</td>
                                <td>${item.hname}</td>
                                <td>${item.hcontent}</td>
                                <td>
                                    <c:if test="${item.shcontent!=null}">${item.shcontent}</c:if>
                                    <c:if test="${item.shcontent==null}">未提交</c:if>
                                </td>
                                <td>
                                    <c:if test="${item.grade!=null}">${item.grade}</c:if>
                                    <c:if test="${item.grade==null}">未批改</c:if>
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
                                <li><a href="/user/searchGrade?pageNum=1">首页</a></li>
                                <li><a href="/user/searchGrade?pageNum=${pageInfo.prePage}">上一页</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="active"><span>首页</span></li>
                                <li class="disabled"><span>上一页</span></li>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach var = "index" begin="1" end="${pageInfo.pages}">
                            <li class="active"
                                    <c:if test="${index==pageInfo.pageNum}"></c:if>>
                                <a href="javascript:/user/searchGrade?pageNum=${index}">${index}</a>
                            </li>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${pageInfo.hasNextPage}">
                                <li><a href="/user/searchGrade?pageNum=${pageInfo.nextPage}">下一页</a></li>
                                <li><a href="/user/searchGrade?pageNum=${pageInfo.pages}">尾页</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="disabled"><span>下一页</span></li>
                                <li class="active"><span>尾页</span></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </c:if>
            <c:if test="${Hwork.size()==0}">
                <div class="maincol maincol-right left">
                    <dl>
                        <dt>目前没有成绩！</dt>
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
