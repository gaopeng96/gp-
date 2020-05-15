<%--
  Created by IntelliJ IDEA.
  User: 高鹏
  Date: 2020/4/8
  Time: 13:34
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
<%--**********作业发布记录页面*********--%>
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
    <script src="lib/layui/layui.js" type="text/javascript"></script>
    <script src="js/admin.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#addHwork").click(function () {
                location.href="/user/showInsertHwork";
            })
        })

        //删除指定作业
        function del() {
            if(confirm("确定要删除吗？")){
                alert("删除成功!")
                return true;
            }else {
                return false;
            }
        }
        function remove(hno,cno) {
            if(del()){
                location.href="/user/deleteHwork?hno="+ hno + "&cno="+cno;
            }
        }


    </script>
    <title>作业发布记录</title>
    编号： ${user.tno}
  作业发布记录页面
</head>
<body>
<div class="layui-fluid">
    <div class="layui-col-md12">
        <div class="layui-navs">
					<span class="layui-breadcrumb" lay-separator="—">
						<a href="javascript:;">系统设置</a>
						<a href="javascript:;">作业管理</a>
						<a><cite>已发布作业</cite></a>
					</span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;float:right;height: 36px;" href="javascript:location.replace(location.href);" title="刷新">
                <i class="layui-icon layui-icon-refresh" style="line-height:36px;font-size: 16px;"></i>
            </a>
        </div>
    </div>
    <c:if test="${tHworkList.size()!=0}">
        <div class="layui-col-md12">
            <div class="layui-card">
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
                    <button class="layui-btn" id="addHwork"><i class="layui-icon"></i>新增作业</button>
                </div>
                <div class="layui-card-body">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>作业编号</th>
                            <th>作业名称</th>
                            <th>班级编号</th>
                            <th>作业题目</th>
                            <th>发布时间</th>
                            <th>管理</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${tHworkList}" var="item">
                            <tr>
                                <td>${item.hno}</td>
                                <td>${item.hname}</td>
                                <td>${item.cno}</td>
                                <td>${item.hcontent}</td>
                                <td title="${item.htime}">${item.htime}</td>
                                <td>
                                    <a class="layui-btn layui-btn-sm layui-btn-normal" title="查看" onclick="execute_open('查看作业', 'user/showHworkByHno?hno=${item.hno}', 1000, 550)" href="javascript:;"><i class="layui-icon layui-icon-edit"></i>查看</a>
                                    <a class="layui-btn layui-btn-sm layui-btn-danger" title="删除" onclick="remove('${item.hno}','${item.cno}')" href="javascript:;"><i class="layui-icon layui-icon-delete"></i>删除</a>
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
                                <li><a href="/user/selectTeaHwork?pageNum=1">首页</a></li>
                                <li><a href="/user/selectTeaHwork?pageNum=${pageInfo.prePage}">上一页</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="active"><span>首页</span></li>
                                <li class="disabled"><span>上一页</span></li>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach var = "index" begin="1" end="${pageInfo.pages}">
                            <li class="active"
                                    <c:if test="${index==pageInfo.pageNum}"></c:if>>
                                <a href="javascript:/user/selectTeaHwork?pageNum=${index}">${index}</a>
                            </li>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${pageInfo.hasNextPage}">
                                <li><a href="/user/selectTeaHwork?pageNum=${pageInfo.nextPage}">下一页</a></li>
                                <li><a href="/user/selectTeaHwork?pageNum=${pageInfo.pages}">尾页</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="disabled"><span>下一页</span></li>
                                <li class="active"><span>尾页</span></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${tHworkList.size()==0}">
        <div class="maincol maincol-right left">
            <dl>
                <dt>还未发布作业！</dt>
                <dd>
                    <ul>
                        <li></li>
                    </ul>
                </dd>
            </dl>
        </div>
    </c:if>
</div>
</body>
</html>
