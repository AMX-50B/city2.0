<%--
  Created by IntelliJ IDEA.
  User: LY
  Date: 2017/5/7
  Time: 15:31
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
        #mut th{text-align: left;color:#4f6b72;height: 40px;width:20px;font-family:华文新魏;}
        #mut td{text-align: left; height: 40px;width:200px;font: italic 15px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;}
        #mut input{height: 100%;width:100%;font: italic 20px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;}
        #mut .uts{text-align: left;color: #194105}
        #mut select{height: 100%;width: 36%;font: italic 20px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;}
    </style>
</head>

<body>
<script language="网页特效" type="text/javascript">
    //第2分类
    var cate=[
        ["招聘信息","兼职信息","求职信息"],  //招聘
        ["二手交易","房屋出租","楼盘信息"],  //房屋
        ["二手车交易","车辆保养","代驾出租"],  //车辆
        ["保姆月嫂","房屋保洁","维修换锁"],  //家政
        ["快递物流","搬家信息","货车出租"],  //物流
        ["宠物美容","宠物交流","宠物救助"],  //宠物
        ["旅行社","酒店机票","景点攻略"],  //旅游
        ["职业培训","技能培训","家教信息"],  //培训
        //其它
    ];
    function getsel(){
        //获得第一分类
        var category1=document.getElementById("s1")
        var category2=document.getElementById("s2");
        //得到第二分类列表
        var varray=cate[category1.selectedIndex-1];
        //将城市下拉列表框清空，仅留第一个提示选项
        category2.length=1;
        //将相应省市的城市填充到城市选择框中
        for(var i=0;i<varray.length;i++){
            //创建新的option对象并将其添加到城市下拉列表框中
            category2[i+1]=new Option(varray[i]);
            category2[i+1].value=category1.selectedIndex*10+i+1;
        }
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
        <div id = "usertable" style="width:970px;height: 100%;float: left;margin-left: 20px" align="center">
            <div id="pu" style="width: 100%;height: 100%;background: #9aafe5;-moz-border-radius: 5px;-webkit-border-radius: 5px;">
                <form action="${pageContext.request.contextPath}/user?m=modifyMessage" method="post" enctype="multipart/form-data">
                    <table id="mut" style="margin-left: 80px" align="center">
                        <caption style="color: #2e6ab1;margin-top: 40px; ">信息修改</caption>
                        <td><input type="text" name="id" hidden="hidden" value="${message.id}"></td>
                        <tr>
                            <th>主题：</th>

                            <td><input type="text" name="title" value="${message.title}"></td>
                            <td class="uts" name="us">请输入1-6个字符</td>
                        </tr>

                        <tr>
                            <th>简介：</th>
                            <td><input type="text" name="description" value="${message.description}"></td>
                            <td class="uts" name="ps">请输入6-10个字母或数字的组合</td>
                        </tr>

                        <tr>
                            <th align="top">类容:</th>
                            <td ><textarea rows="10" cols="80" name="context" value="">${message.context}</textarea></td>
                            <td  class="uts">请输入不超过500个字符</td>
                        </tr>
                        <tr>
                            <th>上传图片:</th>
                            <td><input type="file" name="imgUrl" align="middle"></td>
                            <td class="uts" name="es"></td>
                        </tr>
                        <tr>
                            <th>类别：</th>
                            <td style="font-size: 20px" >父类：<select id="s1"  onchange="getsel()">
                                <option value="0">请选择一个类别</option>
                                <option value="1" >招聘信息</option>
                                <option value="2" >房屋信息</option>
                                <option value="3" >车辆信息</option>
                                <option value="4" >家政信息</option>
                                <option value="5" >物流信息</option>
                                <option value="6" >宠物信息</option>
                                <option value="7" >旅游信息</option>
                                <option value="8" >培训信息</option>
                                <option value="9" >其它信息</option>
                            </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;子类：
                                <select id="s2" name="category" >
                                    <option value="90">请选择一个类别</option>
                                </select></td>
                            <td class="uts" name="ps">请输入6-10个字母或数字的组合</td>
                        </tr>
                        <tr>
                            <th>联系人:</th>
                            <td><input type="text" name="contacts" value="${message.contacts}"></td>
                            <td class="uts" name="es">请输入联系人</td>
                        </tr>
                        <tr>
                            <th>电话:</th>
                            <td><input type="text" name="phone" value="${message.phone}"></td>
                            <td class="uts" name="es">请输入电话</td>
                        </tr>
                        <tr>
                            <th></th>
                            <td><input style="width: 20%" type="submit" name="sub" value="提交">&nbsp;&nbsp;<input style="width: 20%" type="reset"value="重置"></td>
                            <td></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
                function jsSelectItemByValue(objSelect, objItemText) {
                    alert(objItemText)
                    for (var i = 0; i < objSelect.options.length; i++) {
                        if (objSelect.options[i].value == objItemText) {
                            objSelect.options[i].selected = true;
                            break;
                        }
                    }
                };
        jsSelectItemByValue(document.getElementById("s1"), ${message.category.charAt(0) });
        getsel();
        jsSelectItemByValue(document.getElementById("s2"), ${message.category });
    </script>
    <div id="footer">
        <jsp:include page="../foot.jsp" />
    </div>
</div>
</body>
</html>
