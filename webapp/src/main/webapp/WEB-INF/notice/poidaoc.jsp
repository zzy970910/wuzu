<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="exportforms" accept-charset="GBK" onsubmit="if(!!window.ActiveXObject){document.charset='GBK';}" >
请选择要导出的数据：<br>


<label><input type="checkbox" name="namesse" value="编号">编号</label>
<label><input type="checkbox" name="namesse" value="公告名称">公告名称</label>
<label><input type="checkbox" name="namesse" value="公告发行时间">公告发行时间</label>
<label><input type="checkbox" name="namesse" value="公告内容">公告内容</label>
</form>
</body>
</html>