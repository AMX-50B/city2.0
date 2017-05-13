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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css" />
    <style>
        #mut{ background: transparent;padding: 0px;font-size: 20px;border-collapse: collapse;}
        #mut th{text-align: left;color:#669933;height: 40px;width: 80px;font-family:华文新魏}
        #mut td{text-align: left; height: 40px;width: 150px;font: italic 15px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;}
    </style>
</head>

<body>
<script type="text/javascript">
    window.onload=function () {

        var name = true;
        var word = true;
        var word2 = false;
        var mail = true;
        var username = document.getElementById("username");
        var pword1 = document.getElementById("password");
        var pword2 = document.getElementById("re_pwd");
        var email = document.getElementById("email");
        var sub = document.getElementById("sub");

        username.onblur = function () {
            name=false;
            if (username.value.length < 4 || username.value.length > 8) {
                $('#sh1').html("*用户名长度不符合！*")
                $('#sh1').attr("style", 'color:red;');

            } else if (!isLetter(username.value)) {
                $('#sh1').html("*用户名格式不符合！*");
                $('#sh1').attr("style", 'color:red;');
            } else if("${user.userName}"!=username.value){
                $.ajax({
                    type: 'post',
                    url: '${pageContext.request.contextPath}/index?m=userNameCheck',
                    data: {username: username.value},
                    success: function (result) {
                        if(result=="0"){
                            $('#sh1').html("*用户名已存在！*");
                            $('#sh1').attr("style",'color:red;');

                        }else if(result=="1"){
                            $('#sh1').html("*OK！*");
                            $('#sh1').attr("style",'color:green;');
                            name=true;
                        }

                    }
                });
            }else{
                $('#sh1').html("*OK！*");
                $('#sh1').attr("style",'color:green;');
                name=true;
            }
            ok();
        }

        pword1.onkeyup=function () {
            word=false;
            if(pword1.value.length<6||pword1.value.length>10){
                $('#sh2').html("*密码长度不符合！*")
                $('#sh2').attr("style", 'color:red;');
            }else if(!isNumberOrLetter(pword1.value)){
                $('#sh2').html("*用户名格式不符合！*");
                $('#sh2').attr("style", 'color:red;');
            }else {
                $('#sh2').html("*OK！*");
                $('#sh2').attr("style",'color:green;');
                word=true;
            }
            ok();
        }

        pword2.onkeyup=function () {
            word2=false;
            if(pword1.value!=pword2.value){
                $('#sh3').html("*两次密码不一致！*")
                $('#sh3').attr("style", 'color:red;');

            }else{
                $('#sh3').html("*OK！*");
                $('#sh3').attr("style",'color:green;');
                word2=true;
            }
            ok();
        }

        email.onkeyup=function () {
            mail=false;
            if(!isEmail(email.value)){
                $('#sh4').html("*邮箱格式不符合！*");
                $('#sh4').attr("style", 'color:red;');

            }else{
                $('#sh4').html("*OK！*");
                $('#sh4').attr("style",'color:green;');
                mail=true;
            }
            ok();
        }

        function ok() {
            if(name&&word&&word2&&mail){
                $('#sub').removeAttr("disabled");
            }else {
                $('#sub').attr("disabled",'disabled')
            }
        }

    }
    function isNumberOrLetter( s ){//判断是否是数字或字母

        var regu = "^[0-9a-zA-Z]+$";
        var re = new RegExp(regu);
        if (re.test(s)) {
            return true;
        }else{
            return false;
        }
    }

    function isLetter( s ){//判断是否是字母

        var regu = "^[a-zA-Z]";
        var re = new RegExp(regu);
        if (re.test(s)) {
            return true;
        }else{
            return false;
        }
    }

    function isEmail( str ){
        var myReg = /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/;
        if(myReg.test(str)) return true;
        return false;
    }
</script>
<div id="containe">
    <%@include file="../head.jsp"%>

    <%@include file="../menu.jsp"%>

    <jsp:include page="../search.jsp" />

    <div id="bodier" style="height:550px;background: transparent">
        <div id="menu" style="width: 209px;height:100%;background:#467ca2;float: left;-moz-border-radius: 5px;-webkit-border-radius: 5px;">
            <%@include file="usermenu.jsp"%>
        </div>
        <div id = "usertable" style="width:970px;height: 100%;float: left;margin-left: 20px;background: #FFFFFF;-moz-border-radius: 5px;-webkit-border-radius: 5px;" align="center" >
            <div style="height: 7px;width: 100%;background-color:#996600;-moz-border-radius: 5px;-webkit-border-radius: 5px;"></div>
            <h1 style="margin-top: 40px;margin-bottom: 40px;font: italic 20px Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;color:#996600"><b>用户资料修改</b></h1>
            <hr align="center" style="color: #006f78;width: 90%;">
            <form action="${pageContext.request.contextPath}/user?m=modifyUser" method="post" enctype="multipart/form-data">
            <div style="width: 29%;height: 100%;float: left">
                <img src="${pageContext.request.contextPath}${user.userUrl}" alt=" " width="200px" align="right" style="margin-top: 35px;margin-right: 10px">
                <div width="100%" align="right"><input type="file" name="userUrl"style="width:200px " value="上传图片"\></div>
            </div>
            <div style="width: 70%;height: 100%;float: left">
                <table id="mut" style="margin-top: 20px">
                    <tr>
                        <th>ID:</th>
                        <td>${user.id}</td>
                        <td><input type="text" name="id" value="${user.id}" hidden="hidden" \></td>
                        <td ></td>
                    </tr>
                    <tr>
                        <th >用户名:</th>
                        <td><input type="text" id="username" name="userName"  value="${user.userName}" \></td>
                        <td id="sh1"></td>
                    </tr>
                    <tr>
                        <th>密码:</th>
                        <td ><input type="password" id="password" name="userPassword" value="${user.userPassword}" \></td>
                        <td id="sh2"></td>
                    </tr>
                    <tr>
                        <th>重复密码:</th>
                        <td><input id="re_pwd" type="password"   \></td>
                        <td id="sh3"></td>
                    </tr>
                    <tr>
                        <th>性别:</th>
                        <td><input type="radio" name="sex" checked="${user.sex=="1"?"checked":""}" value="1" \>男
                            <input type="radio" name="sex" checked="${user.sex=="0"?"checked":""}" value="0" \>女
                        </td>
                    </tr>
                    <tr>
                        <th>邮箱:</th>
                        <td><input type="text" id="email" name="userEmail" value="${user.userEmail}" \></td>
                        <td id="sh4"></td>
                    </tr>

                    <tr>
                        <td>
                            <input type="submit" id="sub" value="修改用户信息" disabled="disabled" style="width: 100px;height: 40px;background-color: #99CC66;"/>
                        </td>
                    </tr>

                </table>
            </div>
            </form>
        </div>

    </div>
    <div id="footer">
        <jsp:include page="../foot.jsp" />
    </div>
</div>
</body>
</html>
