<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/14
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery-easyui/themes/ui-sunny/easyui.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery-easyui/themes/icon.css"/>
<body>

<div  class="easyui-linkbutton" onclick="addDaLei()" data-options="iconCls:'icon-add',plain:true">新增</div>
<table id="tabs"></table>
<div id="dialog_add"></div><!--新增-->
<div id="updateDiv"></div><!--修改-->
<script type="text/javascript">
    $(function(){
        $('#tabs').datagrid({
            url:'<%=request.getContextPath()%>/zzyController/queryDalei.do',
            columns:[[
                {field:'',checkbox:true},
                {field:'id',title:'id',width:100},
                {field:'dname',title:'名称',width:100},
                {field:'beizhu',title:'介绍',width:100},
                {field:"button",title:'操作',width:100,align:'center',
                    formatter: function(value,row,index){
                        return "<input type='button'  class='icon-remove' onclick='deleteDa("+row.id+")' value='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'>&nbsp;&nbsp;&nbsp;<input type='button'  class='icon-edit' onclick='updateDa("+row.id+")' value='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'>";
                    }
                }
            ]]  ,

            fitColumns:true,
            pagination:true,
            pageNumber:1,
            pageSize:3,
            pageList:[3,6,10],
            loadMsg:"数据库加载中。。。。。。。。。。。。。。。。。。",
        });
    })
    function addDaLei(){
        $("#dialog_add").dialog({
            title: '新增商品',
            width: 400,
            height: 300,
            closed: false,
            cache: false,
            href:"<%=request.getContextPath()%>/jump/jumpAddShopDaLei.do",
            modal: true ,
            buttons:[{
                text:'保存',
                iconCls:'icon-edit',
                handler:function(){
                    $.ajax({
                        url:'<%=request.getContextPath()%>/shoplei/addDaLei.do',
                        data:$("#addShopDaLei").serialize(),
                        type:"post",
                        success:function(){
                            $("#dialog_add").dialog("close");
                            $("#tabs").datagrid("reload");
                        },error:function(){
                            $.messager.alert('警告','报错');
                        }
                    })
                }
            }]
        })
    }
    //删除
    function deleteDa(id){
        var msg = "您真的确定要删除吗？\n\n请确认！";
        if (confirm(msg)==true){
            $.ajax({
                url:"<%=request.getContextPath()%>/shoplei/deleteDaLei.do",
                type:"post",
                data:{"id":id},
                dataType:"text",
                async:false,
                success:function(Flag){
                    if(Flag=="success"){
                        $("#tabs").datagrid("reload");
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
    //修改
    function updateDa(id){
        $("#updateDiv").dialog({
            title: '修改商品分类',
            width: 800,
            height: 500,
            closed: false,
            cache: false,
            modal: true,
            href:"<%=request.getContextPath()%>/shoplei/queryDaById.do?id="+id,
            buttons:[{
                text:'保存',
                handler:function(){
                    $.ajax({
                        url:"<%=request.getContextPath()%>/shoplei/updateDa.do",
                        type:"post",
                        data:$("#addShopDaLei").serialize(),
                        dataType:"text",
                        success:function (flag){
                            if(flag=='success'){
                                $('#updateDiv').dialog('close');

                                $("#tabs").datagrid("reload");
                            }
                        },
                        error:function (){
                            alert("修改出错");
                        }
                    })
                }
            }]
        });
    }

</script>
</body>
</html>
