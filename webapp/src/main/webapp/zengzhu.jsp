<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <%--//登陆效果--%>
    <link href="<%=request.getContextPath() %>/js/js.js" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/zxl/pages/css/base.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/zxl/pages/css/login/login.css" rel="stylesheet">


    <script type="text/javascript" src="<%=request.getContextPath() %>/js/My97DatePicker/WdatePicker.js"></script>

    <%--//图片验证--%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/zxl/pages/tupianyanz/css/style.css">
    <script type="text/javascript" src="<%=request.getContextPath() %>/zxl/pages/tupianyanz/css/style.js"></script>

    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <style>
        .con {
            padding:20px;
            border:1px solid #000;
            height:160px;
            width:340px;
            margin:0px auto;
        }
        .con .con-box {
            height:100px;
            width:300px;
            background:url("http://www.jq22.com/img/cs/500x300-2.png") no-repeat center;
            position:relative;
        }
        .con .con-box .con-slide {
            position:absolute;
            top:0;
            left:0px;
            width:60px;
            height:100px;
            background-repeat:no-repeat;
            background-position:right center;
            background-image:url("http://www.jq22.com/img/cs/300x500-1.png");
        }
        input[type=range] {
            width:100%;
        }
    </style>
    <style>  /*//zxl/tup/timg.jpg*/
    .body{
        background-image:url("/zxl/tup/timgRPD.jpg");
        transition: all .5s;
        padding:1px;
    }
    .veen{
        width: 70%;
        margin: 100px auto;
        background: rgba(255,255,255,.5);
        min-height: 420px;
        display:table;
        position: relative;
        box-shadow: 0 0 4px rgba(0,0,0,.14), 0 4px 8px rgba(0,0,0,.28);
    }
    .veen > div {
        display: table-cell;
        vertical-align: middle;
        text-align: center;
        color: #fff;
    }
    .veen button{
        background: transparent;
    //background-image: linear-gradient(90deg, #e0b722, #ff4931);
        display: inline-block;
        padding: 10px 30px;
        border: 3px solid #fff;
        border-radius: 50px;
        background-clip: padding-box;
        position: relative;
        color: #FFF;
    //box-shadow: 0 0 4px rgba(0,0,0,.14), 0 4px 8px rgba(0,0,0,.28);
        transition: all .25s;
    }
    .veen button.dark{
        border-color: #ff4931;
        background: #ff4931;
    }
    .veen .move button.dark{
        border-color: #e0b722;
        background: #e0b722;
    }
    .veen .splits p{
        font-size: 18px;
    }
    .veen button:active{
        box-shadow: none;
    }
    .veen button:focus{
        outline: none;
    }
    .veen > .wrapper {
        position: absolute;
        width: 40%;
        height: 125%;
        top: -10%;
        left: 5%;
        background: #fff;
        box-shadow: 0 0 4px rgba(0,0,0,.14), 0 4px 8px rgba(0,0,0,.28);
        transition: all .5s;
        color: #303030;
        overflow: hidden;
    }
    .veen .wrapper > div{
        padding: 15px 30px 30px;
        width: 100%;
        transition: all .5s;
        background: #fff;
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
    }
    .veen .wrapper #login{
        padding-top: 20%;
    }
    .veen .wrapper #register{
        left: 100%;
    }
    .veen .wrapper.move #register{
        left: 0%;
    }
    .veen .wrapper.move #login{
        left: -100%;
    }
    .veen .wrapper > div> div {
        position: relative;
        margin-bottom: 15px;
    }
    .veen .wrapper label{
        position: absolute;
        top: -7px;
        font-size: 12px;
        white-space: nowrap;
        background: #fff;
        text-align: left;
        left: 15px;
        padding: 0 5px;
        color: #999;
        pointer-events: none;
    }
    .veen .wrapper h3{
        margin-bottom: 25px;
    }
    .veen .wrapper input{
        height: 40px;
        padding: 5px 15px;
        width: 100%;
        border: solid 1px #999;
    }
    .veen .wrapper input:focus{
        outline: none;
        border-color: #ff4931;
    }
    .veen > .wrapper.move{
        left: 45%;
    }
    .veen > .wrapper.move input:focus{
        border-color: #e0b722;
    }
    </style>

</head>

<body>
<script src="http://www.jq22.com/jquery/jquery-ui-1.11.0.js"></script>
<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
<div class="body">
    <div class="veen">
        <div class="login-btn splits">
            <p>已经是用户?</p>
            <button>登录</button>
        </div>
        <div class="rgstr-btn splits">
            <p>没有一个帐户?</p>
            <button>注册</button>
        </div>
        <div class="wrapper">
            <div id="login">
                <h3>登录</h3>
                <div class="mail">
                    <input id="unsst" type="text" name="credentials.username" tabIndex="1" class="ipt ipt_username" style="outline: none;" />

                    <label>用户名</label>
                </div>
                <div class="passwd">
                    <input id="pwdsst" type="password" name="credentials.username" tabIndex="1" class="ipt ipt_username" style="outline: none;" />

                    <label>密码</label>
                </div>
                <%-- 图片验证--%>
                <div class="con" >
                    <div class="con-box">
                        <div class="con-slide" id="conSlide"></div>
                    </div>
                    <input id="range" type="range" value="0">
                </div>
                <div class="submit">
                    <button class="dark" onclick="qiantdenglu()">登录</button>
                </div>
            </div>
            <div id="register">
                <h3>注册</h3>
                <div class="name">
                    <input  id="unss" type="text" name="" onclick="wewe(this)">
                    <label>用户名</label>
                </div>

                <div class="passwd" id="ap">
                    <input id="pwdss"type="password" name="" onclick="wewe(this)">
                    <label>密码</label>
                </div>
                <div class="passwd" id="a1p">
                    <input id="pwdssto"type="password" name="" onclick="wewe(this)">
                    <label>验证密码</label>
                </div>
                <div class="mail">
                    <input id="dianhua"type="mail" name="" onclick="wewe(this)">

                    <label>手机号</label>
                </div>

                <div class="uid">
                    <input id="zhenname"type="text" name="" onclick="wewe(this)">
                    <label>真实姓名</label>
                </div>

                <div class="name">
                    <table border="1" bgcolor="blue">
                        <tr>
                            <td><label>生日</label></td>

                            <input type="text" class="Wdate" id="zxlshijian" name="Reader_date"
                                   onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" onclick="wewe(this)"/>
                        </tr>
                    </table>
                </div>
                <div class="uid">

                    <input  id="yanzhneg"type="text" name="" onclick="wewe(this)">

                    <label>手机验证信息</label>
                    </span>
                    <div class="submit">
                        <button class="dark" onclick="qianglu()">注册</button>

                        <button class="dark" onclick="qiaduanx()" id="aw">手机验证</button>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <input  id="nianl"type="hidden" name="" value="22">
    <script>


        $(document).ready(function(){
            $(".veen .rgstr-btn button").click(function(){
                $('.veen .wrapper').addClass('move');

                // $('.body').css('background','#e0b722');
                $('.body').css('background','url("/zxl/tup/tim8L5.jpg")');
            });
            $(".veen .login-btn button").click(function(){
                $('.veen .wrapper').removeClass('move');
                // $('.body').css('background','#ff4931');

                $('.body').css('background','url("/zxl/tup/timg.jpg")');


            });
        });
    </script>
</body>

<%--注册--%>
<script>
    //点击文本框 清空值
    function wewe(obj){

        var text = document.getElementById(obj.id);
        text.value = "";
        //  text.css('color','gray');

    }
    /*密码清空*/
    function wewes(obj) {
        var wenb = '<div class="passwd" id="ap">' +
            '<input id="pwdss"type="password" name="" onclick="wewe(this)">' +
            '<label>密码</label>' +
            '</div>';
        var wenbs = '<div class="passwd" id="a1p">' +
            '<input id="pwdssto"type="password" name="" onclick="wewe(this)">' +
            '<label>验证密码</label>' +
            '</div>';

        $("#ap").html(wenb);
        $("#a1p").html(wenbs);
    }
    var count=0;
    var fangse="669058";
    function qiaduanx(){
        if(count>0){
            return false;
        }
        count++;
        //alert(1);
        /*  var ann ="<a class='act-but submit' onclick='adduss()' style='color: #FFFFFF'>"+"发验证短信"+"</a>"
          var yan="<h4>验证码<h4>";
          var text1="<input type='text' name='mia'/>";
          $("#adddiv").html(yan+text1);*/

        var time = 50;   //倒计时5秒
        var timer = setInterval(fun1, 1000);//设置定时器
        function fun1() {
            time--;
            if(time>0) {
                $("#aw").html(time+'s');
                //获取手机号发送验证码
            }else{
                //bt01.innerHTML = "重新发送验证码";
                /*   bt01.disabled = false;    */ //倒计时结束能够重新点击发送的按钮
                clearTimeout(timer);    //清除定时器
                time = 500;   //设置循环重新开始条件
                count=0;
                alert("验证码失效请从新发送");

                $("#aw").html("手机验证");

                //$("#aw").val(ann);
            }

        }

        var a=$("#dianhua").val();

        $.ajax({
            url:"<%=request.getContextPath()%>/zxluser/adduserssv.do",
            type:"post",
            data:{"a":a},

            dataType:"text",
            scriptCharset: 'utf-8',
            success:function(fang){
                //idsStr = fang.substring(0,fang.length-0);
               // alert(fang)
                fangse=fang;

            },
            error:function(){

            }
        })
    }






    function qianglu(){

        //验证码是否正确
        var yanzhneg=$("#yanzhneg").val();
        if(fangse!=yanzhneg){
            $("#yanzhneg").val("验证码不对");
            $("#yanzhneg").css('color','red');

            return false;
        }
        //非空
        var unss=$("#unss").val();
        if (unss=="" || unss=="不能为空") {

            $("#unss").val("不能为空");
            return false;
        }

        var pwdss=$("#pwdss").val();
        alert(pwdss);
        var pwdssto=$("#pwdssto").val();
        alert(pwdss+pwdssto);
        if (pwdss!=pwdssto||pwdssto=="" ||pwdssto=="不能为空并保持一致") {

            var wenb='<div class="passwd" id="ap">'+
                '<input id="pwdsss"type="text" name="" onclick="wewes(this)" value="不能为空并保持一致">'+
                '<label>密码</label>'+
                '</div>';
            var wenbs='<div class="passwd" id="a1p">'+
                '<input id="pwdsstos"type="text" name="" onclick="wewes(this)" value="不能为空并保持一致">'+
                '<label>验证密码</label>'+
                '</div>';
            $("#ap").html(wenb);
            $("#a1p").html(wenbs);
            /*$("#pwdsss").val("不能为空并保持一致");
            $("#pwdsstos").val("不能为空并保持一致");*/

            return false;
        }
        //验证电话
        var dianhua=$("#dianhua").val();//电话
        var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
        if (!myreg.test($("#dianhua").val())) {
            $("#dianhua").val("手机号格式不对");
            return false;
        }
        //验证姓名
        var zhenname=$("#zhenname").val();//真实姓名
        if (zhenname==""||zhenname=="不能为空") {

            $("#zhenname").val("不能为空");

            return false;
        }
        var shengfenz=$("#nianl").val();
        //验证不为空
        var xuanz=$("#zxlshijian").val();
        if (xuanz==""||xuanz=="不能为空") {

            $("#zxlshijian").val("不能为空");
            return false;
        }
        // var xuanz=$(name="Reader_date").val();

        //  alert(xuanz)

        $.ajax({
            url:"<%=request.getContextPath()%>/zxluser/addShow.do",
            type:"post",
            data:{
                "unss":unss,
                "pwdss":pwdss,
                "dianhua":dianhua,
                "zhenname":zhenname,
                "xuanz":xuanz,
                "shengfenz":shengfenz
            },

            dataType:"text",
            scriptCharset: 'utf-8',
            success:function(fang){
                //idsStr = fang.substring(0,fang.length-0);
                //alert(fang)
                if(fang=="成功"){
                    // alert(fang);
                    // /!*  $('#modal-container-467928').modal('hide'); *!/
                    /*  document.getElementById("unss").value=" ";
                      document.getElementById("pwdss").value=" ";*/
                    location.href="<%=request.getContextPath()%>/main.jsp";
                }else if(fang=="用户名已存在"){
                    alert("用户已存在")
                }
            },
            error:function(){

            }
        })

    }
</script>

<%--//登陆--%>
<script>

    slide(range, conSlide, {
        max: 320,
        err: 20
    })
    /*
     * 滑动验证
     * range：滑动条 conSlide：划片 obj: max(最大滑动值)，err(误差值)
     *因为只针对一个图做的匹配，其中滑动的最完美值是320px的位置。
     * */


    var count=0;
    function slide(range, conSlide, obj) {
        var rangeValue;
        var flag = false;
        if (obj.max) {
            range.max = obj.max;
        }
        range.onmousedown = function() {
            flag = true;
            if (flag) {
                range.onmousemove = function() {
                    rangeValue = range.value;
                    conSlide.style.left = rangeValue + "px";
                }
            }
        }

        range.onmouseup = function() {
            flag = false;
            range.onmousemove = null;
            if (obj.err) {
                if (rangeValue >= (232 - obj.err) && rangeValue <= (232 + obj.err)) {
                    count++;
                    alert("验证成功");
                }
            } else {
                if (rangeValue >= 227 && rangeValue <= 237) {
                    count++;
                    alert("验证成功");
                }
            }

            conSlide.style.left = "0px";
            range.value = 0;
        }
    }




    //pageInit();

    /* $(document).ready(function(){
         var isIE=!!window.ActiveXObject;
         var isIE6=isIE&&!window.XMLHttpRequest;
         if (isIE6){
             $(".login_switch").hide();
         }
         if(1==0){
             $(".login_switch").hide();
         }

         jsLoginFed.loadImageUrl("1","Passport_Login_Ad_Click");

         var host = window.location.host;
         var reg_host = /([a-z0-9_-]+\.)*(yhd|yihaodian|1mall|111)\.(com\.hk)$/;
         if(reg_host.test(host)) {
             var requestUrl = URLPrefix.passport + "/passport/cookie_rurl_synchronization.do";
             cookie_sync.cookieRURLSynchronization(requestUrl);

             if(window.addEventListener){
                 window.addEventListener("message", handMessage, false);
             }
             else{
                 window.attachEvent("onmessage", handMessage);
             }

             $(".login_switch").hide();
         }
     });
 */
    function handMessage(event){
        event = event || window.event;
        if(event.origin === 'https://passport.yhd.com'){
            var obj = eval('(' + event.data + ')');
            window.location = obj.returnUrl;
        }
    }
    function qiantdenglu(){
        if(count==0){
            alert("验证未通过");
        }else{
            var un=$("#unsst").val();
            var pwd=$("#pwdsst").val();
            //alert(pwd)

            $.ajax({
                url:"<%=request.getContextPath()%>/zxluser/toShowlu.do",
                type:"post",
                data:{
                    "un":un,
                    "pwd":pwd
                },

                dataType:"text",
                scriptCharset: 'utf-8',
                success:function(fang){
                    //idsStr = fang.substring(0,fang.length-0);
                    //alert(fang)
                    if(fang=="成功"){
                        // alert(fang);
                        // /!*  $('#modal-container-467928').modal('hide'); *!/
                        /*  document.getElementById("unss").value=" ";
                          document.getElementById("pwdss").value=" ";*/
                        location.href="../main.jsp";


                    }else if(fang=='"用户或密码错误"'){
                        alert("用户或密码错误")
                    }
                },
                error:function(){

                }
            })
        }
    }
</script>

</html>
</body>
</html>