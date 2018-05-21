<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/16
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery-easyui/themes/ui-sunny/easyui.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery-easyui/themes/icon.css"/>
<body>
<form id="miaoshaform">
    <input type="hidden" value="${miaoid}" name="goodid">
    商品数量：<input class="easyui-textbox" name="count" style="width:250px"> <br>
    开始时间：<input class="easyui-datetimebox" name="begintimeStr"
                data-options="required:true,showSeconds:true" style="width:250px"><br>
    结束时间：<input class="easyui-datetimebox" name="endtimeStr"
                data-options="required:true,showSeconds:true" style="width:250px"><br>
    秒杀价格：<input class="easyui-textbox" name="mprice" style="width:250px"><br>
</form>
</body>
</html>
