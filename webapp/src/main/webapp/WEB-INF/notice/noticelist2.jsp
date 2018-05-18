<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>

<body>

 <div id="p" class="easyui-panel" title="搜索"
        style="width:500px;height:80px;padding:10px;background:#fafafa;"
        data-options="iconCls:'icon-search',collapsible:true">
  	关键字：<input id="noticename"> <input type="button" value="搜索" onclick="search()">
</div>
 <div  class="easyui-linkbutton" onclick="exportexcels()" data-options="iconCls:'icon-save',plain:true">导出数据</div>
<table id="dszlist-table" ></table>
<div id="showdsz-div" ></div>
 <!-- poi -->
 <div  id="dialog_exports"></div>
<script type="text/javascript">
    $(function(){
        search()
        $('#addu').bind('click', function(){
            search()
        });
    })

    function search(){
        $('#dszlist-table').datagrid({
            url:'<%=request.getContextPath()%>/notice/querynotice.do',
            queryParams:{noticename:$("#noticename").val()},//条件查询传参
            pagination:true,//开启分页
            pageNumber:1,//初始化页码
            pageSize:3,//每页条数
            pageList:[3,5,8,10],
            checkOnSelect:false,
            selectOnCheck:false,
            singleSelect:true,
            columns:[[
                //field:尽可能对应实体类中的属性名，必须保证唯一性    title：列标题   width：每列宽度
                {field:'che',checkbox:true},
                {field:'noticeid',title:'编号',width:"20%"},
                {field:'noticename',title:'公告名称',width:"20%"},
                {field:'noticedate',title:'创建时间',width:"20%"},
                {field:'noticebulletin',title:'公告内容',width:"20%"} ,
                {field:'act',title:'操作',width:"15%",
                    formatter: function(value,row,index){
                        //console.info(row.dailiid);
                        //alert(row.jueseid);
                        return "<input type='button' class='icon-remove'   style='width:30px; height:30px; border:1px ;' onclick='delnotice("+row.noticeid+")'><input type='button' class='icon-edit' style='width:30px; height:30px; border:1px ;' onclick='updatenotice("+row.noticeid+")'>";
                    }
                } ,
            ]], //新增
            toolbar: [{
                iconCls: 'icon-add',
                handler: function(){
                    $('#showdsz-div').dialog({
                        title: '添加',
                        width: 400,
                        height: 400,
                        closed: false,
                        href: '<%=request.getContextPath()%>/notice/toaddnoticelist.do',
                        modal: true,
                        buttons:[{
                            text:'保存',
                            handler:function(){
                                $('#gonggao').form('submit', {
                                    url:"<%=request.getContextPath()%>/notice/addnotice.do",
                                    type:"post",
                                    data:$("#gonggao").serialize(),
                                    dataType:"text",
                                    onSubmit: function(){
                                        return $('#gonggao').form('validate');
                                    },
                                    success:function(){
                                        $.messager.show({
                                            title:'提示消息',
                                            msg:'新增成功',
                                            timeout:2000,
                                            showType:'slide',
                                            style:{
                                            }
                                        });
                                        $('#showdsz-div').dialog("close");
                                        $('#dszlist-table').datagrid('reload')
                                    }
                                });
                            }
                        },{
                            text:'关闭',
                            handler:function(){
                                $('#showdsz-div').dialog("close");
                            }
                        }]
                    });
                }
            }
                ,'-',{//批量删
                    iconCls: 'icon-remove',
                    handler: function(){


// 					获取被选中的选项
                        var colArr = $('#dszlist-table').datagrid('getChecked');
                        if(colArr.length<1){
                            $.messager.alert('重要提示！！！','至少选择一个进行删除','warning');
// 						return false 时 函数不再继续执行
                            return false;
                        }
                        var idsStr = "";
                        for(var i=0;i<colArr.length;i++){
                            idsStr += ","+colArr[i].noticeid;
                        }
                        idss = idsStr.substring(1);
                        $.ajax({
                            url:"<%=request.getContextPath()%>/notice/deleteall.do?ids="+idss,
                            success:function(msg){

                                $.messager.show({
                                    title:'提示消息',
                                    msg:'已成功删除'+colArr.length+'条数据',
                                    timeout:2000,
                                    showType:'slide',
                                });
                                $('#dszlist-table').datagrid('load');
                            }
                        })
                    }
                }
            ],
        });
    }


    function delnotice(noticeid){
        $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
            if (r){

                $.ajax({
                    url:"<%=request.getContextPath()%>/notice/deletenotice.do",
                    type:"post",
                    data:{"noticeid":noticeid},
                    dataType:"text",
                    success:function (daleteflag){

                        if(daleteflag=="deleteSuccess"){

                            $.messager.show({
                                title:'提示消息',
                                msg:'删除成功',
                                timeout:2000,
                                showType:'slide',
                                style:{}

                            });
                            $('#showdsz-div').dialog("close");
                            $('#dszlist-table').datagrid('reload');
                            /*  window.location.reload(); */
                        }

                    },
                    error:function (){
                        alert("删除程序出错");
                    }

                })
            }
        })
    }
    //修改
    function updatenotice(noticeid){
        $('#showdsz-div').dialog({
            title: '修改',
            width: 400,
            height: 400,
            closed: false,
            href: '<%=request.getContextPath()%>/notice/querynoticeById.do?noticeid='+noticeid,
            modal: true,
            buttons:[{
                text:'保存',
                handler:function(){
                    $('#updatenotice').form('submit', {
                        url:"<%=request.getContextPath()%>/notice/updatenotice.do",
                        success:function(){
                            $.messager.show({
                                title:'提示消息',
                                msg:'修改成功',
                                timeout:2000,
                                showType:'slide',
                                style:{
                                }
                            });
                            $('#showdsz-div').dialog("close");
                            $('#dszlist-table').datagrid('reload')
                        }
                    });
                }
            },{
                text:'关闭',
                handler:function(){
                    $('#showdsz-div').dialog("close");
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
            href:"<%=request.getContextPath()%>/notice/topoidaoc.do",
            modal: true ,
            toolbar:[{
                text:'确认导出数据',
                iconCls:'icon-edit',
                handler:function(){
                    //var names =$("#exportform").serialize();
                    //
                    var arr = document.getElementsByName("namesse");
                    //alert(arr.length)
                    var array="";
                    for (var i = 0;  i< arr.length; i++) {
                        if(arr[i].checked){
                            array+=arr[i].value+",";
                            //alert(arr[i].value)
                        }
                    }
                    //alert(arr);
                    location.href="<%=request.getContextPath()%>/notice/exportXlsx.do?gonggao="+array;
                    $("#dialog_exports").dialog("close");
                    $("#biaodanid1").datagrid("reload");

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
