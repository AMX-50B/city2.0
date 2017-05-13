<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>home</title>
    <link rel="stylesheet" href="css/style.css">
<style type="text/css">
</style>
</head>
<body style="background-color: #F6F6F6;margin-top: 20px">
        <a class="control prev"></a><a class="control next abs"></a><!--自定义按钮，移动端可不写-->
        <div class="slider" style="border:5px solid gainsboro"><!--主体结构，请用此类名调用插件，此类名可自定义-->
            <ul>
                <li><a href=""><img src="ad/ad1.jpg" alt="两弯似蹙非蹙笼烟眉，一双似喜非喜含情目。" /></a></li>
                <li><a href=""><img src="images/2.jpg" alt="态生两靥之愁，娇袭一身之病。" /></a></li>
                <li><a href=""><img src="images/3.jpg" alt="泪光点点，娇喘微微。" /></a></li>
                <li><a href=""><img src="images/4.jpg" alt="闲静似娇花照水，行动如弱柳扶风。" /></a></li>
                <li><a href=""><img src="images/5.jpg" alt="心较比干多一窍，病如西子胜三分。" /></a></li>
            </ul>
        </div>
    <script src="js/jquery.min.js"></script>
    <script src="js/YuxiSlider.jQuery.min.js"></script>
    <script>
        $(".slider").YuxiSlider({
            width:1192, //容器宽度
            height:400, //容器高度
            control:$('.control'), //绑定控制按钮
            during:4000, //间隔4秒自动滑动
            speed:800, //移动速度0.8秒
            mousewheel:true, //是否开启鼠标滚轮控制
            direkey:false //是否开启左右箭头方向控制
        });
    </script>
        <script>
            var mySwiper = new Swiper('.swiper-container', {
                autoplay: 5000,//可选选项，自动滑动
            })
        </script>
    <div class="show" style="margin: 10px;width: 99%">
       <iframe align="center" frameborder="1"width="100%" height="450px" scrolling="no" src="recommend.jsp"></iframe>
    </div>
</body>
</html>

