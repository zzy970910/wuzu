<%--
  Created by IntelliJ IDEA.
  User: 杜家乐
  Date: 2018-05-17
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<form id="exportforms" accept-charset="GBK" onsubmit="if(!!window.ActiveXObject){document.charset='GBK';}" >
    请选择要导出的数据：<br>

    <label><input type="checkbox" name="namesse" value="编号">编号</label>
    <label><input type="checkbox" name="namesse" value="新闻名称">公告名称</label>
    <label><input type="checkbox" name="namesse" value="发布时间">公告发行时间</label>
    <label><input type="checkbox" name="namesse" value="相应内容">公告内容</label>
</form>
</body>
</html>
