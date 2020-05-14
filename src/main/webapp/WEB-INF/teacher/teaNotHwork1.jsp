<%--
  Created by IntelliJ IDEA.
  User: 高鹏
  Date: 2020/4/7
  Time: 17:35
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


<%--*************查看未提交作业学生***************--%>
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
        function remind(sno) {
            location.href="/user/send?sno=" + sno;
            alert("已提醒该同学！");
        }

        //修改老师
        function update(tno) {
            location.href="/user/showUpdateTeacher?tno=" + tno;
        }

        //查看成绩
        function select(hno) {
            location.href="/user/showGrade?hno=" + hno;
        }
    </script>
    <title>学生未提交作业页面</title>
    ${user.tno}
    学生未提交作业页面
</head>
<body>
<div class="layui-fluid">
    <div class="layui-col-md12">
        <div class="layui-navs">
					<span class="layui-breadcrumb" lay-separator="—">
						<a href="javascript:;">系统设置</a>
						<a href="javascript:;">学生管理</a>
						<a><cite>未提交学生</cite></a>
					</span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;float:right;height: 36px;" href="javascript:location.replace(location.href);" title="刷新">
                <i class="layui-icon layui-icon-refresh" style="line-height:36px;font-size: 16px;"></i>
            </a>
        </div>
    </div>
        <div class="layui-col-md12">
            <div class="layui-card">
                <c:if test="${notHworkList.size()!=0}">
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

                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${notHworkList}" var="item">
                            <tr>
                                <td>${item.hno}</td>
                                <td>${item.sno}</td>
                                <td>${item.cno}</td>
                                <td>${item.hname}</td>
                                <td>${item.hcontent}</td>
                                <td>
                                    <a class="layui-btn layui-btn-sm layui-btn-normal" title="提醒" onclick="remind('${item.sno}')" ><i class="layui-icon layui-icon-edit"></i>提醒</a>
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
                                <li><a href="/user/selectNotHwork?pageNum=1">首页</a></li>
                                <li><a href="/user/selectNotHwork?pageNum=${pageInfo.prePage}">上一页</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="active"><span>首页</span></li>
                                <li class="disabled"><span>上一页</span></li>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach var = "index" begin="1" end="${pageInfo.pages}">
                            <li class="active"
                                    <c:if test="${index==pageInfo.pageNum}"></c:if>>
                                <a href="javascript:/user/selectNotHwork?pageNum=${index}">${index}</a>
                            </li>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${pageInfo.hasNextPage}">
                                <li><a href="/user/selectNotHwork?pageNum=${pageInfo.nextPage}">下一页</a></li>
                                <li><a href="/user/selectNotHwork?pageNum=${pageInfo.pages}">尾页</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="disabled"><span>下一页</span></li>
                                <li class="active"><span>尾页</span></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
                </c:if>
                <c:if test="${notHworkList.size()==0}">
                    <div class="maincol maincol-right left">
                        <dl>
                            <dt>作业已全部提交！</dt>
                        </dl>
                    </div>
                </c:if>
            </div>
        </div>


</div>
</body>
</html>
