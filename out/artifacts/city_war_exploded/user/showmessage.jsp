<%--
  Created by IntelliJ IDEA.
  User: LY
  Date: 2017/4/23
  Time: 23:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>用户中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css" type="text/css">
</head>

<body>
<script type="text/javascript">
    function show(id) {
        location.href="${pageContext.request.contextPath}/user?m=showMessageById&s=1&id="+id;
    }
    function modify(id) {
        location.href="${pageContext.request.contextPath}/user?m=showMessageById&s=1&id="+id;
    }
        //delete
        var changeState = function (status,id,obj) {
            var mes,rs ;
            if(status==1){
                mes = "确定删除？";
                re = "删除成功,删除后可在回收站恢复！";
            }else{
                mes = "确定恢复？";
                re = "恢复成功，恢复后可在信息查阅！";
            }
            if(!confirm(mes)){
                return;
            }
            var url= '${pageContext.request.contextPath}/user?m=deleteMessageById';
            $.ajax({
                url:url,
                type:'post',
                data:{id:id,status:status},
                success:function (result) {
                    if(!result){
                        alert("操作失败！");
                    }else{
                        //window.location.reload();
                        var par = $(obj).parent().parent("tr");
                            $(par).remove();
                            alert(re);
                    }
                }
            })
        }
//changetype
    var changetype = function (status,id,obj) {
        var mes,re;
        if(status==1) {
            mes="确认重新发布？";
            re = "重新发布成功，请到未审核信息查看！";
        }else if(status==2) {
            mes = "确认取消推送？取消后积分将不会返回！";
            re = "取消推送成功，请到通过审核查看！";
        }else
        if(!confirm(mes)) {
            return;
        }
        var url= '${pageContext.request.contextPath}/user?m=changeType';
        $.ajax({
            url:url,
            type:'post',
            data:{id:id,status:status},
            success:function (result) {
                if(!result){
                    alert("操作失败！");
                }else{
                    //window.location.reload();
                    var par = $(obj).parent().parent("tr");
                        $(par).remove();
                        alert(re);
                }
            }
        })
    }
    //send
    var send = function (id,obj) {
        if(!confirm("确认推送？，本次推送将消耗积分！")){
            return;
        }
        var url= '${pageContext.request.contextPath}/user?m=sendMessageById';
        $.ajax({
            url:url,
            type:'post',
            data:{id:id},
            success:function (resulet) {
                console.log(resulet)
                if(resulet=='1'){
                    var par = $(obj).parent().parent("tr");
                    $(par).remove();
                    alert("推送成功，请到已推送查看！");
                }else if(resulet=='0'){
                    alert("推送失败！");
                }else {
                    alert("积分不足，请先充值！");
                    if(confirm("去充值？")){
                        location.href="${pageContext.request.contextPath}/user/upuser.jsp";
                    }
                }
            }
        })
    }
</script>
<div id="containe">
    <%@include file="../head.jsp"%>

    <%@include file="../menu.jsp"%>

    <jsp:include page="../search.jsp" />

    <div id="bodier" style="height:500px;background: transparent">
        <div id="menu" style="width: 209px;height:100%;background:#467ca2;float: left;-moz-border-radius: 5px;-webkit-border-radius: 5px;">
            <%@include file="usermenu.jsp"%>
        </div>
        <div id = "usertable" style="width:970px;height: 100%;float: left;margin-left: 20px;background: #9aafe5;-moz-border-radius: 5px;-webkit-border-radius: 5px;" align="center" >
            <div style="width: 100%;">
            <h1 style="font-size:30px;color: forestgreen;margin-top: 20px;" align="center">信息管理</h1>
            <hr align="center" style="margin-top: 10px;color: #006f78;width: 98%" >
            </div>
            <table id="utable" style="margin: 10px;color: #990099">
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Category</th>
                    <th>Man</th>
                    <th>Phone</th>
                    <th>Data</th>
                    <th>Operate</th>
                </tr>
                <c:forEach items="${list}" var="m" varStatus="s">
                    <tr class="${s.count%2==1?'':'row'}">
                        <td>${m.id}</td>
                        <td>${m.title}</td>
                        <td>${m.category}</td>
                        <td>${m.contacts}</td>
                        <td>${m.phone}</td>
                        <td>${m.date}</td>
                        <td>
                            <input type="button" onclick="show('${m.id}')" value="详情"/>
                            <c:if test="${m.state==2}"><input type="button" onclick="modify('${m.id}')" value="修改"/></c:if>
                            <c:if test="${m.state==2&&m.type==2}"> <input type="button" onclick="send('${m.id}',this)" value="推送"/></c:if>
                            <c:if test="${m.state==2&&m.type==3}"><input type="button" onclick="changetype(2,'${m.id}',this)" value="取消推送"/></c:if>
                            <c:if test="${m.state==2&&m.type==0}"><input type="button" onclick="changetype(1,'${m.id}',this)" value="重新发布"/></c:if>
                            <c:if test="${m.state==2}"><input type="button" onclick="changeState(1,'${m.id}',this)" value="删除"/></c:if>
                            <c:if test="${m.state==1}"><input type="button" onclick="changeState(2,'${m.id}',this)" value="恢复"/></c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div id="footer">
        <jsp:include page="../foot.jsp" />
    </div>
</div>
</body>
</html>

