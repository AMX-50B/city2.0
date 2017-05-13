<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0" />
<title>Register</title>

<link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/reg.js"></script>

<style type="text/css">
html,body {
	height: 100%;
}
.box {
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6699FF', endColorstr='#6699FF'); /*  IE */
	background-image:linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-o-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-moz-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-webkit-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-ms-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	
	margin: 0 auto;
	position: relative;
	width: 100%;
	height: 100%;
}
.login-box {
	width: 100%;
	max-width:500px;
	height: 500px;
	position: absolute;
	top: 50%;

	margin-top: -300px;
	/*设置负值，为要定位子盒子的一半高度*/
	
}
@media screen and (min-width:500px){
	.login-box {
		left: 50%;
		/*设置负值，为要定位子盒子的一半宽度*/
		margin-left: -250px;
	}
}	

.form {
	width: 100%;
	max-width:500px;
	height: 275px;
	margin: 25px auto 0px auto;
	padding-top: 25px;
}	
.login-content {
	height: 100%;
	width: 100%;
	max-width:500px;
	background-color: rgba(255, 250, 2550, .6);
	float: left;
}		
	
	
.input-group {
	margin: 0px 0px 10px 0px;
}
.form-control,
.input-group {
	height: 30px;
}

.form-group {
	margin-bottom: 0px;
}
.login-title {
	padding: 20px 10px;
	background-color: rgba(0, 0, 0, .6);
}
.login-title h1 {
	margin-top: 10px !important;
}
.login-title small {
	color: #fff;
}

.link p {
	line-height: 20px;
	margin-top: 30px;
}
.btn-sm {
	padding: 8px 24px !important;
	font-size: 16px !important;
}
</style>

</head>

<body>
<script type="text/javascript">
	function changeImage() {
		document.getElementById("img").src = "${pageContext.request.contextPath}/imageCode?time="
				+ new Date().getTime();
	}
</script>

<div class="box">
		<div class="login-box">
			<div class="login-title text-center">
				<h1><small>用户注册界面</small></h1>
			</div>
			<div class="login-content ">
			<div class="form">
			<form action="${pageContext.request.contextPath}/index?m=register" method="post">
				<div class="form-group">
					<div class="col-xs-12  ">
						<span style="color: red">${mes}</span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-user">&nbsp;用户名：&nbsp;</span></span>
							<input type="text" id="username" name="userName" class="form-control" placeholder="用户名">
						</div>
					</div>
					<br />
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<span id="sh1" ></span>
					</div>
				</div>

				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-lock">&nbsp;密码：&nbsp;&nbsp;</span></span>
							<input type="password" id="password" name="password" class="form-control"  placeholder="登录密码">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<span id="sh2"></span>
					</div>
				</div>

				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-lock">&nbsp;重复密码：</span></span>
							<input   type="password" id="re_pwd" name="userPassword" class="form-control" placeholder="再次输入密码">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<span id="sh3"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-envelope">&nbsp;E-mail：&nbsp;</span></span>
							<input type="text" id="email" name="userEmail" class="form-control" placeholder="E-mail">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<span id="sh4"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-map-marker">&nbsp性别：&nbsp;&nbsp;</span></span>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio"  name="sex" checked="checked" value="1"/>男&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio"  name="sex" value="0"/>女
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-barcode">&nbsp;验证码：&nbsp;</span></span>
							<input type="text" id="code" name="code" class="form-control" placeholder="输入验证码" style="width: 100px">
							&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/imageCode" width="140px" height="30" class="textinput" style="height:30px;" id="img" />
							&nbsp;&nbsp;&nbsp;<input type="button" onclick="changeImage()" value="换一张">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<span id="sh5"></span>
					</div>
				<div class="form-group form-actions">
					<div class="col-xs-4 col-xs-offset-4 ">
						<button id="sub" type="submit" disabled="disabled" class="btn btn-sm btn-info "><span class="glyphicon glyphicon-globe"></span> &nbsp;注册</button>
					</div>

				</div>
				<div class="form-group form-actions">
					<div class="col-xs-6 link pull-left">
						<p><small>已注册，</small> <a href="${pageContext.request.contextPath}/login.jsp" ><small>登录</small></a>
						</p>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
</div>
</body>

</html>