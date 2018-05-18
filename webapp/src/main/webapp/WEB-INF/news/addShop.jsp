<%--
  Created by IntelliJ IDEA.
  User: 杜家乐
  Date: 2018-05-17
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <form id="addShopForm">
        商品名称:<input class="easyui-textbox" value="" name="sname"><br>
        商品金额:<input class="easyui-textbox" value="" name="price"><br>
        商品库存:<input class="easyui-textbox" value="" name="kucun"><br>
        所属种类:<input class="easyui-combobox" id="daOption" value="" name="daid"><br>
        所属分类:<input class="easyui-combobox" id="xiaoOption" value="" name="xiaoid"><br>
        过期时间:<input class= "easyui-datebox" required ="required" value="" name="pasttime"><br>
        商品图片:<input class="easyui-filebox" id="fb" name="file" ><br>
    </form>
</center>
<script type="text/javascript">
    $('#daOption').combobox({
        url:'<%=request.getContextPath()%>/echartsController/daOption.do',
        valueField:'id',
        textField:'dname',
        onLoadSuccess:function(node){
            $('#daOption').combobox('setValue',${shopx.daid});
        },
        onChange:function(newValue,oldValue){
            $('#xiaoOption').combobox({
                url:'<%=request.getContextPath()%>/echartsController/xiaoOption?id='+newValue,
                valueField:'id',
                textField:'name',
            })
        }
    });
</script>
</body>
</html>
