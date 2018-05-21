<%--
  Created by IntelliJ IDEA.
  User: 杜家乐
  Date: 2018-05-14
  Time: 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <% String path = request.getContextPath(); %>
    <link rel="stylesheet" href="<%=path %>/js/themes/insdep/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/js/themes/insdep/easyui_animation.css"/>
    <link rel="stylesheet" href="<%=path %>/js/themes/insdep/easyui_plus.css">
    <link rel="stylesheet" href="<%=path %>/js/themes/insdep/insdep_theme_default.css">
    <link rel="stylesheet" href="<%=path %>/js/themes/insdep/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.easyui-1.5.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/themes/insdep/jquery.insdep-extend.min.js"></script>
</head>
<body>
<form id="addNews">
    <input type="hidden" name="newsTime" id="newsTime" />
    <input type="hidden" name="newsId" id="newsId" value="${news.newsId}"/>
    <table>
        <tr>
            <td>新闻名称</td>
        </tr>

        <tr>
            <td><input type="text" name="newsName" value="${news.newsName}"/></td>
        </tr>
        <tr>
            <td>新闻描述</td>
        </tr>
        <tr>
            <td><textarea name="newsNeirun" rows="4" cols="26">${news.newsNeirun}</textarea></td>
        </tr>
    </table>

</form>

<script type="text/javascript">
    var ioi = new Date();
    var mytimess = ioi.toLocaleString( );
    $("#newsTime").val(mytimess)
</script>


</body>
</html>
