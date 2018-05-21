<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/15
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="assets/lib/jquery/jquery-1.11.0.js"></script>
<script src="assets/lib/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" href="js/boot/bootstrap-dialog/dist/css/bootstrap-dialog.css" >
<script type="text/javascript" src="js/boot/bootstrap-dialog/dist/js/bootstrap-dialog.js"></script>
<style>
    html,body{
        height: 100%;
        font-size: 15px;
        color: black;
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        user-select:none;
        -webkit-user-select: none;/*?????????????е?????*/
    }
    .tb{
        width: 810px;
        border: 3px solid #DDDDDD;
        border-radius: 15px;
        box-shadow: 2px 3px 5px #DDDDDD;
    }
    .tb tr{
        background: #F0F0E1;
        height: 30px;
    }
    .tb tr td{
        border: 1.5px solid #FFFFFF;
        text-align: center;

    }
    .tb tr th{
        border: 1.5px solid #FFFFFF;
        background: #888888;
        color: white;
        border-top:none;
    }
    .tb tr th:nth-child(1){
        border-top-left-radius:15px;
        border-left: none;
        border-top:none;
    }
    .tb tr th:last-child{
        border-top-right-radius:15px;
        border-right: none;
    }
    .tb tr:nth-child(1){

        background:#99B3FF;

    }
    .tb tr:nth-child(2n+1){
        background:#DDDDDD;
    }
    .tb tr:hover{
        background:#DDDDDD;
        opacity: 0.6;

    }
    .tb tr:nth-child(1):hover{
        border: 1.5px solid #FFFFFF;
        opacity: 1;
    }
    .tb tr:last-child td:nth-child(1){

        border-bottom-left-radius:15px;
    }
    .tb tr:last-child td:last-child{

        border-bottom-right-radius:15px;
    }
</style>
<body>

<center>
    <table border="1" class="tb">
        <tr>
            <td>新闻名称</td>
            <td>${xinwen.newsName}</td>
            <td>创建时间</td>
            <td>${xinwen.newsTime}</td>
        </tr>
        <tr>
            <td  colspan="4"style="height:300px">${xinwen.newsNeirun}</td>

        </tr>
    </table>
</center>
</body>
</html>
