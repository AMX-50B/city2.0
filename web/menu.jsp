<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css" type="text/css" />
<nav>
    <ul class="clear" style="float: left;width: 100%">
        <li class="mli first"><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
        <li class="mli">
            <span class="Darrow"></span>
            <a href="#">招聘信息</a>
            <dl>
                <dt><span class="arrow"></span></dt>
                <dd><a href="#">企业招聘</a></dd>
                <dd><a href="#">兼职信息</a></dd>
                <dd><a href="#">求职信息</a></dd>
            </dl>
        </li>
        <li class="mli">
            <span class="Darrow"></span>
            <a href="#">房屋信息</a>
            <dl>
                <dt><span class="arrow"></span></dt>
                <dd><a href="#">二手交易</a></dd>
                <dd><a href="#">房屋出租</a></dd>
                <dd><a href="#">楼盘信息</a></dd>
            </dl>
            </dl>
        </li>
        <li class="mli">
            <span class="Darrow"></span>
            <a href="#">车辆信息</a>
            <dl>
                <dt><span class="arrow"></span></dt>
                <dd><a href="#">二手车交易</a></dd>
                <dd><a href="#">车辆保养</a></dd>
                <dd><a href="#">代驾出租</a></dd>
            </dl>
        </li >
        <li class="mli"><span class="Darrow"></span>
            <a href="#">家政信息</a>
            <dl>
                <dt><span class="arrow"></span></dt>
                <dd><a href="#">保姆月嫂</a></dd>
                <dd><a href="#">房屋保洁</a></dd>
                <dd><a href="#">维修换锁</a></dd>
            </dl></li>
        <li class="mli"><span class="Darrow"></span>
            <a href="#">物流信息</a>
            <dl>
                <dt><span class="arrow"></span></dt>
                <dd><a href="#">快递物流</a></dd>
                <dd><a href="#">搬家信息</a></dd>
                <dd><a href="#">货车出租</a></dd>
            </dl></li>
        <li class="mli"><span class="Darrow"></span>
            <a href="#">宠物信息</a>
            <dl>
                <dt><span class="arrow"></span></dt>
                <dd><a href="#">宠物美容</a></dd>
                <dd><a href="#">宠物交流</a></dd>
                <dd><a href="#">宠物救助</a></dd>
            </dl></li>
        <li class="mli"><span class="Darrow"></span>
            <a href="#">旅游信息</a>
            <dl>
                <dt><span class="arrow"></span></dt>
                <dd><a href="#">旅行社</a></dd>
                <dd><a href="#">酒店机票</a></dd>
                <dd><a href="#">景点攻略</a></dd>
            </dl></li>
        <li class="mli"><span class="Darrow"></span>
            <a href="#">培训信息</a>
            <dl>
                <dt><span class="arrow"></span></dt>
                <dd><a href="#">职业培训</a></dd>
                <dd><a href="#">技能培训</a></dd>
                <dd><a href="#">家教信息</a></dd>
            </dl></li>
        <li class="mli"><a href="#">其它信息</a></li>
        <li class="mli" STYLE="border-right: 1px solid #999E9F;"><span class="Darrow"></span>
            <a href="#">用户中心</a>
            <dl>
                <dt><span class="arrow"></span></dt>
                <dd><a href="${pageContext.request.contextPath}/login.jsp">用户登录</a></dd>
                <dd><a href="${pageContext.request.contextPath}/user/account.jsp">个人中心</a></dd>
            </dl></li>
    </ul>
</nav>
