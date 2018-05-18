<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <body>
 <form id="updatenotice" method="post" >
 	<input type="hidden" name="noticeid" value="${notice.noticeid}"/>
	 <input type="hidden" name="noticeid" value="${notice.noticedate}"/>
		<table >

			<tr>
				<td align="right">公告标题:</td>
				<td>
					<input STYLE="width:200px" class="easyui-validatebox" type="text" name="noticename"  value="${notice.noticename}" data-options="required:true" />
				</td><br>
			</tr>
			<tr>
				<td align="right">公告时间:</td>
				<td>
					<input name="noticedate" type="text" size="15"  value="${notice.noticedate} "    onfocus = "WdatePicker({dateFmt:'yyyy-MM-dd '}) "/>
				</td><br>
			</tr>

			<tr>
				<td align="right">公告内容:</td>
				<td>
				<textarea rows="3" STYLE="width:200px"  name="noticebulletin" class=easyui-validatebox" data-options="required:true,validType:'length[1,1000000]'" invalidMessage="最大长度不能超过1000000">
					${notice.noticebulletin}
					</textarea>
				</td>
			</tr>

		</table>
	</form>
 <script type="text/javascript">
     var pp= $("#biaodanid1").datagrid("getSelected");
     $("[name='notice2.noticeid']").val(pp.noticeid);
     $("[name='notice2.noticename']").val(pp.noticename);
     $("[name='notice2.noticedate']").val(pp.noticedate);
     $("[name='notice2.noticebulletin']").val(pp.noticebulletin);

 </script>


</body>
</html>