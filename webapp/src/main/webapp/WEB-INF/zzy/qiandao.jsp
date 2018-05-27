<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/qiandao_style.css">
    <title>每日签到功能日历</title>
</head>

<body>
<input type="hidden" id="userid" value="${id}"/>
<input type="hidden" id="hibbys" />
<!-- 代码 开始 -->
<div class="qiandao-warp">
    <div class="qiandap-box">
        <div class="qiandao-banner">
            <img src="images/qiandao_banner.jpg" height="551" width="1120" alt="">
        </div>
        <div class="qiandao-con clear">
            <div class="qiandao-left">
                <div class="qiandao-left-top clear">
                    <div class="current-date"></div>
                    <div class="qiandao-history qiandao-tran qiandao-radius" id="js-qiandao-history">我的签到</div>
                </div>
                <div class="qiandao-main" id="js-qiandao-main">
                    <ul class="qiandao-list" id="js-qiandao-list">
                    </ul>
                </div>
            </div>
            <div class="qiandao-right">
                <div class="qiandao-top">
                    <div id="mmp">
                        <div class="just-qiandao qiandao-sprits" id="js-just-qiandao">
                        </div>
                    </div>
                    <p class="qiandao-notic">连续10日签到 即可领取 10积分 ,请明日继续签到</p>
                </div>
                <div class="qiandao-bottom">
                    <div class="qiandao-rule-list">
                        <h4>签到规则</h4>
                        <p>连续签到每天增加1.0积分奖励</p>
                        <p>当月签到20天及以上每天获得2.10元现金奖励</p>
                    </div>
                    <div class="qiandao-rule-list">
                        <h4>其他说明</h4>
                        <p>如果中间有一天间断未签到的，重先开始计算连续签到时间。(暂无)</p>
                        <p>用户必须登录 点才可获得 签到 条件 许可 否则点击无效 </p>
                        <p>获得的奖励不能直接提现，只会 将所签到所得的积分加入 积分和中 (可用来 进行抽奖活动 )。</p>
                        <p>获得的奖励不能直接提现 (其他功能待开发 !!!)。</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 我的签到 layer start -->
<div class="qiandao-layer qiandao-history-layer">
    <div class="qiandao-layer-con qiandao-radius">
        <a href="javascript:;" class="close-qiandao-layer qiandao-sprits"></a>
        <ul class="qiandao-history-inf clear">
            <li>
                <p> ${user.loginname}.</p>
            <li>
                <p>本月签到</p>
                <h4><span id="spansse"></span></h4><!-- count(前台) count++ -->
            </li>
            <li>
                <p>总共签到数</p>
                <h4><span id="ples"></span></h4><!-- 每次签到数据库字段 -->
            </li>
            <li>
                <p>签到累计奖励</p> <!-- 加一个 字段 -->
                <h4><span id="pless"></span></h4>
            </li>
        </ul>
        <div class="qiandao-history-table">
            <table>
                <thead>
                <tr>
                    <th>签到日期</th>
                    <th>奖励</th>
                    <th>说明</th>
                </tr>
                </thead>
                <table id="tabless">

                </table>
            </table>
        </div>
    </div>
    <div class="qiandao-layer-bg"></div>
</div>
<!-- 我的签到 layer end -->
<!-- 签到 layer start -->
<div class="qiandao-layer qiandao-active">
    <div class="qiandao-layer-con qiandao-radius">
        <a href="javascript:;" class="close-qiandao-layer qiandao-sprits"></a>
        <div class="yiqiandao clear">
            <div class="yiqiandao-icon qiandao-sprits"></div>
        </div>
        <div class="qiandao-jiangli qiandao-sprits">

            <span class="qiandao-jiangli-num"><em>签到成功,(无现金)</em></span>
        </div>
        <a href="#" onclick="shuaxin()" class="qiandao-share qiandao-tran">确定</a>
    </div>
    <div class="qiandao-layer-bg"></div>
</div>

<!-- 签 c到 layer end -->
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/qiandao_js.js"></script>
<!-- 代码 结束 -->

<div style="text-align:center;margin:10px 0; font:normal 14px/24px 'MicroSoft YaHei';">
    <p> </p>
    <p><script src="#"></script><center style="display:none"><script src="#"></script></center></p>
</div>
<script type="text/javascript">


    $(function(){

        var myDate = new Date();

        var pp = myDate.getFullYear();  //获取完整的年份(4位,1970-????)
        var oo =  myDate.getMonth()+1;   //获取当前月份(0-11,0代表1月)


        var  userid = $("#userid").val()
        var iop = pp+"-"+oo//获取年月

        //yemian()//想要 有 日期表格 下面注销的代码必须查出来!!!
        $.ajax({
            url:"<%=request.getContextPath()%>/youhuiAction!queryqiandaos.action",
            type:"post",
            data:{"userids":userid,"iopdate":iop},
            dataType:"json",
            async:false,
            success:function(aa){

                var xh = [];
                for (var i = 0; i < aa.length; i++) {
                    xh [i] = aa[i].indes
                }
                yemian(xh)
            },
            error:function(){
                alert("抱歉")
            }
        })
    })

    var count = 0;
    function yemian(xh){
        var signFun = function() {
            //此处 new Date得到 2018-01 去后台查询
            var dateArray = xh // 假设已经签到的

            var $dateBox = $("#js-qiandao-list"),
                $currentDate = $(".current-date"),
                $qiandaoBnt = $("#js-just-qiandao"),
                _html = '',
                _handle = true,
                myDate = new Date();
            $currentDate.text(myDate.getFullYear() + '年' + parseInt(myDate.getMonth() + 1) + '月' + myDate.getDate() + '日');

            var monthFirst = new Date(myDate.getFullYear(), parseInt(myDate.getMonth()), 1).getDay();

            var d = new Date(myDate.getFullYear(), parseInt(myDate.getMonth() + 1), 0);
            var totalDay = d.getDate(); //获取当前月的天数

            for (var i = 0; i < 42; i++) {

                _html += ' <li><div class="qiandao-icon"></div></li>'
            }
            $dateBox.html(_html) //生成日历网格

            var $dateLi = $dateBox.find("li");
            for (var i = 0; i < totalDay; i++) {
                $dateLi.eq(i + monthFirst).addClass("date" + parseInt(i + 1));
                for (var j = 0; j < dateArray.length; j++) {
                    if (i == dateArray[j]) {
                        if(myDate.getDate()-1 == dateArray[j]){
                            $("#mmp").html("<div style='padding:8px;border:1px solid #96c2f1;background:#eff7ff'><font color='blue'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您当天已签到!!</font></div>")
                        }
                        count++;
                        $dateLi.eq(i + monthFirst).addClass("qiandao");
                    }
                }
            } //生成当月的日历且含已签到

            $(".date" + myDate.getDate()).addClass('able-qiandao');

            $dateBox.on("click", "li", function() {
                if ($(this).hasClass('able-qiandao') && _handle) {
                    $(this).addClass('qiandao');
                    //qiandaoFun();
                }
            }) //签到

            $qiandaoBnt.on("click", function() {
                // if (_handle) {// true
                qiandaoFun();
                // }
            }); //签到

            function qiandaoFun() {

                $qiandaoBnt.addClass('actived');
                openLayer("qiandao-active", qianDao);
                _handle = false;

            }

            function qianDao() {
                $(".date" + myDate.getDate()).addClass('qiandao');
                //   alert(myDate.getDate()-1)//获取到当前 下标  选中
                var datesp = myDate.getDate()-1
                addqiandao(datesp);
            }
        }();

        function openLayer(a, Fun) {

            $('.' + a).fadeIn(Fun)
        } //打开弹窗

        var closeLayer = function() {
            $("body").on("click", ".close-qiandao-layer", function() {
                $(this).parents(".qiandao-layer").fadeOut()
            })
        }() //关闭弹窗

        $("#js-qiandao-history").on("click", function() {
            openLayer("qiandao-history-layer", myFun);
            qandaoxinqi()
            function myFun() {
                console.log(1)
            } //打开弹窗返回函数
        })

    }


    //我的签到
    //这里查到登录用户id 5 1为假值  将这个东西怼到 mogondb里

    function addqiandao(datesp){

        var myDate = new Date();
        myDate.getYear();    //获取当前年份(2位)
        var pp = myDate.getFullYear();  //获取完整的年份(4位,1970-????)
        var oo =  myDate.getMonth()+1;   //获取当前月份(0-11,0代表1月)
        var ii = myDate.getDate();    //获取当前日(1-31)

        var iop = pp+"-"+oo+"-"+ii//获取年月日

        var indes = myDate.getDate()-1 //获取到当前 下标  选中

        var  userid = $("#userid").val()
        //alert(iop)//日期
//	alert(userid)//当前用户
        //alert(datesp)//签到当天
        // alert(myDate.getDate()-1)//获取到当前 下标  选中
        var nameuser = $("#username").val();
        var counts = count+1
        var jiangli = 1;
        if(count == 20){
            jiangli = 2.1;
        }

        var suoming = nameuser+"第"+counts+"次签到成功!";

        $.ajax({
            url:"<%=request.getContextPath()%>/youhuiAction!addUserQiandao.action",
            type:"post",
            data:{"userids":userid,"iopdate":iop,"indes":indes,"beizhu":jiangli,"suoming":suoming},
            async:false,
            success:function(){
            },
            error:function(){
                alert("抱歉")
            }
        })
    }

    var uiuiui = [];
    function qandaoxinqi(){

        $("#spansse").html(count)

        var  userid = $("#userid").val()

        $.ajax({
            url:"<%=request.getContextPath()%>/youhuiAction!queryqiandaoTJ.action",
            type:"post",
            data:{"userids":userid},
            dataType:"json",
            async:false,
            success:function(aa){
                // alert(aa)
                $("#hibbys").val(aa);
                var opopop = $("#hibbys").val()

                uiuiui = opopop.split(",")
                for (var i = 0; i < uiuiui.length; i++) {
                    $("#ples").html(uiuiui[0])

                    var oooo = uiuiui[1].substring(0,5)
                    $("#pless").html(oooo)
                }
            },
            error:function(){
                alert("抱歉")
            }
        })

        var myDate = new Date();

        var pp = myDate.getFullYear();  //获取完整的年份(4位,1970-????)
        var oo =  myDate.getMonth()+1;   //获取当前月份(0-11,0代表1月)

        var iop = pp+"-"+oo//获取年月

        $.ajax({
            url:"<%=request.getContextPath()%>/youhuiAction!queryqiandaos.action",
            type:"post",
            data:{"userids":userid,"iopdate":iop},
            dataType:"json",
            async:false,
            success:function(aa){
                var tables = "";
                var ppcount = 0;
                var desc = (aa.length-8)
                var desrone = 0;
                if(desc >= 8){
                    desrone = desc;
                }else{
                    desrone = 0;
                }
                for (var j = desrone; j < aa.length;j++) {
                    tables += "<tr><td>"+aa[j].iopdate+"</td><td>"+aa[j].beizhu+"</td><td>"+aa[j].suoming+"</td></tr>"
                    ppcount++;

                    if(ppcount <= 8){
                        $("#tabless").html(tables)
                    }
                }

            },
            error:function(){
                alert("抱歉")
            }
        })
    }


    function shuaxin(){

        location.reload()
    }
</script>
</body>
</html>