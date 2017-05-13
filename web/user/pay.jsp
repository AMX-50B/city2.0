<%--
  Created by IntelliJ IDEA.
  User: LY
  Date: 2017/5/6
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>payonline</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css" />
    <style>
        #mut{ background: transparent;padding: 0px;font-size: 20px;border-collapse: collapse;}
        #mut th{text-align: left;color:#669933;height: 40px;width: 120px;font-family:华文新魏}
        #mut td{text-align: left; height: 40px;width: 100px;font: italic 15px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;}
    </style>
</head>
<body>
<div id="containe">
    <jsp:include page="../head.jsp" />
    <div id="bodier" style="height: 650px">
        <form action="${pageContext.request.contextPath}/user?m=payOnlineServlet" method="post">
            <div with="100%" align="center" style="padding-top: 40px" >
                <h1 style="margin-bottom: 40px;font: italic 20px Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;color:#996600"><b>在线支付</b></h1>
                <hr align="center" style="color: #006f78;width: 90%;">
                <table id="mut">
                    <tr>
                        <th>订单号：</th>
                        <td>${trans.id}</td>
                        <td><INPUT TYPE="text" hidden="hidden" NAME="id" value="${trans.id}"/></td>
                        <th>用户：</th>
                        <td>${user.userName}</td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>购买积分:</th>
                        <td>${trans.integral}</td>
                        <td><input type="text" name="integral" hidden="hidden" value="${trans.integral}"/></td>
                        <th>支付金额：</th>
                        <td>${trans.money}</td>
                        <td><INPUT TYPE="text" NAME="money" hidden="hidden" value="${trans.money}" ></td>
                    </tr>
                    <tr>
                        <th>选择网银：</th>
                    </tr>
                </table>
                <div align="center"  class="divBank" >
                    <div style="margin-left: 20px;">
                        <div style="margin-bottom: 20px;">
                            <input id="ICBC-NET-B2C" type="radio" name="yh"
                                   value="ICBC-NET-B2C" checked="checked" />
                            <img
                                    name="ICBC-NET-B2C" align="middle"
                                    src="${pageContext.request.contextPath}/bank_img/icbc.bmp" />
                            <input
                                    id="CMBCHINA-NET-B2C" type="radio" name="yh"
                                    value="CMBCHINA-NET-B2C" />
                            <img name="CMBCHINA-NET-B2C"
                                 align="middle" src="${pageContext.request.contextPath}/bank_img/cmb.bmp"/>
                            <input
                                    id="ABC-NET-B2C" type="radio" name="yh" value="ABC-NET-B2C" />
                            <img
                                    name="ABC-NET-B2C" align="middle"
                                    src="${pageContext.request.contextPath}/bank_img/abc.bmp"/>
                            <input
                                    id="CCB-NET-B2C" type="radio" name="yh" value="CCB-NET-B2C" />
                            <img
                                    name="CCB-NET-B2C" align="middle"
                                    src="${pageContext.request.contextPath}/bank_img/ccb.bmp" />
                        </div>
                        <div style="margin-bottom: 20px;">
                            <input id="BCCB-NET-B2C" type="radio" name="yh"
                                   value="BCCB-NET-B2C" />
                            <img name="BCCB-NET-B2C" align="middle"
                                 src="${pageContext.request.contextPath}/bank_img/bj.bmp" /> <input
                                id="BOCO-NET-B2C" type="radio" name="yh" value="BOCO-NET-B2C" />
                            <img name="BOCO-NET-B2C" align="middle"
                                 src="${pageContext.request.contextPath}/bank_img/bcc.bmp" />
                            <input
                                    id="CIB-NET-B2C" type="radio" name="yh" value="CIB-NET-B2C" />
                            <img
                                    name="CIB-NET-B2C" align="middle"
                                    src="${pageContext.request.contextPath}/bank_img/cib.bmp" /> <input
                                id="NJCB-NET-B2C" type="radio" name="yh" value="NJCB-NET-B2C" />
                            <img name="NJCB-NET-B2C" align="middle"
                                 src="${pageContext.request.contextPath}/bank_img/nanjing.bmp" />
                        </div>
                        <div style="margin-bottom: 20px;">
                            <input id="CMBC-NET-B2C" type="radio" name="yh"
                                   value="CMBC-NET-B2C" />
                            <img name="CMBC-NET-B2C" align="middle"
                                 src="${pageContext.request.contextPath}/bank_img/cmbc.bmp" /> <input
                                id="CEB-NET-B2C" type="radio" name="yh" value="CEB-NET-B2C" /> <img
                                name="CEB-NET-B2C" align="middle"
                                src="${pageContext.request.contextPath}/bank_img/guangda.bmp" /> <input
                                id="BOC-NET-B2C" type="radio" name="yh" value="BOC-NET-B2C" /> <img
                                name="BOC-NET-B2C" align="middle"
                                src="${pageContext.request.contextPath}/bank_img/bc.bmp" /> <input
                                id="PINGANBANK-NET" type="radio" name="yh" value="PINGANBANK-NET" />
                            <img name="PINGANBANK-NET" align="middle"
                                 src="${pageContext.request.contextPath}/bank_img/pingan.bmp" />
                        </div>
                        <div style="margin-bottom: 20px;">
                            <input id="CBHB-NET-B2C" type="radio" name="yh"
                                   value="CBHB-NET-B2C" /> <img name="CBHB-NET-B2C" align="middle"
                                                                src="${pageContext.request.contextPath}/bank_img/bh.bmp" /> <input
                                id="HKBEA-NET-B2C" type="radio" name="yh" value="HKBEA-NET-B2C" />
                            <img name="HKBEA-NET-B2C" align="middle"
                                 src="${pageContext.request.contextPath}/bank_img/dy.bmp" /> <input
                                id="NBCB-NET-B2C" type="radio" name="yh" value="NBCB-NET-B2C" />
                            <img name="NBCB-NET-B2C" align="middle"
                                 src="${pageContext.request.contextPath}/bank_img/ningbo.bmp" /> <input
                                id="ECITIC-NET-B2C" type="radio" name="yh" value="ECITIC-NET-B2C" />
                            <img name="ECITIC-NET-B2C" align="middle"
                                 src="${pageContext.request.contextPath}/bank_img/zx.bmp" />
                        </div>
                        <div style="margin-bottom: 20px;">
                            <input id="SDB-NET-B2C" type="radio" name="yh" value="SDB-NET-B2C" />
                            <img name="SDB-NET-B2C" align="middle"
                                 src="${pageContext.request.contextPath}/bank_img/sfz.bmp" /> <input
                                id="GDB-NET-B2C" type="radio" name="yh" value="GDB-NET-B2C" /> <img
                                name="GDB-NET-B2C" align="middle"
                                src="${pageContext.request.contextPath}/bank_img/gf.bmp" /> <input
                                id="SHB-NET-B2C" type="radio" name="yh" value="SHB-NET-B2C" /> <img
                                name="SHB-NET-B2C" align="middle"
                                src="${pageContext.request.contextPath}/bank_img/sh.bmp" /> <input
                                id="SPDB-NET-B2C" type="radio" name="yh" value="SPDB-NET-B2C" />
                            <img name="SPDB-NET-B2C" align="middle"
                                 src="${pageContext.request.contextPath}/bank_img/shpd.bmp" />
                        </div>
                        <div style="margin-bottom: 20px;">
                            <input id="POST-NET-B2C" type="radio" name="yh"
                                   value="POST-NET-B2C" /> <img name="POST-NET-B2C" align="middle"
                                                                src="${pageContext.request.contextPath}/bank_img/post.bmp" /> <input
                                id="BJRCB-NET-B2C" type="radio" name="yh" value="BJRCB-NET-B2C" />
                            <img name="BJRCB-NET-B2C" align="middle"
                                 src="${pageContext.request.contextPath}/bank_img/beijingnongshang.bmp" /> <input
                                id="HXB-NET-B2C" type="radio" name="yh" value="HXB-NET-B2C" /> <img
                                name="HXB-NET-B2C" align="middle"
                                src="${pageContext.request.contextPath}/bank_img/hx.bmp" /> <input id="CZ-NET-B2C"
                                                                                                   type="radio" name="yh" value="CZ-NET-B2C" /> <img
                                name="CZ-NET-B2C" align="middle"
                                src="${pageContext.request.contextPath}/bank_img/zheshang.bmp" />
                        </div>
                    </div>
                    <div style="margin: 40px;">
                        <INPUT TYPE="submit" value="确定支付">
                    </div>
                </div>
            </div>

        </form>
    </div>
    <div id="footer">
        <jsp:include page="../foot.jsp" />
    </div>
</div>

</body>
</html>
