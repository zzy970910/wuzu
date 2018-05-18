<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>

</head>
<body>

<form id="add-form" method="post">
	<center>
		<input type="hidden" name="userid" value="${user.userid}">

		<table  whdth="1200px"  height="200px" >
			<tr>
				<td>用户姓名</td>
				<td><input type="text" name="username" value="${user.username}"></td>
			</tr>
			<tr>
				<td>用户年龄</td>
				<td><input type="text" name="age" value="${user.age}"></td>
			</tr>
			<tr>
				<td>用户生日</td>
				<td><input type="text"  class= "easyui-datebox" required ="required"  name="birday" value="${user.birday}"></td>
				<%--<td><input type="text" name="birday" value="${user.birday}"></td>--%>
			</tr>
			<tr>
				<td>用户密码</td>
				<td><input type="text" name="userpwd" value="${user.userpwd}"></td>
			</tr>
			<tr>
				<td>用户电话</td>
				<td><input type="text" name="telphone" value="${user.telphone}"></td>
			</tr>
			<tr>
				<td>排序</td>
				<td><input type="text" name="userflag" value="${user.userflag}"></td>
			</tr>
		</table>
	</center>
</form>

</body>
</html>