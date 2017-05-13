<%--
  Created by IntelliJ IDEA.
  User: LY
  Date: 2017/4/25
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>menu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/list.css" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/list.js"></script>
</head>
<body>
<div class="list">
    <div align="center"style="width: 209px;"><img src="${pageContext.request.contextPath}${user.userUrl}" width="130px" style="margin-bottom: 40px"/></div>
    <ul class="yiji">
        <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
        <li><a  class="inactive">用户管理</a>
            <ul style="display: none">
                <li><a href="${pageContext.request.contextPath}/admin?m=showUserList&type=1" >用户信息</a></li>
                <li class="last"><a href="${pageContext.request.contextPath}/admin?m=showTransactionList">用户积分</a></li>
            </ul>
        </li>
        <li><a class="inactive">信息管理</a>
            <ul style="display: none">
                <li><a href="${pageContext.request.contextPath}/admin?m=showMessageListByType&t=1" >待审核</a></li>
                <li class="last"><a href="${pageContext.request.contextPath}/admin?m=showMessageListByType&t=2">已审核</a></li>
            </ul>
        </li>
        <li><a class="inactive">广告管理</a>
            <ul style="display: none">
                <li><a href="#" >广告信息</a></li>
                <li class="last"><a href="#">广告发布</a></li>
            </ul>
        </li>
        <li><a class="inactive">回收站</a>
        <ul style="display: none">
            <li><a href="${pageContext.request.contextPath}/admin?m=showDeletedMessage" >信息回收</a></li>
            <li><a href="${pageContext.request.contextPath}/admin?m=showUserList&type=0" >用户回收</a></li>
            <li class="last"><a href="#">广告回收</a></li>
        </ul>
    </li>
    </ul>
</div>

</body>
</html>

