<%--
  Created by IntelliJ IDEA.
  User: 杜家乐
  Date: 2018-05-14
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <% String path = request.getContextPath(); %>
    <link rel="stylesheet" href="<%=path %>/js/themes/insdep/easyui.css"/>
    <link rel="stylesheet" href="<%=path %>/js/themes/insdep/easyui_animation.css"/>
    <link rel="stylesheet" href="<%=path %>/js/themes/insdep/insdep_theme_default.css">
    <link rel="stylesheet" href="<%=path %>/js/themes/insdep/icon.css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.easyui-1.5.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/themes/insdep/jquery.insdep-extend.min.js"></script>
</head>
<body>
<%--<div  class="easyui-linkbutton" onclick="pljc()" data-options="iconCls:'icon-remove',plain:true">批量检出</div> --%>


<div id="updateDiv"></div>
<div id="newsselect">
    <div id="poidao"></div><!-- 复选框 -->

</div>

<script type="text/javascript">
    $(function(){
        pageUser();
    })
    function pageUser(){
        $('#newsselect').datagrid({
            url:"<%=request.getContextPath()%>/LiuYan/selectsLiuYan.do",
            fitColumns:true,
            striped:true,
            ctrlSelect:true,
            method:"post",
            loadMsg:"数据库加载中。。。。",
            pagination:true,
            pagePosition:"bottom",
            pageNumber:1,
            pageSize:3,
            pageList:[1,3,5,7,10],
            columns:[[
                {field:"check1",title:"选项",width:20,align:'center',
                    formatter: function(value,row,index){
                        return "<input type='checkbox' name='check' value="+row.id+">";
                    }
                },
                {field:'id',title:'编号',width:20,align:'center'},
                {field:'name',title:'留言人',width:100,align:'center'},
                {field:'lycontent',title:'留言内容',width:100,align:'center'},
                {field:'lytime',title:'留言时间',width:100,align:'center'},
                {field:'hfcontent',title:'回复内容',width:200,align:'center'},
                {field:'hftime',title:'回复时间',width:200,align:'center'},
                {field:"button",title:'操作',width:100,align:'center',
                    formatter: function(value,row,index){
                        return "<input type='button'  class='icon-remove' onclick='deleteNews("+row.id+")' value='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'>";
                    }
                }
            ]]

        });
    }

    //删除
    function deleteNews(id){
        var msg = "您真的确定要删除吗？\n\n请确认！";
        if (confirm(msg)==true){
            $.ajax({
                url:"<%=request.getContextPath()%>/LiuYan/deleteLiuYan.do",
                type:"post",
                data:{"id":id},
                dataType:"text",
                async:false,
                success:function(Flag){
                    if(Flag=="success"){
                        $("#newsselect").datagrid("reload");
                    }
                },
                error:function(){
                    alert("删除出错!");
                }
            })
            return true;
        }else{
            return false;
        }
    }
</script>
</body>
</html>
