<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/23
  Time: 22:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="base.jsp"></jsp:include>
<head>
    <title>Title</title>
</head>
<body>
<center>
<table border="1" cellspacing="0" bgcolor="blue" width="500px" h>
    <thead>
        <tr>
            <td>选择</td>
            <td>省份</td>
            <td>市区</td>
            <td>详情</td>
            <td>收货人</td>
            <td>手机号</td>
            <td>操作</td>
        </tr>
    </thead>
    <tbody id="bodys">

    </tbody>
</table>
</center>
<script>
   $(function(){
        $.ajax({
            url:"<%=request.getContextPath()%>/zzyController/selectAdress.do",
            type:"post",
            data:{"id":${id}},
            dataType:"json",
            success:function (result) {
                var str ='';
                $.each(result,function(){
                    str += "<tr>"+
                            "<label><td><input type='radio' name='rad' onclick='aaaq("+this.id+")' value='"+this.id+"'></td></label>"+
                            "<td>"+this.sheng+"</td>"+
                            "<td>"+this.shi+"</td>"+
                            "<td>"+this.xian+"</td>"+
                            "<td>"+this.name+"</td>"+
                            "<td>"+this.phone+"</td>"+
                            "<td><input type='button' value='添加地址' /></td>"+
                            "</tr>"

                })

                $("#bodys").html(str)
            },
            error:function () {
                alert("GG")
            }
        })
    })

    function aaaq(ss) {
        alert(ss)
    }

</script>

</body>
</html>
