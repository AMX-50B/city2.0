<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LY
  Date: 2017/4/27
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css" type="text/css">
</head>
<body>
<script type="text/javascript">
    function show(id) {
        location.href="${pageContext.request.contextPath}/admin?m=showMessageById&id="+id;
    }
    //delete clear
    var delc = function (id,obj) {
        if(!confirm("确定删除，删除后不可恢复！")){
            return;
        }
        var url = "${pageContext.request.contextPath}/super?m=deleteMessageClearById";
        $.ajax({
            url:url,
            type:'post',
            data:{id:id},
            success:function (resulet) {
                if(!resulet){
                    alert("删除失败！");
                }else {
                    var par =$(obj).parent().parent("tr");
                    $(par).remove();
                    alert("删除成功！");
                }
            }
        })
    }
    //delete
    var changeState = function (status,id,obj) {
        var mes ;
        if(status==0){
            mes = "确认删除？删除后可在回收站恢复！";
        }else {
            mes = "确认恢复？恢复后可在信息管理查看！"
        }
        if(!confirm(mes)){
            return;
        }
        var url= '${pageContext.request.contextPath}/admin?m=deleteMessageById';
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
                    if(status == 0){
                        $(par).remove();
                        alert("删除成功！");
                    }else{
                        $(par).remove();
                        alert("恢复成功！")
                    }
                }
            }
        })
    }
    //check
    var changeType = function (status,id,obj) {
        var mes ;
        var url= '${pageContext.request.contextPath}/admin?m=checkMessageById';
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
                    if(status==1){
                        $(par).remove();
                        alert("取消审核成功，请到未审核查看！");
                    }else{
                        $(par).remove();
                        alert("审核成功，请到已审核查看！")
                    }
                }
            }
        })
    }
</script>
<div id="containe">
    <%@include file="../head.jsp"%>
    <div id="bodier" style="height:600px;background: transparent;">
        <div id="menu" style="width: 209px;height:100%;background:#467ca2;float: left;-moz-border-radius: 5px;-webkit-border-radius: 5px;">
            <%@include file="menu.jsp"%>
        </div>
        <div id = "usertable" style="width:970px;height: 100%;float: left;margin-left: 20px;background: #9aafe5;-moz-border-radius: 5px;-webkit-border-radius: 5px;" align="center" >
            <h1 style="font-size:30px;color: forestgreen;margin-top: 20px;" align="center">信息管理</h1>
            <div style="width: 100%;height: auto">
                <%@include file="messagesearch.jsp"%>
            </div>
            <hr align="center" style="margin-top: 10px" >

            <table id="utable" style="margin: 10px;color: #990099">
                <tr>
                    <th style="width: 150px;overflow: hidden;text-overflow: ellipsis;">ID</th>
                    <th>Title</th>
                    <th>Category</th>
                    <th>Man</th>
                    <th>userid</th>
                    <th>state</th>
                    <th>Data</th>
                    <th>Operate</th>
                </tr>
                <c:forEach items="${list}" var="m" varStatus="s">
                <tr class="${s.count%2==1?'':'row'}">

                    <td style="width: 150px;overflow: hidden;text-overflow: ellipsis;">${m.id}</td>
                    <td>${m.title}</td>
                    <td>${m.category}</td>
                    <td>${m.contacts}</td>
                    <td>${m.user_id}</td>
                    <td>${m.type==0?"未通过":m.type==1?"待审核":m.type==2?"已通过":"已推送"}</td>
                    <td>${m.date}</td>
                    <td>
                        <input type="button" onclick="show('${m.id}')" value="详情"/>
                        <c:if test="${m.state==2}"> <input type="button" onclick="changeState(0,'${m.id}',this)" value="删除"/></c:if>
                        <c:if test="${m.state==2&&m.type==1}"><input type="button" onclick="changeType(2,'${m.id}',this)" value="通过"/> </c:if>
                        <c:if test="${m.state==2&&m.type==1}"><input type="button" onclick="changeType(0,'${m.id}',this)" value="不通过"/> </c:if>
                        <c:if test="${m.state==2&&m.type!=1}"><input type="button" onclick="changeType(1,'${m.id}',this)" value="重新审核"/> </c:if>
                        <c:if test="${m.state<2}"><input type="button" onclick="changeState(2,'${m.id}',this)" value="恢复"/> </c:if>
                        <c:if test="${m.state<2&&user.userState==4}"><input type="button" onclick="delc('${m.id}',this)" value="彻底删除"/> </c:if>
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
