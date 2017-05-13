<%--
  Created by IntelliJ IDEA.
  User: LY
  Date: 2017/5/9
  Time: 0:10
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css" type="text/css"/>
</head>
<body>
<script type="text/javascript">
    function show(id) {
        location.href="${pageContext.request.contextPath}/admin?m=userInfo&id="+id;
    }

    //delete
    var deleteUser = function (id,obj) {
        if(!confirm("确认删除，删除后不可恢复！")){
            return;
        }
        var url='${pageContext.request.contextPath}/super?m=deleteUserClearById';
        $.ajax({
            url:url,
            type:'post',
            data:{id:id},
            success:function (result) {
                if(!result){
                    alert("删除失败！");
                }else{
                    var par = $(obj).parent().parent("tr");
                    $(par).remove();
                    alert("删除成功！");
                }
            }
        })
    }
    //userState
    var changuserState = function (status,id,obj) {
        var url= '${pageContext.request.contextPath}/super?m=changeUserStateById';
        $.ajax({
            url:url,
            type:'post',
            data:{id:id,status:status},
            success:function (result) {
                if(!result){
                    alert("操作失败！");
                }else{
                    //window.location.reload();
                    var par = $(obj).parent().parent("tr").find('td:nth-child(6)');
                    if(status === 3){
                        $(obj).val('撤销管理员');
                        $(obj).attr('onclick','changuserState(2,"'+id+'",this)');
                        $(par).text('管理员');
                    }else{
                        $(obj).val('升为管理员');
                        $(obj).attr('onclick','changuserState(3,"'+id+'",this)');
                        $(par).text('会员用户');
                    }
                    alert("操作成功！");
                }
            }
        })
    }
    //State
    var changeState = function (status,id,obj) {
        var mes,ks ;
        if(status==0){
            mes = "确定删除？删除后可在回收站恢复！";
            ks = "删除成功！";
        }else{
            mes = "确定恢复？恢复后可在用户信息查阅！";
            ks = "恢复成功！";
        }
       if(!confirm(mes)){
           return;
       }
        var url= '${pageContext.request.contextPath}/admin?m=deleteUserById';
        $.ajax({
            url:url,
            type:'post',
            data:{id:id,status:status},
            success:function (result) {
                if(!result){
                    alert(ks);
                }else{
                    //window.location.reload();
                    var par = $(obj).parent().parent("tr");
                    if(status === 0){
                        $(obj).val('删除');
                        $(obj).attr('onclick','changeState(2,"'+id+'",this)');
                        $(par).remove();
                    }else{
                        $(obj).val('恢复');
                        $(obj).attr('onclick','changeState(3,"'+id+'",this)');
                        $(par).remove();
                    }
                    alert(ks);
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
                    <th>ID</th>
                    <th>Name</th>
                    <th>Sex</th>
                    <th>E-Email</th>
                    <th>integral</th>
                    <th>type</th>
                    <th>date</th>
                    <th>Operate</th>
                </tr>
                <c:forEach items="${list}" var="m" varStatus="s">
                    <tr class="${s.count%2==1?'':'row'}" id="${m.id}">
                        <td>${m.id}</td>
                        <td>${m.userName}</td>
                        <td>${m.sex=='1'?"男":"女"}</td>
                        <td>${m.userEmail}</td>
                        <td>${m.userIntegral}</td>
                        <td>${m.userState==1?"普通用户":m.userState==2?"会员用户":"管理员"}</td>
                        <td>${m.date}</td>
                        <td>
                            <input type="button" onclick="show('${m.id}')" value="详情"/>
                            <c:if test="${m.state==1}"><input type="button" onclick="changeState(0,'${m.id}',this)" value="删除"/></c:if>
                            <c:if test="${m.state==0&&user.userState==4}"><input type="button" onclick="deleteUser('${m.id}',this)" value="彻底删除"/></c:if>
                            <c:if test="${m.state==0}"><input type="button" onclick="changeState(1,'${m.id}',this)" value="恢复"/></c:if>
                            <c:if test="${m.state==1&&m.userState!=3&&user.userState==4}"><input type="button" onclick="changuserState(3,'${m.id}',this)" value="升为管理员"/></c:if>
                            <c:if test="${m.state==1&&m.userState==3&&user.userState==4}"><input type="button" onclick="changuserState(2,'${m.id}',this)" value="撤销管理员"/></c:if>
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

