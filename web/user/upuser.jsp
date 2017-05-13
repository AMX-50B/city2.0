<%--
  Created by IntelliJ IDEA.
  User: LY
  Date: 2017/4/25
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: LY
  Date: 2017/4/24
  Time: 0:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>电子书城</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css" />
    <style>
        #mut caption {
            padding: 0 0 5px 0;
            width: 100%;
            font: italic 20px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
            font-color:#4f6b72;
            text-align: center;
        }
        #mut{ background: transparent;padding: 0px;font-size: 20px;border-collapse: collapse;}
        #mut th{text-align: left;color:#4f6b72;height: 40px;width: 10%;font-family:华文新魏}
        #mut td{text-align: left; height: 40px;width: 40%;font: italic 20px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;}
        #mut input{height: 100%;width:100%;font: italic 20px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;}
        #mut .uts{text-align: left;color: #194105}
    </style>
</head>

<body>
<script type="text/javascript">
    function getmon() {
        var integral = document.getElementById("integral").value;
        var v = integral*0.1;
        var mon=document.getElementById("mon").innerHTML="￥"+v;
    }
</script>
<div id="containe">
    <%@include file="../head.jsp"%>

    <%@include file="../menu.jsp"%>

    <jsp:include page="../search.jsp" />

    <div id="bodier" style="height:600px;background: transparent">
        <div id="menu" style="width: 209px;height:100%;background:#467ca2;float: left;-moz-border-radius: 5px;-webkit-border-radius: 5px;">
            <%@include file="usermenu.jsp"%>
        </div>
        <div id = "usertable" style="width:970px;height: 100%;float: left;margin-left: 20px;background: #9aafe5;-moz-border-radius: 5px;-webkit-border-radius: 5px;" align="center" >
            <form action="${pageContext.request.contextPath}/user?m=transaction&type=0"method="post">
            <table id="mut" style="margin-top: 40px;align:center">
                <caption style="color: #2e6ab1;margin-bottom: 40px"><b>购买会员积分</b></caption>
                <tr>
                    <td colspan="2" style="color: red;font-family: 华文彩云">请核对用户信息：</td>
                </tr>
                <tr>
                    <th>ID:</th>
                    <td>${user.id}</td>
                    <td><input type="text" name="user_id" hidden="hidden" value="${user.id}" \></td>
                </tr>
                <tr>
                    <th>用户名:</th>
                    <td>${user.userName}</td>
                </tr>
                <tr>
                    <th>邮箱:</th>
                    <td>${user.userEmail}</td>
                </tr>
                <tr>
                    <th>当前积分:</th>
                    <td>${user.userIntegral}</td>
                </tr>
                <hr style="color: #007aff"/>
                <tr>
                    <td colspan="2" style="color: red;font-family: 华文彩云">请选择购买积分:</td>
                </tr>
                <tr>
                    <th>购买积分:</th>
                    <td><select id="integral" name="integral" onchange="getmon()" style="height: 80%;width: 80%;font: italic 20px Trebuchet MS">
                        <option value="0">请选择购买积分数</option>
                        <option value="20">20</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                        <option value="200">200</option>
                        <option value="600">600</option>
                        <option value="800">800</option>
                        <option value="1000">1000</option>
                    </select></td>
                </tr>
                <tr>
                    <th>金额:</th>
                    <td id="mon">￥0</td>
                </tr>
                <tr>
                    <td></td>
                    <td  align="center"><input type="submit" value="提交" style="width: 120px;"></td>
                </tr>
            </table>
            </form>
        </div>
    </div>
    <div id="footer">
        <jsp:include page="../foot.jsp" />
    </div>
</div>
</body>
</html>

