<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/23
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/zzy/base.jsp"></jsp:include>
<link href="image/favicon.ico" type="image/x-icon" rel="shortcut icon" />
<link type="text/css" rel="stylesheet" href="styles/index.css" />
<script type="text/javascript" src="/js1.7/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/index.js"></script>
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/assets/lib/bootstrap/css/bootstrap.css"
      rel="stylesheet" />
<script src="/assets/lib/jquery/jquery-1.11.0.js"></script>
<script src="/assets/lib/bootstrap/js/bootstrap.js"></script>
<body>
<div class="mgj_rightbar">
    <div class="mgj-my-cart">
        <a class="nofollow" href="javascript:gwc(${user.userid});">
            <i class="s-icon"></i>
            <div class="s-txt">购物车</div>
        </a>
    </div>
    <div class="mgj-my-coupon">
        <a class="nofollow" href="javascript:;">
            <i class="s-icon"></i>
            <div class="s-txt">优惠券</div>
        </a>
    </div>
    <div class="mgj-my-wallet">
        <a class="nofollow" href="javascript:;">
            <i class="s-icon"></i>
            <div class="s-txt">钱包</div>
        </a>
    </div>
    <div class="mgj-my-browserlog">
        <a class="nofollow" href="javascript:;">
            <i class="s-icon"></i>
            <div class="s-txt">足迹</div>
        </a>
    </div>
    <div class="sideBottom">
        <a class="nofollow" href="javascript:;">
            <i class="s-icon"></i>
        </a>
    </div>


</div>
<div class="head">
    <div class="head-top">
        <ul>
            <li class="wodexiaodian"><a class="wd" href="../mgjz/index.html">我的小店</a></li>
            <li class="khfw">
                <a class="fw" href="#">
                    客户服务
                    <ul class="khfwtk">
                        <li>联系合作</li>
                        <li>帮助</li>
                    </ul>

                </a>
            </li>
            <%--   <li class="gouwuche">
                   <!--          		<div class="gwctk"></div>-->
                   <a class="gwc" href="#">
                       购物车
                       <ul class="gwctk">
                           <li>购物车里没有商品！</li>
                       </ul>
                   </a>
               </li>--%>
            <%--<li class="dingdan"><a class="dd" href="#">我的订单</a></li>--%>
            <li ><a class="dl" href="#">登录</a></li>
            <li ><a class="zc" href="#">注册</a></li>

        </ul>


    </div>
    <div class="head-main">
        <img class="logo" src="/image/head-top-logo.png" />
        <span class="s1">搜商品<div class="ss1">店铺</div></span>
        <input class="s2" type="text"  value="既保暖性又时尚感棉服"/>
        <input class="s3" type="button" />
        <div class="sao">
            <img src="/image/head-main-erweima.png" />
            <span class="mgj">蘑菇街客户端</span>
        </div>
        <ul>
            <li><a href="#">毛衣</a></li>
            <li><a href="#">雪地靴</a></li>
            <li><a href="#">羽绒服</a></li>
            <li><a href="#">毛呢外套</a></li>
            <li><a href="#">连衣裙</a></li>
            <li><a href="#">家居服</a></li>
            <li><a href="#">打底裤</a></li>
            <li><a href="#">包包</a></li>
            <li><a href="#">打底衫</a></li>
        </ul>
    </div>
    <div class="head-foot">

        <ul class="daohang">
            <%--<li class="sk" style="background-color: red">全部商品</li>--%>

            <li><a href="https://www.baidu.com/">百度一下</a></li>
            <li><a href="http://www.jinkeit.com/">金科教育</a></li>
            <li><a href="http://www.jd.com/">京东商城</a></li>
            <li><a href="#">合作商家</a></li>
        </ul>
    </div>
</div>
<div>
<div id="zzy" style="margin-left: 100px" ></div>
</div>
<script>
$(function(){
    $.ajax({
        url:"<%=request.getContextPath()%>/zzyController/selectFenid.do?id="+${id},
        //data:"",
        type:"post",
        dataType:"json",
        async:false,
        success:function(pager){
             alert(pager)
            //selectshangpintejia(pager)
            shangpinxiaolei(pager);
        },
        error:function(){
            alert("查询出错！！！")
        }
    })
})
    function shangpinxiaolei(pager) {
        var tr = "";
        for (var i = 0; i < pager.length; i++) {

            tr+="<div style='float:left' >" +
                "<img src='"+pager[i].image+"'  width='200px' height='200px' title='点击查看详细信息' " +
                "onclick='chakanxx("+pager[i].id+",\""+pager[i].sname+"\")' >" +
                "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<br><span>" +
                "<font size='1'>"+pager[i].sname+"</font></span><br><span>" +
                "<font size='1'>价格："+pager[i].price+"￥ </font>" +
                "</span></div>"

        }
        $("#zzy").html(tr);
    }
function chakanxx(id) {
    alert(122)
    location.href = "<%=request.getContextPath()%>/zzyController/selectxiang.do?id=" + id;
}
</script>
</body>
</html>
