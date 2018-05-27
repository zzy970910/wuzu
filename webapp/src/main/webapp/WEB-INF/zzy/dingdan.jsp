<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/24
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<jsp:include page="/WEB-INF/zzy/base.jsp"></jsp:include>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/boot/bootstrap-table/dist/bootstrap-table.css" >
<script type="text/javascript" src="<%=request.getContextPath()  %>/js/boot/bootstrap-table/dist/bootstrap-table.js"></script>



<link href="../../image/favicon.ico" type="image/x-icon" rel="shortcut icon" />
<link type="text/css" rel="stylesheet" href="../../styles/index.css" />

<link href="image/favicon.ico" type="image/x-icon" rel="shortcut icon" />



<link type="text/css" rel="stylesheet" href="/styles/index.css" />
<script type="text/javascript" src="/js/index.js"></script>
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" />
<%--<link href="<%=request.getContextPath() %>/assets/lib/bootstrap/css/bootstrap.css"
      rel="stylesheet" />--%>
<%--<script src="/assets/lib/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" href="/js/boot/bootstrap-dialog/dist/css/bootstrap-dialog.css" >
<script type="text/javascript" src="/js/boot/bootstrap-dialog/dist/js/bootstrap-dialog.js"></script>--%>
<%--<script src="/assets/lib/bootstrap/js/bootstrap.js"></script>
<script src="/assets/lib/jquery/jquery-1.11.0.js"></script>
<script src="/assets/lib/bootstrap/js/bootstrap.js"></script>--%>
<body>


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
                <span><h1>我的订单</h1></span>
            </div>
            <div class="col-lg-3">

            </div>
        </div>
    </div>
</div>


<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">菜鸟教程</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">iOS</a></li>
                <li><a href="#">SVN</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        Java
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">jmeter</a></li>
                        <li><a href="#">EJB</a></li>
                        <li><a href="#">Jasper Report</a></li>
                        <li class="divider"></li>
                        <li><a href="#">分离的链接</a></li>
                        <li class="divider"></li>
                        <li><a href="#">另一个分离的链接</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<table id="table" class="table" ></table>

<script type="text/javascript">
    $("#table").bootstrapTable({

        url: "<%=request.getContextPath()%>/zzyController/selectindent.do?id="+${id},//获取数据的请求路径
        columns: [//绑定数据
            {field: 'indentcode', title: '订单编号'},
            {field: 'sname', title: '商品名称'},
            {field: 'goodscount', title: '商品数量'},
            {field: 'allprice', title: '商品价格'},
            {field: 'createtime', title: '订单时间'},
            {field: 'sheng', title: '目的地'},
            {field: 'loginname', title: '用户名称'},

            {
                field: 'status', title: '订单状态', width: 130, formatter: function (value, row, index) {
                 if(row.status==1){
                     return "未发货"
                 }else if(row.status==2){
                     return "运送中"
                 }else if(row.status==3){
                     return "正在发往省部仓库";
                 }else if(row.status==4){
                     return "省部仓库已发货"
                 }else if(row.status==5){
                     return "以到县区仓库"
                 }else if(row.status==6){
                     return "县区仓库已发货，等待用户确认收货";
                 }else if(row.status==7){
                     return "用户已签收";
                 }
            }
            },


            {
                field: 'ab', title: '操作', formatter: function (value, row, index) {
                         if(row.status==7){
                             return "<button type=\"button\" class=\"btn btn-danger btn-lg mr20\" id=\"addbtn\">确认收货</button>"

                         }
                return   "<button type=\"button\" class=\"btn btn-addcart btn-lg mr20\" id=\"addbtn\">查看物流</button>"

            }
            }


        ],
        pagination: true,
        search: true,
        strictSearch: false,
        pageNumber: 1,//初始化 页数
        pageSize: 10,//初始化 条数
        pageList: [5, 10, 15],//初始化 可选择的条数
        /*//显示分页条

        paginationLoop: false,//关闭分页的无限循环
        height: 530,//高度
        undefinedText: "-",//有数据为空时 显示的内容
        striped: true,//斑马线
      //  sortName: "mprice",//排序的字段
        sortOrder: "desc",//排序的方式 desc或asc
        //onlyInfoPagination:true,设置true时  只显示总条数
        //selectItemName:"name",
        //smartDisplay:false,
       //启用搜索框


        //设置精确匹配 还是模糊匹配     默认模糊匹配false
        //showFooter:true,//表格底部角
        showColumns: true,//显示选择展示列的按钮
        showRefresh: true,//刷新按钮
        showToggle: true,//切换显示格式
        showPaginationSwitch: true,//展示所有数据 和分页数据的切换按钮
        //detailView:true,//列的详细页
        /!*  detailFormatter:function(index,row){
             //格式化详细页
             return '<a href="#">'+row.p_name+'</a>';
         }, *!/
        searchAlign: "left",//搜索框的显示位置
        paginationHAlign: "left",//分页按钮的显示位置
        paginationDetailHAlign: "right",//总页数 和条数的显示位置
        paginationPreText: "上一页",//设置上一页显示的文本
        paginationNextText: "下一页",//设置下一页显示的文本
        clickToSelect: true,//选中行  默认选中  单选或复选
        sidePagination: "server",
        method: "post",
*/
    })
</script>




</body>
</html>
