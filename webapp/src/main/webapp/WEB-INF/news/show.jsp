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
<div id="p" class="easyui-panel" title="查询"
     style="width:100%;height:120px;padding:10px;background:#fafafa;"
     data-options="iconCls:'icon-save',closable:true,
                collapsible:true,minimizable:true,maximizable:true">
    <p>关键词:<input type="text" id="newsName" name="newsName">
    <div id="btn" href="#" class="easyui-linkbutton" onclick="pageUser()" data-options="iconCls:'icon-search'">查询</div>
    </p>
</div>

<div  class="easyui-linkbutton" onclick="addwindC()" data-options="iconCls:'icon-add',plain:true">新增</div>
<div  class="easyui-linkbutton" onclick="exportexcels()" data-options="iconCls:'icon-remove',plain:true">导出数据</div>
<%--<div  class="easyui-linkbutton" onclick="daoData()" data-options="iconCls:'icon-remove',plain:true">导出数据</div>--%>


<div id="dialog_add"></div><!--新增-->
<div id="updateDiv"></div>
<div id="dialog_exports"></div><!-- 复选框 -->
<div id="newsselect"></div>

<script type="text/javascript">
    $(function(){
        pageUser();
    })
    function pageUser(){
        $('#newsselect').datagrid({
            url:"<%=request.getContextPath()%>/news/selectsnews.do",
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
            queryParams:{
                "newsName":$("#newsName").val(),
            },
            columns:[[
                {field:"check1",title:"选项",width:20,align:'center',
                    formatter: function(value,row,index){
                        return "<input type='checkbox' name='check' value="+row.newsId+">";
                    }
                },
                {field:'newsId',title:'编号',width:20,align:'center'},
                {field:'newsName',title:'新闻名称',width:100,align:'center'},
                {field:'newsTime',title:'发布时间',width:100,align:'center'},
                {field:'newsNeirun',title:'相应内容',width:200,align:'center'},
                {field:"button",title:'操作',width:100,align:'center',
                    formatter: function(value,row,index){
                        return "<input type='button'  class='icon-remove' onclick='deleteNews("+row.newsId+")' value='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'>&nbsp;&nbsp;&nbsp;<input type='button'  class='icon-edit' onclick='updateNews("+row.newsId+")' value='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'>";
                    }
                }
            ]]
        });
    }
    //新增
    function addwindC(){
        $("#dialog_add").dialog({
            title: '新增用户',
            width: 400,
            height: 300,
            closed: false,
            cache: false,
            href:"<%=request.getContextPath()%>/jump/jumpAddNews.do",
            modal: true ,
            buttons:[{
                text:'保存',
                iconCls:'icon-edit',
                handler:function(){
                    $.ajax({
                        url:'<%=request.getContextPath()%>/news/addNews.do',
                        data:$("#addNews").serialize(),
                        type:"post",
                        success:function(){
                            $("#dialog_add").dialog("close");
                            $("#newsselect").datagrid("reload");
                        },error:function(){
                            $.messager.alert('警告','报错');
                        }
                    })
                }
            }]
        })
    }
    //删除
    function deleteNews(id){
        var msg = "您真的确定要删除吗？\n\n请确认！";
        if (confirm(msg)==true){
            $.ajax({
                url:"<%=request.getContextPath()%>/news/deletenews.do",
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

    //修改
    function updateNews(id){
        $("#updateDiv").dialog({
            title: '修改信息',
            width: 800,
            height: 500,
            closed: false,
            cache: false,
            modal: true,
            href:"<%=request.getContextPath()%>/news/queryNewsById.do?id="+id,
            buttons:[{
                text:'保存',
                handler:function(){
                    $.ajax({
                        url:"<%=request.getContextPath()%>/news/updateNews.do",
                        type:"post",
                        data:$("#addNews").serialize(),
                        dataType:"text",
                        success:function (flag){
                            if(flag=='success'){
                                $('#updateDiv').dialog('close');

                                $("#newsselect").datagrid("reload");
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
    //poi
    function exportexcels(){
        $("#dialog_exports").dialog({
            title: '修改信息',
            width: 800,
            height: 200,
            closed: false,
            cache: false,
            href:"<%=request.getContextPath()%>/jump/topoidaoc.do",
            modal: true ,
            toolbar:[{
                text:'确认导出数据',
                iconCls:'icon-edit',
                handler:function(){

                    var arr = document.getElementsByName("namesse");

                    var array="";
                    for (var i = 0;  i< arr.length; i++) {
                        if(arr[i].checked){
                            array+=arr[i].value+",";

                        }
                    }
                    //alert(arr);
                    location.href="<%=request.getContextPath()%>/news/exportXlsx.do?news="+array;
                    $("#dialog_exports").dialog("close");
                    $("#newsselect").datagrid("reload");

                }
            },{
                text:'取消',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#dialog_export").dialog("close");
                }
            }]
        })
    }
</script>
</body>
</html>
