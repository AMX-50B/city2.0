<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>infoshow</title>
    <link rel="stylesheet" href="css/main.css" type="text/css" />
</head>
<body>
<div id="containe">
    <%@include file="head.jsp"%>

    <%@include file="menu.jsp"%>

    <jsp:include page="search.jsp" />
<div id="bodier" style="width: 100%">
    <div align="center" style="margin-top: 20px; ">
        <h1 style="font-size:30px;color: forestgreen;margin-top: 20px;" align="center">详细信息</h1>
        <hr align="center" style="color: #006f78">
        <table width="70%" style="margin-top: 10px;" cellspacing="10px">
            <tr>
                <td rowspan="5" colspan="2" width="200px"><img src="image/background.jpg" style="width: 200px"/></td>
                <td width="120px"align="center" style="font-size: 20px;color:darkorange">信息标题：</td>
                <td width="150px">666</td>
                <td width="120px" align="center"style="font-size: 20px;color:darkorange">发布时间：</td>
                <td width="150px">666</td>
            </tr>
            <tr><td width="120px"  align="center"style="font-size: 20px;color:darkorange">信息类别：</td>
                <td width="150px">666</td>
                <td width="120px" align="center"style="font-size: 20px;color:darkorange">发布人：</td>
                <td width="150px">666</td>
            </tr>
            <tr><td width="120px"  align="center"style="font-size: 20px;color:darkorange">联系方式：</td>
                <td width="150px">666</td>
                <td width="120px" align="center"style="font-size: 20px;color:darkorange">Email：</td>
                <td width="150px">666</td>
            </tr>
            <tr>
                <td colspan="4" height="20px"style="font-size: 20px;color:darkorange">信息内容：</td>
            </tr>
            <tr>
                <td colspan="5" style="text-indent:20px">66lssdfg55555555555555555555555555
                    55555555555555555555555555555555555555555555555555555555
                    55555555555555
                    555555
                    555555555555555555
                    555555555555555555555555
                    555555555
                    5555555555
                    5555555555
                    555555555555555555sdfg666</td>
            </tr>
        </table>
    </div>
    <hr align="center" style="color: #006f78;margin-top: 20px">

    <div>
        <jsp:include page="recommend.jsp"></jsp:include>
    </div>
</div>
<div id="footer">
    <jsp:include page="foot.jsp"></jsp:include>
</div>
</div>
</body>
</html>