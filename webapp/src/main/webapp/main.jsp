<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>金科&nbsp;-&nbsp;购物商城！</title>
    <jsp:include page="WEB-INF/zzy/base.jsp"></jsp:include>
    <link href="image/favicon.ico" type="image/x-icon" rel="shortcut icon" />
    <link type="text/css" rel="stylesheet" href="styles/index.css" />
    <script type="text/javascript" src="js1.7/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" />
    <link href="<%=request.getContextPath() %>/assets/lib/bootstrap/css/bootstrap.css"
          rel="stylesheet" />
    <script src="assets/lib/jquery/jquery-1.11.0.js"></script>
    <script src="assets/lib/bootstrap/js/bootstrap.js"></script>
    <%--<link rel="stylesheet" href="js/boot/bootstrap-dialog/dist/css/bootstrap-dialog.css" >
    <script type="text/javascript" src="js/boot/bootstrap-dialog/dist/js/bootstrap-
dialog.js"></script>--%>
    <style type="text/css">
        *{margin:0px; padding:0px;}
        .small-box {
            width:300px;
            height:300px;
            margin-left:100px;
            margin-top:100px;
            border:1px #ccc solid;
            cursor:move;
            float:left;
            position:relative;
        }
        .small-box img {
            width:300px;
            height:300px;
        }
        .tool {
            width:150px;
            height:150px;
            background-color:gold;
            opacity:0.6;
            filter:alpha(opacity=60);
            position:absolute;
            left:0px;
            top:0px;
            display:none;
        }
        .tool.active {
            display:block;
        }
        .big-box {
            width:300px;
            height:300px;
            border:1px #ccc solid;
            overflow:hidden;
            float:left;
            margin-top:100px;
            position:relative;
            display:none;
        }
        .big-box.active {
            display:block;
        }
        .big-box img {
            width:600px;
            height:600px;
            position:absolute;
        }
    </style>
</head>

<body>
${user.loginname}
<input type="hidden" id="yid" value="${user.userid }">

<div class="mgj_rightbar">
    <div class="mgj-my-cart">
        <a class="nofollow" href="javascript:gwc(${user.userid});">
            <i class="s-icon"></i>
            <div class="s-txt">购物车</div>
        </a>
    </div>
    <div class="mgj-my-coupon">
        <a class="nofollow" href="javascript:selectmydan(${user.userid});">
            <i class="s-icon"></i>
            <div class="s-txt">我的订单</div>
        </a>
    </div>
    <div class="mgj-my-wallet">
        <a class="nofollow" href="javascript:;">
            <i class="s-icon"></i>
            <div class="s-txt">我的收藏</div>
        </a>
    </div>
    <div class="mgj-my-browserlog">
        <a class="nofollow" href="javascript:;">
            <i class="s-icon"></i>
            <div class="s-txt">抽奖</div>
        </a>
    </div>
    <div class="mgj-my-coupon">
        <a class="nofollow" href="javascript:djqd();">
            <i class="s-icon"></i>
            <div class="s-txt">签到</div>
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
            <li ><a class="dl" href="<%=request.getContextPath()%>/zengzhu.jsp">登录</a></li>
            <li ><a class="zc" href="<%=request.getContextPath()%>/zengzhu.jsp">注册</a></li>

        </ul>


    </div>
    <div class="head-main">
        <img class="logo" src="image/head-top-logo.png" />
        <span class="s1">搜商品<div class="ss1">店铺</div></span>
        <input class="s2" type="text"  value="既保暖性又时尚感棉服"/>
        <input class="s3" type="button" />
        <div class="sao">
            <img src="image/head-main-erweima.png" />
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
            <li class="sk" style="background-color: red">全部商品</li>
            <li><a href="https://www.baidu.com/">百度一下</a></li>
            <li><a href="http://www.jinkeit.com/">金科教育</a></li>
            <li><a href="http://www.jd.com/">京东商城</a></li>
            <li><a href="#">合作商家</a></li>
        </ul>
    </div>
</div>
<div class="banner" class="col-lg-2"  style="margin-left: 10px" >
    <%-- <div id="categories2" class="dropdown-menu">
         <ul class="ul">asdasdasdasdas</ul>
     </div>--%>
    <!--    banner左侧结构=======================================-->


    <div id="menu" class="dropdown open">
        <%-- <a class="navbar-brand dropdown-toggle" href="#">全部商品分类 <b
                 class="caret"></b></a>--%>

        <div id="categories" class="dropdown-menu" style="height: 500px" >

        </div>


    </div >


    <!-- 右侧展示banner -->
  <div class="right" class="col-lg-15">
        <!-- <img src="image/banner.gif" /> -->

        <ul class="slide-show" >
            <li><a href="#"><img src="image/banner4.jpg" alt="" /></a></li>

            <li><a href="#"><img src="image/banner1.jpg" alt=""/></a></li>
            <li><a href="#"><img src="image/banner3.jpg" alt="" /></a></li>
            <li><a href="#"><img src="image/banner4.jpg" alt="" /></a></li>
            <li><a href="#"><img src="image/banner5.jpg" alt="" /></a></li>
            <li><a href="#"><img src="image/banner6.jpg" alt="" /></a></li>
            <li><a href="#"><img src="image/banner1.jpg" alt="" /></a></li>
        </ul>
        <img class="banner-left" src="image/banner-left.png" />
        <img class="banner-right" src="image/banner-right.png" />

        <ol class="p-box" >
            <li class="current"><img src="image/point40x40.png" width="20px" alt="" /></li>
            <li><img src="image/point40x40.png" width="20px" alt="" /></li>
            <li><img src="image/point40x40.png" width="20px" alt="" /></li>
            <li><img src="image/point40x40.png" width="20px" alt="" /></li>
            <li><img src="image/point40x40.png" width="20px" alt="" /></li>
            <li><img src="image/point40x40.png" width="20px" alt="" /></li>
        </ol>



    </div>
    <div class="right1">


        <img src="image/banner1.jpg" style="width: 254px;height: 530px;" />

    </div>

    <%--<div style="color: black;height: 600px;width: 100px; "></div>--%>

    <%--<div class="main1" >--%>
    <%--<center><font color="#66b3ff" size="3">新闻栏</font></center>--%>
    <%--<ul id="xinwen" class="news1">--%>
    <%--</ul>--%>
    <%--</div>--%>




</div>



<div class="panel panel-info">
    <div class="panel-heading">
        &nbsp;&nbsp;&nbsp;<font style="size:100px">推荐商品</font>
    </div>
    <div class="panel-body">
        <div  id="shangpinzhanshi" class="ppg" style="margin-left: 50px"></div>
    </div>
</div>
<!--main1-->
<%--<div class="main1"  >
        <div class="col-lg-12 floor-product  " id="shangp2 zhanshi" >
        </div>




</div>
<!--main2-->
<div class="main2 banxin">
    <div class="title banxin">

        <div class="title1">
            <div class="title2">
                <div class="title3">
                </div>
            </div>
        </div>

        <div class="ppg-wz">
        </div>

        <div class="title1">
            <div class="title2">
                <div class="title3">
                </div>
            </div>
        </div>

    </div>


</div>
<!--main3/////////////////////////////-->
<div class="main3 banxin">
    <div class="title banxin">

        <div class="title1">
            <div class="title2">
                <div class="title3">
                </div>
            </div>
        </div>

        <div class="xs-wz">
        </div>--%>

<%--  <div class="title1">
      <div class="title2">
          <div class="title3">
          </div>
      </div>
  </div>

</div>

</div>--%>
<!--main4/////////////////////////////-->
<div class="panel panel-info">
    <div class="panel-heading">
        &nbsp;&nbsp;&nbsp;<font style="size:100px">商品活动</font>
    </div>
    <div class="panel-body"  style="margin-left: 50px">


        <div class="row mb10 lazy">
            <div class="col-lg-12">
                <ul class="nav-orange nav-justified" id="myTab">
                    <li class="active"><a  data-toggle="tab" onclick="cktj()">特价产品</a></li>

                    <li><a data-toggle="tab" onclick="ckrp()">热评商品</a></li>
                    <li><a data-toggle="tab" onclick="ckms()">秒杀专场</a></li>
                </ul>
                <div class="tab-content floor-product" id="terezhanshi">
                </div>
                <div><br><br></div>
            </div>
        </div>
    </div>
</div>

<div class="foot">
    <div class="foot-top banxin">
        <div class="foot-top-l">
            <div class="foot-logo">
                <a href="#"><img src="image/foot-logo.png" /></a>
            </div>
            <p class="xukezheng">
                营业执照注册号：<a href="#">330106000129004</a>
            </p>
            <p class="xukezheng">
                增值电信业务经营许可证：<a href="#">浙B2-20110349</a>
            </p>
            <p class="xukezheng">
                ICP备案号：浙ICP备10044327号-3
            </p>
            <p class="xukezheng">
                ©2015 Mogujie.com 杭州卷瓜网络有限公司
            </p>

        </div>
        <div class="foot-top-r">
            <dl>
                <dt>公司</dt>
                <dd><a href="#">关于我们</a></dd>
                <dd><a href="#">招聘信息</a></dd>
                <dd><a href="#">联系我们</a></dd>
            </dl>
            <dl>
                <dt>消费者</dt>
                <dd><a href="#">帮助中心</a></dd>
                <dd><a href="#">意见反馈</a></dd>
                <dd><a href="#">手机版下载</a></dd>
            </dl>
            <dl>
                <dt>商家</dt>
                <dd><a href="#">免费开店</a></dd>
                <dd><a href="#">商家社区</a></dd>
                <dd><a href="#">商家入驻</a></dd>
                <dd><a href="#">管理后台</a></dd>
            </dl>
            <dl>
                <dt>权威认证</dt>
                <dd><a href="#">免费开店</a></dd>
                <dd><a href="#">商家社区</a></dd>
                <dd><a href="#">商家入驻</a></dd>
                <dd><a href="#">管理后台</a></dd>
            </dl>

        </div>

    </div>
    <div class="foot-bottom banxin">
        <dl>
            <dt>友情链接:</dt>
            <dd><a href="#">淘粉吧</a></dd>
            <dd><a href="#">蘑菇街团购网</a></dd>
            <dd><a href="#">蘑菇街女装</a></dd>
            <dd><a href="#">蘑菇街男装</a></dd>
            <dd><a href="#">蘑菇街鞋子</a></dd>
            <dd><a href="#">蘑菇街包包</a></dd>
            <dd><a href="#">蘑菇街家居</a></dd>
            <dd><a href="#">家具网</a></dd>
            <dd><a href="#">时尚品牌网</a></dd>
            <dd><a href="#">装修</a></dd>
            <dd><a href="#">蘑菇街母婴</a></dd>
            <dd><a href="#">衣联网</a></dd>
            <dd><a href="#">播视网视频</a></dd>

        </dl>

    </div>

</div>
<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog modal-lg" style="width:600px;height:600px" >

        <div class="modal-body">
            <img src="image/tui.png">
        </div>

        <%--<div class="modal-footer" >--%>
        <%--<button type="button" class="btn btn-default"--%>
        <%--data-dismiss="modal">关闭--%>
        <%--</button>--%>
        <%--</div>--%>

    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>

    //页面加载菜单
    $(function(){
        $("#myModal").modal({
            keyboard: true
        });
        var uio = "";
        var str="";
        var str1="";
        var str2="";
        $.ajax({
            url:"<%=request.getContextPath()%>/zzyController/selectda.do",
            type:"post",
            dataType:"json",
            success:function(dalei){
                selectshangpinquanbu(dalei.tulist)
                liebiao(dalei.dalist);





            },erro:function(){

                $.messager.alert("报错","查询失败");
            }


        })



    })

    function cktj(){


    $.ajax({
        url:"<%=request.getContextPath()%>/zzyController/querytejia.do",
        //data:"",
        type:"post",
        datatype:"json",
        async:false,
        success:function(pager){


            selectshangpintejia(pager)
        },
        error:function(){
            alert("查询出错！！！")
        }
    });
    }
    function ckms() {
        //查询商品秒杀
        $.ajax({
            url:"<%=request.getContextPath()%>/zzyController/queryMiao.do",
            //data:"",
            type:"post",
            datatype:"json",
            async:false,
            success:function(pager){

                selectshangpinmiaosha(pager)
            },
            error:function(){
                alert("查询出错！！！")
            }
        })
    }
    function selectshangpinmiaosha(pager) {



        var tr = "";
        for (var i = 0; i < pager.length; i++) {
//            alert(pager[i].id);

            tr += "<font size='1' color='red'><span id='msgshowmiaos'></span>" +
                "</font><br><div style='float:left' ><img src='" + pager[i].goodimage + "'  " +
                "width='200px' height='200px' >" +
                "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<br><span>" +
                "<font size='1'>秒杀价格：" + pager[i].mprice + "￥ </font></span><br>" +
                "<font size='1' color='green'>仅剩<font size='3' color='#ff0000'>" +
                "<span id='kucunxianshi'> " +pager[i].count+ "</span></font>件商品了噢！</font>" +
                "<input type='button' readonly class='btn btn-danger' value='点击秒杀' id='miaoshabut' style='display:none' " +
                "onclick='miaoshasp(" + pager[i].id + "," + pager[i].count + ")' ></div>"


        }
        $("#terezhanshi").html(tr);




    $.ajax({
        url:'<%=request.getContextPath()%>/zzyController/selectMiao.do',
        type:"post",
        dataType:"json",
        success:function(result){


            if(result.flag==1){
                second=result.miaoshu;
                var toDays = function(){
                    var s = second % 60; // 秒
                    var mi = (second - s) / 60 % 60; // 分钟
                    var h =  ((second - s) / 60 - mi ) / 60 % 24; // 小时
                    var d =  (((second - s) / 60 - mi ) / 60 - h ) / 24 // 天
                    return "距活动开始还有：" + d + "天" + h + "小时" + mi + "分钟" + s + "秒";
                }
                var timejishi1 =window.setInterval(function(){
                    if(second==0){
                        $("#miaoshabut").show();
                        ckms();
                        clearInterval(timejishi1);
                        return;
                    }else
                        second --;
                    document.getElementById("msgshowmiaos").innerHTML = toDays ();
                }, 1000);

            }

            if(result.flag==2){
                second=result.miaoshu2;
                var timejishi =null;
                var toDays = function(){
                    var s = second % 60; // 秒
                    var mi = (second - s) / 60 % 60; // 分钟
                    var h =  ((second - s) / 60 - mi ) / 60 % 24; // 小时
                    var d =  (((second - s) / 60 - mi ) / 60 - h ) / 24 // 天
                    return "距活动结束还有：" + d + "天" + h + "小时" + mi + "分钟" + s + "秒";
                }
                var timejishi =window.setInterval(function(){
                    if(second==0){
                        $("#miaoshabut").hide();
                        $("#msgshowmiaos").html("秒杀结束")
                        ckms();
                        clearInterval(timejishi);
                        return;
                    }else
                        second --;
                    document.getElementById("msgshowmiaos").innerHTML = toDays ();
                }, 1000);
                $("#miaoshabut").show();
                $("#kucunxianshi").html(result.count)
            }

            if(result.flag==3){
                $("#miaoshabut").hide();
                $("#msgshowmiaos").html("秒杀结束")
                $("#kucunxianshi").html(result.count)

                return;
            }
        },error:function(){
            alert('警告','报错');
        }
    })
    }

    function liebiao(dalei){
        var uio = "";
        var str="";
        var str1="";
        var str2="";
        $.ajax({
            url:"<%=request.getContextPath()%>/zzyController/selectxiao.do",
            type:"post",
            dataType:"json",
            success:function(xiaolei){

                for (var int = 0; int < dalei.length; int++) {
                    str+="<li class='sk' style='background-color:dodgerblue;'><a onclick='ckspdl("+dalei
                            [int].id+")'><i class='icon-main icon-2' ></i><font color='black' size='3'>"+dalei[int].dname
                        +"</font></a><ul class='sub-item'  style='background-color: ;width: 200px;height: 50px' >";
                    for (var int2 = 0; int2 < xiaolei.length; int2++) {
                        if(xiaolei[int2].daid==dalei[int].id){
                            str+="<li><a onclick='ckspxl("+xiaolei[int2].id+")' class='icon-main icon-9'>"+xiaolei[int2].name+"</a></li>";
                        }
                    }
                    str+=" </ul></li>"

                }

                $("#categories").html(str);

            },erro:function(){

                $.messager.alert("报错","查询失败");
            }


        })

    }

    function selectshangpinquanbu(pager){

        var tr="";


        for (var i = 0; i < pager.length; i++) {

            tr+="<div style='float:left' >" +
                "<img src='"+pager[i].image+"'  width='200px' height='200px' title='点击查看详细信息' " +
                "onclick='chakanxx("+pager[i].id+",\""+pager[i].sname+"\")' >" +
                "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<br><span>" +
                "<font size='1'>"+pager[i].sname+"</font></span><br><span>" +
                "<font size='1'>价格："+pager[i].price+"￥ </font>" +
                "</span></div>"

        }
        $("#shangpinzhanshi").html(tr);

        //alert(tr)
    }

    function selectshangpintejia(pager){
        //alert(pager)

        var tr="";

        //alert(pager)
        var zhehou ="";
        for (var i = 0; i < pager.length; i++) {
            zhehou = pager[i].price*pager[i].zhekou;
            tr+="<div style='float:left' ><img src='"+pager[i].image+"' " +
                " width='200px' height='200px' title='点击查看详细信息' " +
                "onclick='chakanxx("+pager[i].id+",\""+pager[i].sname+"\")' >" +
                "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<br><span><font size='1'>"+pager[i].sname+"" +
                "</font></span><br><span><font size='1'>折后价格："+zhehou.toFixed(2)+"￥ </font></span><br><span>" +
                "<font size='1' rev-text-1>原价格："+pager[i].price+"￥ </font></span></div>"

        }
        $("#terezhanshi").html(tr);

    }

</script>
<script>

    function chakanxx(id){
        alert(122)
        location.href="<%=request.getContextPath()%>/zzyController/selectxiang.do?id="+id;

        /*BootstrapDialog.show({
            title:sname,


            cssClass: 'login-dialog',

            message: $('<div></div>').load('<%=request.getContextPath()%>/zzyController/selectxiang.do?id='+id),
            size: BootstrapDialog.SIZE_WIDE,

            buttons: [{
                label: '关闭',
                action: function(dialog) {
                    //更改弹框标题
                    BootstrapDialog.closeAll();
                  //  dialog.setSize(BootstrapDialog.SIZE_NORMAL);

                }
            }]
        });
*/

    }

    //查询分类
    function ckspxl(id){

        location.href="<%=request.getContextPath()%>/zzyController/selectFenid11.do?id="+id;

    }
    function ckrp() {
        $.ajax({
            url:"<%=request.getContextPath()%>/zzyController/selectreping.do",
            //data:"",
            type:"post",
            datatype:"json",
            async:false,
            success:function(pager){

                selectshangpintejia(pager)
            },
            error:function(){
                alert("查询出错！！！")
            }
        })




    //alert(tr)
    }

</script>

<script>
    function miaoshasp(id) {

        if(confirm("确定秒杀吗??")){
            $.ajax({
                url:'<%=request.getContextPath()%>/zzyController/miaoshaGoods.do?id='+id,
             //  data:{"id":pager[i].id},
                type:"post",
                dataType:"json",
                success:function(result){

                    if(result==1){
                        alert('恭喜,秒杀成功');

                        location.href="<%=request.getContextPath()%>/main.jsp";
                    }else if(result==2){
                        if(confirm("你还未登录，是否跳转到登录页面？")){
                            location.href="<%=request.getContextPath()%>/zengzhu.jsp";
                        }
                    }
                }
            })
        }

    }

    function gwc(id) {

        location.href="<%=request.getContextPath()%>/zzyController/selectGwc.do?id="+id;
    }
    function selectmydan(id) {
        alert(id)
        location.href="<%=request.getContextPath()%>/zzyController/selectmydan.do?id="+id;

    }
    function djqd() {
        var userid = $("#yid").val()
        if(userid == null){
            var msg = "亲,登录后才可以签到哦!!\n\n请确认！";
            if (confirm(msg)==true){
                location.href="<%=request.getContextPath()%>/zengzhu.jsp";
                return true;
            }
        }else{
            location.href="<%=request.getContextPath()%>/zzyController/qiandao.do?id="+userid;
        }
    }
</script>
</body>
</html>