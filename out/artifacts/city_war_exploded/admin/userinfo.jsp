<%--
  Created by IntelliJ IDEA.
  User: LY
  Date: 2017/5/12
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: LY
  Date: 2017/4/24
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>电子书城</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css" />
    <style>
        #mut{ background: transparent;padding: 0px;font-size: 20px;border-collapse: collapse;}
        #mut th{text-align: left;color:#669933;height: 40px;width: 120px;font-family:华文新魏}
        #mut td{text-align: left; height: 40px;width: 150px;font: italic 20px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;}
    </style>
</head>

<body>
<script type="text/javascript">
    function turn() {
        window.location.href="${pageContext.request.contextPath}/user/modifyuser.jsp";
    }
</script>
<div id="containe">
    <%@include file="../head.jsp"%>

    <%@include file="../menu.jsp"%>

    <jsp:include page="../search.jsp" />

    <div id="bodier" style="height: 500px; min-height:450px;background: transparent">
        <div id="menu" style="width: 209px;height:100%;background:#467ca2;float: left;-moz-border-radius: 5px;-webkit-border-radius: 5px;">
            <%@include file="menu.jsp"%>
        </div>
        <div id = "usertable" style="width:970px;height: 100%;float: left;margin-left: 20px;background: #FFFFFF;-moz-border-radius: 5px;-webkit-border-radius: 5px;" align="center" >
            <div style="height: 7px;width: 100%;background-color:#996600;-moz-border-radius: 5px;-webkit-border-radius: 5px;"></div>
            <h1 style="margin-top: 40px;margin-bottom: 40px;font: italic 20px Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;color:#996600"><b>用户资料详情</b></h1>
            <hr align="center" style="color: #006f78;width: 90%;">
            <div style="width: 29%;height: 100%;float: left">
                <img src="${pageContext.request.contextPath}${u.userUrl}" alt=" " width="200px" align="right" style="margin-top: 35px">
            </div>
            <div style="width: 70%;height: 100%;float: left">
                <table id="mut" style="margin-top: 20px">
                    <tr>
                        <th>ID:</th>
                        <td>${u.id}</td>
                    </tr>
                    <tr>
                        <th>用户名:</th>
                        <td>${u.userName}</td>
                    </tr>
                    <tr>
                        <th>性别:</th>
                        <td>${u.sex=="1"?"男":"女"}</td>
                    </tr>
                    <tr>
                        <th>邮箱:</th>
                        <td>${u.userEmail}</td>
                    </tr>
                    <tr>
                        <th>用户等级:</th>
                        <td>${u.userState==1?"普通用户":u.userState==2?"会员用户":"管理员"}</td>
                        <th>用户积分:</th>
                        <td>${u.userIntegral}</td>
                    </tr>
                    <tr>
                        <th>注册时间:</th>
                        <td colspan="3">${u.date}</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <c:if test="${u.state==1}"><input type="button" onclick="changeState(0,'${m.id}',this)" value="删除"  style="width: 100px;height: 40px;background-color: #ec971f"/></c:if>
                            <c:if test="${u.state==0&&user.userState==4}"><input type="button" onclick="deleteUser('${m.id}',this)" value="彻底删除"  style="width: 100px;height: 40px;background-color: #ec971f"/></c:if>
                            <c:if test="${u.state==0}"><input type="button" onclick="changeState(1,'${m.id}',this)" value="恢复"  style="width: 100px;height: 40px;background-color: #ec971f"/></c:if>
                            <c:if test="${u.state==1&&u.userState!=3&&user.userState==4}"><input type="button" onclick="changuserState(3,'${m.id}',this)" value="升为管理员"  style="width: 100px;height: 40px;background-color: #ec971f"/></c:if>
                            <c:if test="${u.state==1&&u.userState==3&&user.userState==4}"><input type="button" onclick="changuserState(2,'${m.id}',this)" value="撤销管理员"  style="width: 100px;height: 40px;background-color: #ec971f"/></c:if>
                        </td>
                    </tr>

                </table>
            </div>
        </div>
    </div>
    <div id="footer">
        <jsp:include page="../foot.jsp" />
    </div>
</div>
</body>
</html>
