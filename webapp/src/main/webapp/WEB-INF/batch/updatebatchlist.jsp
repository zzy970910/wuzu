<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<form id="updatebatch">
    <input type="hidden" id="id" name="id">
    批次名称:<input name="bname" id="bname">
</form>

<script type="text/javascript">

    var pp= $("#dgbatch").datagrid("getSelected");
    $("[name='id']").val(pp.id);
    $("[name='bname']").val(pp.bname);



</script>

</body>
</html>