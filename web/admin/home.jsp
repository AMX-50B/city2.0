<%--
  Created by IntelliJ IDEA.
  User: LY
  Date: 2017/4/25
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css" />
    <style>
        .img-wrapper{float:left;position:relative;}
       .img-wrapper  span.time{position:absolute;left:5px;bottom:400px;height:60px;background:#000;display:block;zoom:1;filter:alpha(opacity=40);opacity:0.4;width:99%;color:#fff;line-height:20px}
    </style>
</head>
<body>
<div id="containe">
    <%@include file="../head.jsp"%>
    <div id="bodier" style="height:600px;background: transparent;">
        <div id="menu" style="width: 209px;height:100%;background:#467ca2;float: left;-moz-border-radius: 5px;-webkit-border-radius: 5px;">
            <%@include file="menu.jsp"%>
        </div>
        <div id = "adt" style="width:970px;height: 100%;float: left;margin-left: 20px;" align="center">
                <div class="img-wrapper" align="center">
                    <img src="${pageContext.request.contextPath}/ad/ad2.jpg" alt="欢迎" width="99%"height="600px" style="border:1px solid #999E9F;-moz-border-radius: 5px;-webkit-border-radius: 5px;">
                    <span class="time" style="font:italic 20px Trebuchet MS;">都市信息供求网后台<br>Welcome，${user.userName}！</span>
                </div>
        </div>
    </div>
    <div id="footer">
        <jsp:include page="../foot.jsp" />
    </div>
</div>
</body>
</html>
