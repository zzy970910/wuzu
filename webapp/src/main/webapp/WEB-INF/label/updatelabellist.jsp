<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>

</head>
<body>
<form id="fdc" method="post">
    <table >

        <tr>
            <td align="right">标签名称:</td>
            <td>
                <input  type="hidden"   name="labelid"/>
                <input class="easyui-validatebox" type="text" name="labelname" data-options="required:true" />
            </td>
        </tr>
        <tr>
            <td align="right">标签地址:</td>
            <td>
                <textarea class="easyui-validatebox"  name="labeladdress" data-options="required:true" />
            </td>
            <td   id="dddd"></td>
        </tr>

    </table>
</form>
<script type="text/javascript">
    var pp= $("#bdidluzhi").datagrid("getSelected");
    $("[name='labelid']").val(pp.labelid);
    $("[name='labelname']").val(pp.labelname);
    $("[name='labeladdress']").val(pp.labeladdress);

</script>

</body>
</html>