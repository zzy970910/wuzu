<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <body>
 <form id="gonggao" method="post" >
 	<input type="hidden" name="noticedate"/>
		<table >
	
			<tr>
				<td align="right">公告标题:</td>
				<td>
					<input STYLE="width:200px" class="easyui-validatebox" type="text" name="noticename" data-options="required:true" />
				</td><br>
			</tr>
			<tr>
				<td align="right">公告内容:</td>
				<td>
				<textarea rows="3" STYLE="width:200px" id="noticebulletin" name="noticebulletin" class="easyui-validatebox" data-options="required:true,validType:'length[1,1000000]'" invalidMessage="最大长度不能超过1000000"></textarea>
				</td>
			</tr>
			 
		</table>
	</form>

<script type="text/javascript">
 
</script>
</body>
</html>