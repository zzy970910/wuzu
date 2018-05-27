<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/17
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %><%@ page isELIgnored="false" %>
<head>
    <title>Title</title>
    <link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" />
    <%--<link href="<%=request.getContextPath() %>/assets/lib/bootstrap/css/bootstrap.css"
          rel="stylesheet" />--%>
    <jsp:include page="/WEB-INF/zzy/base.jsp"></jsp:include>

    <script src="assets/lib/jquery/jquery-1.11.0.js"></script>
    <script src="assets/lib/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/zzsc.css">
    <script type="text/javascript" class="library" src="<%=request.getContextPath() %>/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" class="library" src="<%=request.getContextPath() %>/js/jquery.colorbox-min.js"></script>
    <script type="text/javascript" class="library" src="<%=request.getContextPath() %>/js/zzsc.js"></script>
</head>

<body>


<input type="hidden" id="userid" value="${user.userid}">
<input type="hidden" id="goodid" value="${goods.id }">
<!--/#header-->
<!-- 内容部分开始 -->
<!-- 详细页开始 -->
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
            <li class="sk" style="background-color: red">全部商品</li>
            <li><a href="https://www.baidu.com/">百度一下</a></li>
            <li><a href="http://www.jinkeit.com/">金科教育</a></li>
            <li><a href="http://www.jd.com/">京东商城</a></li>
            <li><a href="#">合作商家</a></li>
        </ul>
    </div>
</div>

<div class="row">

    <!-- 右边内容 -->
    <div id="content" class="col-lg-12">
        <div class="item-meta" >
            <div class="meta-situ"  >
                <div class="meta-magnifier pull-left" style="width: 50px">
                    <div class="con-FangDa" id="fangdajing" style="width: 200px;height:300px">
                        <div class="con-fangDaIMg" style="width: 200px;height:300px">
                            <img  src="${goods.image}" style="width: 400px"/>
                            <!-- 滑块-->
                           <div class="magnifyingBegin" style="width: 100px;height: 100px;"></div>
                            <!-- 放大镜显示的图片 -->
                            <div class="magnifyingShow" style="height:300px;width: 500px"><img src="${goods.image}"></div>
                        </div>
                    </div>
                </div>
                <div class="meta-show pull-right">
                    <h2 class="meta-maintit">${goods.sname}</h2>
                    <div class="meta-subtitle">满300返40,仅限一天哦</div>
                    <div class="meta-reveal mb10">
                        <ul>
                            <li >商品编号： ${goods.id}</li>

                            <li class="reveal-tit">市场价：</li>
                            <li class="reveal-sow rev-text-1">￥${goods.price+100}</li>
                            <li class="reveal-tit">折后价：</li>
                            <li class="reveal-sow rev-text-2">￥<%-- ${list[0].price}  --%>


                                <c:if test="${goods.zhekou == 1 }">
                                    ${goods.price }
                                </c:if>
                                <c:if test="${goods.zhekou != 1 }">
                                    <fmt:formatNumber type="number" value="${goods.price*goods.zhekou }" maxFractionDigits="2"/>

                                </c:if>



                                <%-- ${list[0].zhekou == 1 ? list[0].price : "没有折扣" } --%>
                                <%-- ${stu.stusex == '1' ? "checked" : "" } --%>
                            </li>

                            <li >商品评分：<i class="icon-main icon-eva-5"></i>(已有n人评价)</li>
                            <li class="reveal-tit">库存：</li>
                            <li class="reveal-sow rev-text-2">${goods.kucun} </li>
                        </ul>

                    </div>
                    <div style="border-bottom: 1px dotted #ccc;"></div>
                    <div class="meta-btn">

                        <div class="button-group">
                            <div style="float:left"><button type="button" class="btn btn-danger btn-lg mr20"  onclick="ljgm(${goods.id})">立即购买</button></div>
                            <div style="float:left"><button type="button" class="btn btn-addcart btn-lg mr20" onclick="jrgwc(${goods.id})"><i class="icon-main icon-addcart"></i>加入购物车</button></div>
                            <div style="float:left" id="shoucangsgj"><button type="button" class="btn btn-collect btn-lg" onclick="sccg()"><i class="icon-main icon-like"></i>收藏</button></div>
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>

            </div>

        </div>
        <div class="item-detail">
            <ul class="nav nav-tabs detail-tabs" id="detail-tabs">
                <li class="active"><a href="#intro" data-toggle="tab">商品介绍</a></li>
            </ul>
        </div>
        <div class="tab-pane active" id="intro">
            <p>不错呦 ！很看好你呦！！</p>
        </div>
        <div class="item-review" id="review">
            <div class="item-title"><span>商品评价</span></div>
            <div class="review-per">
                <div class="rate">
                    <div>
                        97<span>%</span>
                    </div>
                    <br>
                    <span>好评度</span>
                </div>
                <div class="percent">
                    <dl>
                        <dt>好评<span>(97%)</span></dt>
                        <dd>
                            <div style="width: 78%;">
                            </div>
                        </dd>
                    </dl>
                    <dl>
                        <dt>中评<span>(2%)</span></dt>
                        <dd class="d1">
                            <div style="width: 20%;">
                            </div>
                        </dd>
                    </dl>
                    <dl>
                        <dt>差评<span>(1%)</span></dt>
                        <dd class="d1">
                            <div style="width: 1%;">
                            </div>
                        </dd>
                    </dl>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="review-show mt15  p15">
                <ul class="nav nav-tabs review-tabs" id="review-tabs">
                    <!-- <li class="active"><a href="#all-eva" data-toggle="tab">全部评价</a></li> -->

                </ul>
                <!--   <table border="0" width="100%" class="tb">
                 <thead id="tabletitle">
                     <tr>
                         <td><font color="#46A3FF">用户</font></td>
                         <td><font color="#46A3FF">评论信息</font></td>
                         <td><font color="#46A3FF">回复信息</font></td>
                     </tr>
                 </thead>
                 <tbody id="showJobInfo">
                 </tbody>
                 </table>
                           -->
                <div >
                    <div id="newsselect"> </div>
                </div>
            </div>
        </div>
        <div class="item-after" id="after">
            <div class="item-title"><span>售后保障</span></div>
            <div class="p15">
                <p class="lh200">
                    <b>服务承诺： </b>
                    <br />
                    金科商城向您保证所售商品均为正品行货，金科自营商品自带机打发票，与商品一起寄送。凭质保证书及传智商城发票，可享受全国联保服务（奢侈品、钟表除外；奢侈品、钟表由传智联系保修，享受法定三包售后服务），与您亲临商场选购的商品享受相同的质量保证。金科商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！<br />
                    <br />

                    注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！
                </p>
            </div>
        </div>

    </div>
</div>
<!-- 详细页结束 -->


<script src="assets/lib/jquery/jquery-1.11.0.js"></script>
<script src="assets/lib/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
    $('#vcode_img').click(function  () {
        $(this).attr('src',  $(this).data('src')+'?'+ Math.random());
    });
</script>
<script type="text/javascript">
//立即购买
    function ljgm(gid){
        //id 是用户id  gid 是商品id


        var uid =$("#userid").val();

        $.ajax({
            url:"<%=request.getContextPath()%>/zzyController/addljgm.do?gid="+gid+"&uid="+uid,
            type:"post",
            datatype:"json",
            async:false,
            success:function (pager){
                   alert("购买成功，订单已生成")

                location.href="<%=request.getContextPath() %>/main.jsp";
            },
            error:function(){
                alert("购买失败！！！")
            }
        })
    }
    //加入购物车
    function jrgwc(gid){
        //id 是用户id  gid 是商品id


        var uid =$("#userid").val();
        alert(gid)
        alert(uid)
        $.ajax({
            url:"<%=request.getContextPath()%>/zzyController/addGou.do?gid="+gid+"&uid="+uid,

            type:"post",
            datatype:"json",
            async:false,
            success:function (pager){


                alert("已经成功加入购物车，请在右上角购物车中结算")

                BootstrapDialog.closeAll();

            },
            error:function(){
                alert("加入购物车失败！！！")
            }
        })
    }

    //加入收藏夹
    function sccg(){
        var id =$("#guzid").val();
        var gid = $("#spid").val();
        // alert(id)
        //alert(gid)
        if(id!=null&&id!=""){
            $.ajax({
                url:"<%=request.getContextPath()%>/buyGoodsAction!addshoucangjia.action",
                data:{"gid":gid,"id":id},
                type:"post",
                datatype:"json",
                async:false,
                success:function (pager){
                    alert("收藏成功！")
                    $.ajax({
                        url:"<%=request.getContextPath()%>/buyGoodsAction!queryshoucangjia.action?gid="+gid+"&id="+id,
                        //data:{"gid":gid,"id":id},
                        type:"post",
                        datatype:"json",
                        async:false,
                        success:function (pager){
                            //alert(pager)
                            if(pager== 1){
                                var kong = "";

                                kong+="<div style='float:left'><button type='button' class='btn btn-collect btn-lg' onclick='quxiaoshoucang()'><i class='icon-main icon-like'></i>取消收藏</button>";
                                //alert(kong)
                                $("#shoucangsgj").html(kong);
                            }
                        },
                        error:function(){
                            alert("出错了！！！")
                        }
                    })
                },
                error:function(){
                    alert("加入收藏失败！！！")
                }
            })
        }else{
            alert("请登录后在进行收藏！")
            location.href="<%=request.getContextPath()%>/loginAndzhuche/longin.jsp";
        }
        //alert("收藏成功，虽然你并没有收藏夹");
    }


    //收藏夹
   /* $(function(){
        var id =$("#guzid").val();
        var gid = $("#spid").val();

        $.ajax({
            url:"<%=request.getContextPath()%>/buyGoodsAction!queryshoucangjia.action?gid="+gid+"&id="+id,
            //data:{"gid":gid,"id":id},
            type:"post",
            datatype:"json",
            async:false,
            success:function (pager){
                //alert(pager)
                if(pager== 1){
                    var kong = "";

                    kong+="<div style='float:left'><button type='button' class='btn btn-collect btn-lg' onclick='quxiaoshoucang()'><i class='icon-main icon-like'></i>取消收藏</button>";
                    //alert(kong)
                    $("#shoucangsgj").html(kong);
                }
            },
            error:function(){
                alert("出错了！！！")
            }
        })

    })

    //收藏夹
    function quxiaoshoucang(){
        var id =$("#guzid").val();
        var gid = $("#spid").val();
        //alert(id)
        $.ajax({
            url:'<%=request.getContextPath()%>/buyGoodsAction!deleteshoucangjia.action',
            data:{"id":id,"gid":gid},
            type:"post",
            dataType:"json",
            success:function(reuslt){

                BootstrapDialog.confirm({
                    type : BootstrapDialog.TYPE_DANGER, // <-- Default value is
                    title : '确认',
                    message : "你确认取消收藏吗？",
                    size : BootstrapDialog.SIZE_SMALL,//size为小，默认的对话框比较宽
                    closable : true, // <-- Default value is false，点击对话框以外的页面内容可关闭
                    draggable : true, // <-- Default value is false，可拖拽
                    btnCancelLabel : '取消', // <-- Default value is 'Cancel',
                    btnOKLabel : '确定', // <-- Default value is 'OK',
                    callback : function(result) {
                        if (result) {
                            $.ajax({
                                url:"<%=request.getContextPath()%>/buyGoodsAction!queryshoucangjia.action?gid="+gid+"&id="+id,
                                //data:{"gid":gid,"id":id},
                                type:"post",
                                datatype:"json",
                                async:false,
                                success:function (pager){
                                    var zz="";
                                    if(pager==0){
                                        zz+="<div style='float:left'><button type='button' class='btn btn-collect btn-lg' onclick='sccg()'><i class='icon-main icon-like'></i>收藏</button>";
                                    }
                                    $("#shoucangsgj").html(zz)
                                },
                                error:function(){
                                    alert("出错了！！！")
                                }
                            });
                        }
                    }
                });

            },error:function(){
                alert('警告','报错');
            }
        })
    }*/

</script>
</body>
</html>
