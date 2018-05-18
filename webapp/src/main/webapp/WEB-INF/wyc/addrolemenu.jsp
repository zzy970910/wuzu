<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<form id="wert">
    <input type="hidden" name="roid">
    <%--用户角色:<input class="easyui-validatebox" type="hidden" name="roname"  readonly="readonly"/>--%>
    <table>
        <tr id="roletree" ></tr>
    </table>
</form>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/util-js.js"></script>
<script type="text/javascript">
    var pp= $("#dg").datagrid("getSelected");

//    console.info(pp);
    $("[name='roname']").val(pp.name);
    $("[name='roid']").val(pp.id);


    $(function(){
        $.ajax({
            url:"<%=request.getContextPath()%>/role/addchamenulist.do",
            type:"post",
            data:{"roid":pp.id},
            success:function(data){
                console.info(data)
;                $('#roletree').tree({
                    method:"post",
                    checkbox:true,
                    data:data,
                    parentField:'pid',


                })
            }
        })
    })



</script>
</body>
</html>