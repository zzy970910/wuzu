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

<%--//图片验证--%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/zxl/pages/tupianyanz/css/style.css">
    <script type="text/javascript" src="<%=request.getContextPath() %>/zxl/pages/tupianyanz/css/style.js"></script>

    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-easyui/jquery.easyui.min.js"></script>


</head>

<body class="easyui-layout">
<div class="login-hd">
    <div class="login-hd">
        <div class="left-bg"></div>
        <div class="right-bg"></div>
        <div class="hd-inner">
        <span class="logo"></span>
        <span class="split"></span>
        <span class="sys-name">蘑菇街国际购后台管理</span>
    </div>
</div>
<div class="login-bd">
    <div class="bd-inner">
        <div class="inner-wrap">
            <div class="lg-zone">
                <div class="lg-box">
                    <div class="lg-label"><h4>用户登录</h4></div>
                    <div class="lg-password input-item clearfix">
                        <i class="iconfont">&#xe62e;</i>

                        <input type="text" name="usrname" id="zxlusrname" placeholder="请输入用户名">
                    </div>
                    <form>

                        <div class="lg-password input-item clearfix">
                            <i class="iconfont">&#xe634;</i>
                            <div id="login-wrap">
                            <input type="password" name="usrpss" id="zxlusrpss" placeholder="请输入密码">

                            </div>
                        </div>
                        <div class="lg-check clearfix">

                        </div>
                        <div class="tips clearfix">

                        </div>
                        <div class="enter">
                            <a href="javascript:;" class="purchaser" onClick="login()">登录</a>
                            <a href="javascript:;" class="supplier" onClick="xians()">显示密码</a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="lg-poster" style="width: 700px;height: 520px;"></div>
        </div>
    </div>
</div>
<div class="login-ft">
    <div class="ft-inner">
        <div class="about-us">
            <a href="javascript:;">关于我们</a>
            <a href="javascript:;">法律声明</a>
            <a href="javascript:;">服务条款</a>
            <a href="javascript:;">联系方式</a>
        </div>
        <div class="address">地址：北京&nbsp;邮编：210019&nbsp;&nbsp;Copyright&nbsp;©&nbsp;2015&nbsp;-&nbsp;2016&nbsp;uimaker金科&nbsp;版权所有</div>
        <div class="other-info">建议使用IE8及以上版本浏览器&nbsp;京ICP备&nbsp;09003078号&nbsp;E-mail：admin@uimaker.com</div>
    </div>
</div>
    <script type="text/javascript">

       function xians(){

            var a=$("#zxlusrpss").val();
//alert(a);
            $("#login-wrap").html('<input type="text" name="usrpss" value="'+a+'" >')
        }
        //恢复文本框
/*

      $(function(){
            gin();

        })

        function gin(){
            document.getElementById("zxlaa").reset();
        }
*/

        //登录
        function login(){

                var password=$("[name='usrpss']").val();
                var username=$("[name='usrname']").val();
               // alert(username+password);
                $.ajax({
                    url:"<%=request.getContextPath()%>/zxluser/toShow.do",
                    type:"post",
                    data:{
                        "username":username,
                        "password":password
                    },
                    async:false,
                    dataType:"text",
                    scriptCharset: 'utf-8',
                    success:function(fang){
                        //idsStr = fang.substring(0,fang.length-0);
                      //  (fang)
                        if(fang=="成功"){
                      //  alert(fang);
                            // /!*  $('#modal-container-467928').modal('hide'); *!/
                            alert(12);
                           location.href="<%=request.getContextPath()%>/zzyController/toIndex.do";

                        }else if(fang=="用户或密码错误"){
                            alert("用户或密码错误")
                        }
                    },
                    error:function(){

                    }
                })


        }


    </script>

</body>
</html>