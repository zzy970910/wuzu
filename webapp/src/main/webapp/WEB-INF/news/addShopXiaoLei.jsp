<%--
  Created by IntelliJ IDEA.
  User: 杜家乐
  Date: 2018-05-16
  Time: 17:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="addShopXiaoLei">
    <input type="hidden" name="id" id="id" value="${xiao.id}"/>
    <table>
        <tr>
            <td>名称</td>
        </tr>
        <tr>
            <td><input type="text" name="name" value="${xiao.name}"/></td>
        </tr>
        <tr>
            <td>所属种类</td>
        </tr>
        <tr>
            <td><input  name="daid"  value="${xiao.daid}">  </td>
        </tr>
        <tr>
            <td>备注</td>
        </tr>
        <tr>
            <td><textarea name="beizhu" rows="4" cols="26">${xiao.beizhu}</textarea></td>
        </tr>
    </table>
<script type="text/javascript">
    $(function(){
        $('[name="daid"]').combobox({
            url:'<%=request.getContextPath()%>/shoplei/queryda.do',
            valueField:'id',
            textField:'dname'
        });
    })
</script>
</form>
</body>
</html>
