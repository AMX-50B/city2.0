<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>show</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="css/swiper.min.css">

    <!-- Demo styles -->
    <style>
    .swiper-container {
        width: 100%;
        height: 300px;
        margin: 20px auto;
    }
    .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        
        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
    }
    </style>
</head>
<body id="re">
    <!-- Swiper -->
    <h1 style="font-size:30px;color: forestgreen;margin-top: 20px;" align="center">推荐信息</h1>
    <hr align="center" style="color: #006f78">
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><div class="tuwen ">
                <div style="height: 100%;width: 40%;float: left">
                    <img src="images/5.jpg" width="90%" height="180px">
                </div>
                <div style="height: 90%;width: 59%;float: left">
                    <h1 style="font-size: 20px;font-family: 华文宋体">这里是测试文本</h1>
                    <hr style="color: #999E9F">
                    <p>这里也是测试文本</p>
                </div></div>
            </div></div>
            <div class="swiper-slide"><div class="tuwen ">
                <div style="height: 90%;width: 40%;float: left">
                    <img src="images/5.jpg" width="90%" height="100%">
                </div>
                <div style="height: 90%;width: 59%;float: left">
                    <a>这里是测试文本</a>
                    <br>
                    <p>这里也是测试文本</p>
                </div>
            </div></div>
            <div class="swiper-slide"><div class="tuwen ">
                <div style="height: 90%;width: 40%;float: left">
                    <img src="images/5.jpg" width="90%" height="100%">
                </div>
                <div style="height: 90%;width: 59%;float: left">
                    <h1>这里是测试文本</h1>
                    <br>
                    <p>这里也是测试文本</p>
                </div>
            </div></div>
            <div class="swiper-slide">Slide 4</div>
            <div class="swiper-slide">Slide 5</div>
            <div class="swiper-slide">Slide 6</div>
            <div class="swiper-slide">Slide 7</div>
            <div class="swiper-slide">Slide 8</div>
            <div class="swiper-slide">Slide 9</div>
            <div class="swiper-slide">Slide 10</div>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
    </div>

    <!-- Swiper JS -->
    <script src="js/swiper.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        slidesPerView: 3,
        paginationClickable: true,
        spaceBetween: 10,
        freeMode: true,
        loop: true,
        autoplay: 3000,
    });
    </script>
</body>
</html>