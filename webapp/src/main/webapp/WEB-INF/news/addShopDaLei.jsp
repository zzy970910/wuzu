<%--
  Created by IntelliJ IDEA.
  User: 杜家乐
  Date: 2018-05-16
  Time: 14:08
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
<form id="addShopDaLei">
    <input type="hidden" name="id" id="id" value="${da.id}"/>
    <table>
        <tr>
            <td>名称</td>
        </tr>

        <tr>
            <td><input type="text" name="dname" value="${da.dname}"/></td>
        </tr>
        <tr>
            <td>介绍</td>
        </tr>
        <tr>
            <td><textarea name="beizhu" rows="4" cols="26">${da.beizhu}</textarea></td>
        </tr>
    </table>
</form>
</body>
</html>
