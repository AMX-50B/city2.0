<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>都市信息供求网</title>
    <link rel="stylesheet" href="css/main.css" type="text/css" />
</head>
<body>
<div id="containe"><!--整体容器-->
    <div>
        <%@include file="head.jsp"%>
        <%@include file="menu.jsp"%>
        <%@include file="search.jsp"%>
    </div>
    <div id="bodier" align="center"><!--身体容器-->
      <iframe  width="99%" height="100%" frameborder="0" scrolling="no" align="center" src="home.jsp"></iframe>
    </div>
    <div id="footer">
        <%@include file="foot.jsp"%>
    </div><!--脚容器-->
</div>
</body>
</html>