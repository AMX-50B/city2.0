<%--
  Created by IntelliJ IDEA.
  User: LY
  Date: 2017/5/1
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #mut caption {
            padding: 0 0 5px 0;
            width: 100%;
            font: italic 20px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
            font-color:#4f6b72;
            text-align: center;
        }
        #mut{ background: transparent;padding: 0px;font-size: 15px;border-collapse: collapse;}
        #mut th{text-align: center;color:#4f6b72;height: 30px;width: 10%;font-family:华文新魏}
        #mut td{text-align: left; height: 30px;width: 70px;font-family:微软雅黑;font-size: 15px;}
        #mut input{height: 100%;width:90%;font-family:微软雅黑;font-size: 15px;}
        #mut .uts{text-align: left;color: #194105}
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
<div style="width: 100%;background-color: transparent">
    <h1 style="font-size:20px;color: #6196bb;margin-top: 20px;margin-left: 20px;"align="left">高级搜索</h1>
    <hr align="center" style="color: #DB4F4E;margin-bottom: 10px">
    <form>
    <table id="mut" width="90%" align="center" cellpadding="10px">
        <tr>
            <th style="">时间：</th>
            <td>从&nbsp;&nbsp;<input type="text" name="time1" style="width: 37%;height: 30px">&nbsp;&nbsp;至&nbsp;&nbsp;<input type="text" name="time2" style="width: 37%;height: 30px"></td>
            <th style="margin-left: 10px">类别查找：</th>
            <td >父类：<select id="s1"  onchange="getsel()" style="width: 36%;text-align: left; height: 30px;font-family:微软雅黑;font-size: 15px;">
                <option value="0">请选择一个类别</option>
                <option value="1">招聘信息</option>
                <option value="2">房屋信息</option>
                <option value="3">车辆信息</option>
                <option value="4">家政信息</option>
                <option value="5">物流信息</option>
                <option value="6">宠物信息</option>
                <option value="7">旅游信息</option>
                <option value="8">培训信息</option>
                <option value="9">其它信息</option>
            </select>子类：
                <select id="s2" name="category" style="width: 37%;text-align: left; height: 30px;font-family:微软雅黑;font-size: 15px;">
                    <option value="90">请选择一个类别</option>
                </select></td>
        </tr>
        <tr>
            <th>ID查找：</th>
            <td><input type="text" name="id"></td>
            <th style="">标题查找：</th>
            <td><input type="text" name="title" style="width: 100%"></td>
        </tr>
        <tr>
            <th>发布者：</th>
            <td><input type="text" name="user_id" style="height: 30px"></td>
        </tr>
    </table>
    </form>
</div>
</body>
</html>
