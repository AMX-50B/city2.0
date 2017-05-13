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
		<li><a  class="inactive">用户</a>
			<ul style="display: none">
				<li><a href="${pageContext.request.contextPath}/user/showuser.jsp" >用户信息</a>
				</li>
                <li><a href="${pageContext.request.contextPath}/user?m=showIntegral">用户积分</a>
                </li>
				<li class="last"><a href="${pageContext.request.contextPath}/user/upuser.jsp" >用户升级</a>
				</li>
			</ul>
		</li>
		<li><a  class="inactive">信息</a>
			<ul style="display: none">
				<li><a href="${pageContext.request.contextPath}/user?m=showMessageByType&t=1" >待审核信息</a>
				</li>
				<li><a  class="inactive">已审核信息</a>
					<ul style="display: none">
						<li><a href="${pageContext.request.contextPath}/user?m=showMessageByType&t=0" >审核未通过</a>
						</li>
						<li><a href="${pageContext.request.contextPath}/user?m=showMessageByType&t=2">审核通过</a>
						</li>
						<li class="last"><a href="${pageContext.request.contextPath}/user?m=showMessageByType&t=3" >已推送</a>
						</li>
					</ul>
				</li>
			</ul>
		</li>
		<li class="last"><a href="${pageContext.request.contextPath}/user?m=showDeleteMessage" >回收站</a>
	</ul>
</div>

</body>
</html>
