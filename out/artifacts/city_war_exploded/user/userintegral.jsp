<%--
  Created by IntelliJ IDEA.
  User: LY
  Date: 2017/5/8
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: LY
  Date: 2017/4/23
  Time: 23:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>用户中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css" type="text/css">
</head>

<body>

<div id="containe">
    <%@include file="../head.jsp"%>

    <%@include file="../menu.jsp"%>

    <jsp:include page="../search.jsp" />

    <div id="bodier" style="height:500px;background: transparent">
        <div id="menu" style="width: 209px;height:100%;background:#467ca2;float: left;-moz-border-radius: 5px;-webkit-border-radius: 5px;">
            <%@include file="usermenu.jsp"%>
        </div>
        <div id = "usertable" style="width:970px;height: 100%;float: left;margin-left: 20px;background: #9aafe5;-moz-border-radius: 5px;-webkit-border-radius: 5px;" align="center" >
            <div style="width: 100%;">
                <h1 style="font-size:30px;color: forestgreen;margin-top: 20px;" align="center">信息管理</h1>
                <hr align="center" style="margin-top: 10px;color: #006f78;width: 98%" >
            </div>
            <table id="utable" style="margin: 10px;color: #990099">
                <tr>
                    <th>ID</th>
                    <th>integral</th>
                    <th>type</th>
                    <th>userid</th>
                    <th>money</th>
                    <th>Data</th>
                </tr>
                <c:forEach items="${list}" var="m" varStatus="s">
                    <tr class="${s.count%2==1?'':'row'}">
                        <td>${m.id}</td>
                        <td>${m.integral}</td>
                        <td>${m.type=='0'?'支出':'充值'}</td>
                        <td>${m.user_id}</td>
                        <td>${m.money}</td>
                        <td>${m.date}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div id="footer">
        <jsp:include page="../foot.jsp" />
    </div>
</div>
</body>
</html>


