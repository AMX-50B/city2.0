<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" href="${pageContext.request.contextPath}/css/fb.css" rel="stylesheet">
<script>
    function put() {
        var value = document.getElementsByName("text").value;
        window.location.href("");
    }
</script>
<table class="search" >
    <tr>
        <td width="20%"></td>
        <td style="font-family: 'Viner Hand ITC';color: white;font-size: larger">Search</td>
        <td><input class="text" type="text" style="color: lightsteelblue;font-size:large;width:100%;height:40px" placeholder="请输入搜索内容"/></td>
        <td><input type="button" onclick="put()" style="background-image: url(${pageContext.request.contextPath}/image/Search.png);width: 42px;height: 40px;border: 0"/></td>
        <td width="80px"><a class="fb" href="${pageContext.request.contextPath}/user/putmessage.jsp">信息发布</a></td>
        <td width="100px"></td>
    </tr>
</table>