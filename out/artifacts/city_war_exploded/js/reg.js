/**
 * Created by LY on 2017/5/3.
 */
window.onload=function () {

    var name;
    var word;
    var word2;
    var mail;
    var code;
    var username = document.getElementById("username");
    var pword1 = document.getElementById("password");
    var pword2 = document.getElementById("re_pwd");
    var email = document.getElementById("email");
    var imcode = document.getElementById("code");

    username.onblur = function () {
        name=false;
        if (username.value.length < 4 || username.value.length > 8) {
            $('#sh1').html("*用户名长度不符合！*")
            $('#sh1').attr("style", 'color:red;');
        } else if (!isLetter(username.value)) {
            $('#sh1').html("*用户名格式不符合！*");
            $('#sh1').attr("style", 'color:red;');
        } else {
            $.ajax({
                type: 'post',
                url: './index?m=userNameCheck',
                data: {username: username.value},
                success: function (result) {
                    if(result=="0"){
                        $('#sh1').html("*用户名已存在！*");
                        $('#sh1').attr("style",'color:red;');
                    }else if(result=="1"){
                        $('#sh1').html("*OK！*");
                        $('#sh1').attr("style",'color:green;');
                        name=true;
                        ok();
                    }

                }
            });
        }
    }

    pword1.onkeyup=function () {
        word=false;
        if(pword1.value.length<6||pword1.value.length>10){
            $('#sh2').html("*密码长度不符合！*")
            $('#sh2').attr("style", 'color:red;');
        }else if(!isNumberOrLetter(pword1.value)){
            $('#sh2').html("*用户名格式不符合！*");
            $('#sh2').attr("style", 'color:red;');
        }else {
            $('#sh2').html("*OK！*");
            $('#sh2').attr("style",'color:green;');
            word=true;
            ok();
        }
    }

    pword2.onkeyup=function () {
        word2=false;
        if(pword1.value!=pword2.value){
            $('#sh3').html("*两次密码不一致！*")
            $('#sh3').attr("style", 'color:red;');
        }else{
            $('#sh3').html("*OK！*");
            $('#sh3').attr("style",'color:green;');
            word2=true;
            ok();
        }
    }

    email.onkeyup=function () {
        mail=false;
        if(!isEmail(email.value)){
            $('#sh4').html("*邮箱格式不符合！*");
            $('#sh4').attr("style", 'color:red;');
        }else{
            $('#sh4').html("*OK！*");
            $('#sh4').attr("style",'color:green;');
            mail=true;
            ok();
        }
    }

    imcode.onkeyup=function () {
        code=false;
        if(imcode.value.length!=4){
            $('#sh5').html("*验证码有误！*");
            $('#sh5').attr("style",'color:red;');
        } else if(imcode.value.length==4){
            $.ajax({
                type: 'post',
                url: './index?m=imageCode',
                data: {imcode: imcode.value},
                success: function (result) {
                    if(result=="0"){
                        $('#sh5').html("*验证码错误！*");
                        $('#sh5').attr("style",'color:red;');
                    }else if(result=="1"){
                        $('#sh5').html("*OK！*");
                        $('#sh5').attr("style",'color:green;');
                        code=true;
                        ok();
                    }

                }
            });
        }
    }
    
    $(".form-control").on('keyup',function (e) {
        ok();
    })

    function ok() {
        if(name&&word&&word2&&mail&&code){
            $('#sub').removeAttr("disabled");
        }else {
            $('#sub').attr("disabled",'disabled')
        }
    }

}
function isNumberOrLetter( s ){//判断是否是数字或字母

    var regu = "^[0-9a-zA-Z]+$";
    var re = new RegExp(regu);
    if (re.test(s)) {
        return true;
    }else{
        return false;
    }
}

function isLetter( s ){//判断是否是字母

    var regu = "^[a-zA-Z]";
    var re = new RegExp(regu);
    if (re.test(s)) {
        return true;
    }else{
        return false;
    }
}

function isEmail( str ){
    var myReg = /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/;
    if(myReg.test(str)) return true;
    return false;
}

