<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/14
  Time: 18:53
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
<div  class="easyui-linkbutton" onclick="addXiaoLei()" data-options="iconCls:'icon-add',plain:true">新增</div>
<div id="zzy1"></div>
<div id="addxiao"></div><!--新增-->
<div id="updatexiao"></div><!--修改-->
<script type="text/javascript">
    $(function(){
        $('#zzy1').datagrid({
            url:'<%=request.getContextPath()%>/zzyController/queryXiao.do',
            columns:[[
                {field:'',checkbox:true},
                {field:'id',title:'商品id',width:100},
                {field:'name',title:'分类名称',width:100},
                {field:'dname',title:'总类名称',width:100},
                {field:'beizhu',title:'详情',width:100},
                {field:"button",title:'操作',width:100,align:'center',
                    formatter: function(value,row,index){
                        return "<input type='button'  class='icon-remove' onclick='deleteXiao("+row.id+")' value='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'>&nbsp;&nbsp;&nbsp;<input type='button'  class='icon-edit' onclick='updateXiao("+row.id+")' value='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'>";
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
    //新增
    function addXiaoLei(){
        $("#addxiao").dialog({
            title: '新增商品',
            width: 400,
            height: 300,
            closed: false,
            cache: false,
            href:"<%=request.getContextPath()%>/jump/jumpAddShopXiaoLei.do",
            modal: true ,
            buttons:[{
                text:'保存',
                iconCls:'icon-edit',
                handler:function(){
                    $.ajax({
                        url:'<%=request.getContextPath()%>/shoplei/addXiaoLei.do',
                        data:$("#addShopXiaoLei").serialize(),
                        type:"post",
                        success:function(){
                            $("#addxiao").dialog("close");
                            $("#zzy1").datagrid("reload");
                        },error:function(){
                            $.messager.alert('警告','报错');
                        }
                    })
                }
            }]
        })
    }
    //删除
    function deleteXiao(id){
        var msg = "您真的确定要删除吗？\n\n请确认！";
        if (confirm(msg)==true){
            $.ajax({
                url:"<%=request.getContextPath()%>/shoplei/deleteXiaoLei.do",
                type:"post",
                data:{"id":id},
                dataType:"text",
                async:false,
                success:function(Flag){
                    if(Flag=="success"){
                        $("#zzy1").datagrid("reload");
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
    function updateXiao(id){
        $("#updatexiao").dialog({
            title: '修改商品分类',
            width: 800,
            height: 500,
            closed: false,
            cache: false,
            modal: true,
            href:"<%=request.getContextPath()%>/shoplei/queryXiaoById.do?id="+id,
            buttons:[{
                text:'保存',
                handler:function(){
                    $.ajax({
                        url:"<%=request.getContextPath()%>/shoplei/updateXiao.do",
                        type:"post",
                        data:$("#addShopXiaoLei").serialize(),
                        dataType:"text",
                        success:function (flag){
                            if(flag=='success'){
                                $('#updatexiao').dialog('close');

                                $("#zzy1").datagrid("reload");
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
