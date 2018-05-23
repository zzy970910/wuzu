<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/22
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<jsp:include page="/WEB-INF/zzy/base.jsp"></jsp:include>

<script type="text/javascript" src="/js1.7/jquery-1.7.2.js"></script>
<link href="image/favicon.ico" type="image/x-icon" rel="shortcut icon" />



<link type="text/css" rel="stylesheet" href="styles/index.css" />
<script type="text/javascript" src="js/index.js"></script>
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/assets/lib/bootstrap/css/bootstrap.css"
      rel="stylesheet" />
<script src="assets/lib/bootstrap/js/bootstrap.js"></script>
<%--<link rel="stylesheet" href="js/boot/bootstrap-dialog/dist/css/bootstrap-dialog.css" >
<script type="text/javascript" src="js/boot/bootstrap-dialog/dist/js/bootstrap-dialog.js"></script>
<script src="assets/lib/bootstrap/js/bootstrap.js"></script>&ndash;%&gt;&ndash;%&gt;--%>
<script src="/assets/lib/jquery/jquery-1.11.0.js"></script>
<script src="/assets/lib/bootstrap/js/bootstrap.js"></script>

<body>
<div id="dialog_yh">
</div>
<input type="hidden" id="daleiidyk"  >
<div id="sitebar">
    <div class="container">
        <div >
            <div class="col-lg-6">
                <a href="javascript:;" class="bootmark" rel="nofollow"><i class="icon-main icon-collect mt8 mr5"></i>龙盾科技</a>
                <span>您好，欢迎您光临蘑菇街购物商城！</span>
                <span class="bar-link">
                      	欢迎您：${user.loginname}
                      	<input type="hidden" id="mmp" value="${user.userid}"/>
                    </span>
            </div>
            <div class="col-lg-6">
                <ul class="pull-right bar-link">

                    <li><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=535212936&site=qq&menu=yes">客户服务</a> | </li>
                    <li><a href="http://www.5566.net/">网站导航</a> |&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    <li class="tel-num"><i class="icon-main icon-tel mt8 mr5"></i>136-1064-1107</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--/#sitebar-->
<div id="btn btn-default btn-lg btn-block" style="background-color: #2aabd2">
    <div class="container">
        <div class="row search" >
            <div class="col-lg-4">
  <%--              <h1 class="logo">
                    <img  width="80px" height="80px"  src="/img/logo2.png" alt="蘑菇街" /><img src="assets/img/logo/logo-text.png" alt="金科教育，万薪就业！" /></h1>--%>
            </div>
            <div class="btn btn-default btn-lg btn-block" style="background-color: #2aabd2">
                <span><h1>蘑菇街购物车</h1></span>
            </div>
            <div class="col-lg-3">

            </div>
        </div>


                <%--<ul class="nav navbar-nav f14">
                    <li class="active"><a href="index.jsp">首页</a></li>

                    <!--<li class="dropdown"> <a href="#">Dropdown </a> </li>-->
                </ul>--%>
                <!--<ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="./">Default</a></li>
                    <li><a href="../navbar-static-top/">Static top</a></li>
                    <li><a href="../navbar-fixed-top/">Fixed top</a></li>
                </ul>-->

            <!--/.nav-collapse -->

    </div>
</div>
<!--/#header-->
<div class="container">
    <!-- 内容部分开始 -->
    <!-- 购物车开始 -->
    <div class="row">
        <div class="col-lg-12">
            <div class="btn btn-default btn-lg btn-block" style="background-color:dodgerblue ">我的购物车</div>
            <div class="cart-content">
                <table width="100%" border="0">
                    <tbody  id="gouwuchedata">
                    <tr>
                        <td width="5%" class="tr-title">
                        </td>
                        <td width="45%" class="tr-title">商品名称</td>
                        <td width="7%" class="tr-title">积分</td>
                        <td width="12%" class="tr-title">金额</td>
                        <td width="11%" class="tr-title">优惠</td>
                        <td width="12%" class="tr-title">数量</td>
                        <td width="8%" class="tr-title">操作</td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-lg-12 main-show mb10">
            <div class="p10">
         <div class="show-left pull-left">
                    <a href="#" onclick="deleteallclt123()"><i class="icon-main icon-fork"></i>清空购物车</a>
                </div>
                <div class="show-right pull-right tr">
                    <div class=""><b class="orange-font" id="showcount11"></b>件商品 总计：￥<font color="red"><b id="showallmoney"></b></font></div>

                </div>
                <div class="clearfix"></div>
            </div>
<%--
            <div class="total tr"><b>总计（不含运费）：</b> <i class="orange-font f20 tit-family pr10">￥<b id="showallmoney1">0.00</b></i></div>
--%>
        </div>
        <div class="pull-right">
            <button type="button"  onclick="shuaxina()" class="btn btn-warning btn-lg mr20">刷新</button>
            <button type="button"  onclick="gobacktobuy()" class="btn btn-addcart btn-lg mr20">继续购物</button>
            <button type="button" onclick="buyallgouwu()"  class="btn btn-danger btn-lg mr20">去结算</button><br><br>
        </div>
    </div>
    <!-- 购物车结束 -->
    <!-- 购物车为空开始 -->

    <!-- 购物车为空结束 -->
    <!--         在购物车下面加那些推荐的商品啊 -->
    <div class="row">
        <div class="col-lg-12">
            <div class="btn btn-primary btn-lg btn-block" style="height: 50px;background-color: #2aabd2"><font size="5">你还可能需要</font></div><br><br>
            <div style="width:1200px;height:300px;" id="tuijiandeshangpindalei"></div>
        </div></div>
</div>
<div class="row mt20">
    <div class="col-lg-12">
        <ul class="listbar-5">
            <li><i class="icon-main icon-intr-1 ilb ml31"></i>
                <p class="tc gray-font">
                    正品保证<br>
                    假1赔10
                </p>
            </li>
            <li><i class="icon-main icon-intr-2 ilb ml31"></i>
                <p class="tc gray-font">
                    质优价廉<br>
                    买贵就赔
                </p>
            </li>
            <li><i class="icon-main icon-intr-3 ilb ml31"></i>
                <p class="tc gray-font">
                    7天保障<br>
                    无理由退换
                </p>
            </li>
            <li><i class="icon-main icon-intr-4 ilb ml31"></i>
                <p class="tc gray-font">
                    满100元<br>
                    免运费
                </p>
            </li>
            <li><i class="icon-main icon-intr-5 ilb ml31"></i>
                <p class="tc gray-font">
                    100优惠宝<br>
                    =1元
                </p>
            </li>
            <li><i class="icon-main icon-intr-6 ilb ml31"></i>
                <p class="tc gray-font">
                    24小时<br>
                    闪电发货
                </p>
            </li>
            <li><i class="icon-main icon-intr-7 ilb ml31"></i>
                <p class="tc gray-font">
                    7x24小时<br>
                    在线客服
                </p>
            </li>
            <li><i class="icon-main icon-intr-8 ilb ml31"></i>
                <p class="tc gray-font">
                    支持多种<br>
                    支付方式
                </p>
            </li>
            <li><i class="icon-main icon-intr-9 ilb ml31"></i>
                <p class="tc gray-font">
                    开箱验货<br>
                    放心付款
                </p>
            </li>
            <li><i class="icon-main icon-intr-10 ilb ml31"></i>
                <p class="tc gray-font">
                    晒单奖励<br>
                    评论奖励
                </p>
            </li>
        </ul>
    </div>
</div>
<div class="row mt10">
    <div class="col-lg-12 help-center">
        <ul class="help-list">
            <li>
                <ul class="help-on">
                    <li class="ontitle"><i class="icon-main icon-help-1 pull-left"></i>关于我们</li>
                    <li class="ontext"><a href="#">关于金科</a></li>
                    <li class="ontext"><a href="#">联系我们</a></li>
                    <li class="ontext"><a href="#">加入我们</a></li>
                </ul>
            </li>
            <li>
                <ul class="help-on">
                    <li class="ontitle"><i class="icon-main icon-help-2 pull-left"></i>购物指南</li>
                    <li class="ontext"><a href="#">购物流程</a></li>
                    <li class="ontext"><a href="#">服务协议</a></li>
                    <li class="ontext"><a href="#">优惠券说明</a></li>
                </ul>
            </li>
            <li>
                <ul class="help-on">
                    <li class="ontitle"><i class="icon-main icon-help-3 pull-left"></i>支付方式</li>
                    <li class="ontext"><a href="#">银联支付</a></li>
                    <li class="ontext"><a href="#">快钱支付</a></li>
                    <li class="ontext"><a href="#">支付宝支付</a></li>
                </ul>
            </li>
            <li>
                <ul class="help-on">
                    <li class="ontitle"><i class="icon-main icon-help-4 pull-left"></i>配送方式</li>
                    <li class="ontext"><a href="#">运费说明</a></li>
                </ul>
            </li>
            <li>
                <ul class="help-on">
                    <li class="ontitle"><i class="icon-main icon-help-5 pull-left"></i>售后服务</li>
                    <li class="ontext"><a href="#">退换货政策</a></li>
                    <li class="ontext"><a href="#">退换货流程</a></li>
                    <li class="ontext"><a href="#">退换货申请</a></li>
                </ul>
            </li>
            <li>
                <ul class="help-on">
                    <li class="ontitle"><i class="icon-main icon-help-6 pull-left"></i>帮助信息</li>
                    <li class="ontext"><a href="#">常见问题</a></li>
                    <li class="ontext"><a href="#">投诉建议</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
</div>
<footer>
    <div class="container">
        <p class="tc lh200">
            <a href="#">关于我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">网络联盟</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">商家入驻</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">网络招聘</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">广告服务</a>&nbsp;&nbsp;|
            <br />
            蘑菇街出版许可证编号新出网证 <a href="http://www.miibeian.gov.cn/" target="_blank" rel="external nofollow">张正义2018/05/22</a> 蘑菇街©蘑菇街商城<br>
            京公网安备6e23532dfsd号
        </p>
    </div>
</footer>
</body>
<script>



    $(function(){
        $.ajax({
            url:'<%=request.getContextPath()%>/zzyController/selectGG.do?id='+${user.userid},
           // data:{"id":aa},
            type:"post",
            dataType:"json",
            success:function(result){
                alert(result)
                var count=0;
                var count1=0;

                var xiaojidounle="";


                var str= "<tr><td width='5%' class='tr-title'></td><td width='45%' class='tr-title'>商品名称</td><td width='12%' class='tr-title'>金额</td><td width='11%' class='tr-title'>优惠</td><td width='12%' class='tr-title'>数量</td><td width='8%' class='tr-title'>操作</td></tr>";
                if(result!="null"&&result!=null){
                   // var daleideid=result[0].daid;
                    //$("#daleiidyk").val(daleideid);
                    for (var i = 0; i < result.length; i++) {
                      //  alert(result[i].goodsid)
                        /* alert(result[0]);
                        alert(result[0].daid); */

                        xiaojidounle=result[i].goodsxiaoji;
                        alert(result[i].goodsxiaoji);
                        count+=result[i].goodscount;
                        count1+=result[i].goodsxiaoji;

                        str+="<tr>"+
                            "<td width='5%' class='tr-list'>"+
                            "</td>"+
                            "<td width='45%' class='tr-list'>"+
                            "<img class='pull-left'  src='"+result[i].goodsimage+"' />"+
                            "<div class='summary blue-font'><a href='#'>"+result[i].goodsname+"</a></div>"+
                            "</td>"+
                            "<td width='7%' class='tr-list'><b id='"+result[i].goodsid+"'>"+result[i].goodsprice+"</b></td>"+

                            "<td width='10%' class='tr-list'><b class='orange-font'>减￥0</b></td>"+
                            //"<td width='11%' class='tr-list'>"+result[i].goodscount+"</td>"+
                            "<td width='12%' class='tr-list'>"+

                            "<span class='ui-spinner'>"+
                            "<input type='text' class='"+result[i].goodsid+"' value='"+result[i].goodscount+"' aria-valuenow='0' autocomplete='off'>"+
                            "<a class='ui-spinner-button ui-spinner-up' onclick='updatacountup("+result[i].goodsid+","+result[i].goodscount+","+result[i].goodsprice+")'><span>▲</span></a>"+
                            "<a class='ui-spinner-button ui-spinner-down' onclick='updatacountdown("+result[i].goodsid+","+result[i].goodscount+","+result[i].goodsprice+")'><span >▼</span></a>"+
                            "</span>"+
                            "</td>"+
                            "<td width='5%' class='tr-list bule-font'><a href='#' onclick='deletegoodsbyid("+result[i].goodsid+")'><font color='red'>删除</font></a></td>"+
                            "</tr>"


                    }
                }

                $("#gouwuchedata").html(str);
                $("#showcount11").html(count);
                //$("#showcount").html(ssss);

                $("#showallmoney").html(count1);
               // cha();

            },error:function(){
                alert('警告','报错');
            }
        })
    })

</script>
<script>
    function deletegoodsbyid(id) {
        $.ajax({
            url:'<%=request.getContextPath()%>/zzyController/updateGwc.do?id='+id,
            //data:{"id":aa,"gid":gid},
            type:"post",
            dataType:"json",
            success:function(reuslt){
                location.reload();
            },error:function(){
                alert('警告','报错');
            }
        })
    }
    function gobacktobuy(){
        location.href="<%=request.getContextPath()%>/main.jsp";
    }
    function updatacountup(gid,gcount,price) {

        $("#"+gid+"").html(price * ((parseInt($("."+gid+"").val()) + 1)))
        $("."+gid+"").val(parseInt($("."+gid+"").val()) + 1)

    }
    function updatacountdown(gid,gcount,price) {
        if(parseInt($("."+gid+"").val()) > 1){
            $("#"+gid+"").html(price * ((parseInt($("."+gid+"").val()) - 1)))
            $("."+gid+"").val(parseInt($("."+gid+"").val()) - 1)
        }


    }
</script>
</html>
