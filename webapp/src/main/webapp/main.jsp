<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    <link rel="stylesheet" href="js/boot/bootstrap-dialog/dist/css/bootstrap-dialog.css" >
    <script type="text/javascript" src="js/boot/bootstrap-dialog/dist/js/bootstrap-
dialog.js"></script>
    <!-- bootstrap-dialog -->
    <%--  <script>
          $(document).ready(function() {
              var marginTop = 0;
              var bool = false;
              setInterval(function() {
                  if (bool)
                      return;//判断运行和停止
                  $(".news1 li:first").animate({
                      marginTop : marginTop--
                  }, 10, function() {
                      if (!($(this).is(":animated"))) { //判断是否有一个动画节点
                          if ((-marginTop) >= $(this).height()) { //判断移出位置是否超过高度
                              $(this).css("margin", "0");
                              $(this).appendTo($(".news1")); //把第一个节点移到ul后面
                              marginTop = 0; //重新设置移动数值
                          }
                      }
                  });
              }, 100);
              $(".news1").mouseover(function() { //li鼠标移入，停止移动
                  bool = true;
              });
              $(".news1").mouseout(function() {
                  bool = false;
              });

          });
          $(document).ready(function() {
              var marginTop = 0;
              var bool = false;
              setInterval(function() {
                  if (bool)
                      return;//判断运行和停止
                  $(".news2 li:first").animate({
                      marginTop : marginTop--
                  }, 10, function() {
                      if (!($(this).is(":animated"))) { //判断是否有一个动画节点
                          if ((-marginTop) >= $(this).height()) { //判断移出位置是否超过高度
                              $(this).css("margin", "0");
                              $(this).appendTo($(".news2")); //把第一个节点移到ul后面
                              marginTop = 0; //重新设置移动数值
                          }
                      }
                  });
              }, 100);
              $(".news2").mouseover(function() { //li鼠标移入，停止移动
                  bool = true;
              });
              $(".news2").mouseout(function() {
                  bool = false;
              });

          });
      </script>--%>
</head>

<body>

<div class="mgj_rightbar">
    <div class="mgj-my-cart">
        <a class="nofollow" href="javascript:;">
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
            <li class="sk">全部商品</li>
            <li><a href="https://www.baidu.com/">百度一下</a></li>
            <li><a href="http://www.jinkeit.com/">金科教育</a></li>
            <li><a href="http://www.jd.com/">京东商城</a></li>
            <li><a href="#">合作商家</a></li>
        </ul>
    </div>
</div>
<div class="banner" class="col-lg-2"  style="margin-left: 10px">
    <%-- <div id="categories2" class="dropdown-menu">
         <ul class="ul">asdasdasdasdas</ul>
     </div>--%>
    <!--    banner左侧结构=======================================-->


    <div id="menu" class="dropdown open">
        <%-- <a class="navbar-brand dropdown-toggle" href="#">全部商品分类 <b
                 class="caret"></b></a>--%>

        <div id="categories" class="dropdown-menu" style="height:550px;background-color: lightblue">

        </div>


    </div >


    <!-- 右侧展示banner -->
    <div class="right" class="col-lg-5">
        <!-- <img src="image/banner.gif" /> -->

        <ul class="slide-show">
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

        <ol class="p-box">
            <li class="current"><img src="image/point40x40.png" width="20px" alt="" /></li>
            <li><img src="image/point40x40.png" width="20px" alt="" /></li>
            <li><img src="image/point40x40.png" width="20px" alt="" /></li>
            <li><img src="image/point40x40.png" width="20px" alt="" /></li>
            <li><img src="image/point40x40.png" width="20px" alt="" /></li>
            <li><img src="image/point40x40.png" width="20px" alt="" /></li>
        </ol>


        <div>aaaaaaaa</div>

    </div>

    <%--<div style="color: black;height: 600px;width: 100px; "></div>--%>

    <%--<div class="main1" >--%>
    <%--<center><font color="#66b3ff" size="3">新闻栏</font></center>--%>
    <%--<ul id="xinwen" class="news1">--%>
    <%--</ul>--%>
    <%--</div>--%>




</div>
<br><br><br>
<div class="panel panel-info">
    <div class="panel-heading">
        &nbsp;&nbsp;&nbsp;<font style="size:100px">全部商品</font>
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
<script>

    //页面加载菜单
    $(function(){

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
        //查询特价
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
        })
        /*$.ajax({
         url:"<%=request.getContextPath()%>/zzyController/selectquanbu.do",
         //data:"",
         type:"post",
         dataType:"json",
         async:false,
         success:function(pager){
         console.log(pager);

         selectshangpinquanbu(pager)
         },
         error:function(){
         alert("查询出错！！！")
         }
         })*/

        /*$.ajax({
         url:"<%=request.getContextPath()%>/zzyController/queryXin.do",
         type:"post",
         dataType:'json',
         async:false,
         success:function(aa){

         console.log(aa)
         for (var i = 0; i < aa.length; i++) {
         str1 += "<li><a onclick='ckxinwenxiangqing("+aa[i].newsId+")'><font
         size='1'>"+aa[i].newsName+"</font></a></li>";
         }
         $("#xinwen").html(str1);
         },
         error:function(){
         }


         })*/
        /*  $.ajax({

         url:"<%=request.getContextPath()%>/zzyController/querybianqian.do",
         type:"post",
         dataType:'json',
         // async:false,
         success:function(aa){
         alert(aa)
         console.log(aa)

         for (var i = 0; i < aa.length; i++) {
         uio += "<a href='"+aa[i].labeladdress+"'class='navbar-brand dropdown-toggle' ><font size='1' color='white'>"+aa[i].labelname+"</font></a>";
         }
         $("#mmp").html(uio);
         },
         error:function(){
         }
         })*/

    })

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
                    str+="<li style='background-color: lightblue'><a onclick='ckspdl("+dalei
                            [int].id+")'><i class='icon-main icon-2' ></i><font color='red' size='3'>"+dalei[int].dname
                        +"</font></a><ul class='sub-item'  style='background-color: pink;width: 300px;height: 100px' >";
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
        //alert(tr)

    }

</script>
<script>

    function chakanxx(id,sname){//弹框

        BootstrapDialog.show({
            title:sname,


            cssClass: 'login-dialog',

            message: $('<div style="height:800px;overflow:scroll;" ></div>').load('<%=request.getContextPath()%>/zzyController/selectxiang.do?id='+id),
            buttons: [{
                label: '关闭',
                action: function(dialog) {
                    //更改弹框标题
                    BootstrapDialog.closeAll();
                }
            }]
        });


    }

    /* function ckxinwenxiangqing(id){
     BootstrapDialog.show({
     title:"新闻详情",
     cssClass: 'login-dialog',
     message: $('<div></div>').load('<%=request.getContextPath()%>/zzyController/xiangqing.do?id='+id),
     buttons: [{
     label: '关闭',
     action: function(dialog) {
     //更改弹框标题
     BootstrapDialog.closeAll();
     }
     }]
     });
     }*/
    //查询分类
    function ckspxl(id){

        $.ajax({
            url:"<%=request.getContextPath()%>/zzyController/selectFenid.do?id="+id,
            type:"post",
            datatype:"json",
            async:false,
            success:function(pager){

                selectshangpinquanbu(pager)
            },
            error:function(){
                alert("查询出错！！！");
            }
        })

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
    }

</script>
</body>
</html>