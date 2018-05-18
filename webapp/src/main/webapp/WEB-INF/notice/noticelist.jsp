<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <jsp:include page="bao.jsp"  flush="true"></jsp:include>
</head>
<body   class="easyui-layout">
<div id="p" class="easyui-panel" title="搜索"
     style="width:500px;height:150px;padding:10px;background:#fafafa;"
     data-options="iconCls:'icon-search',collapsible:true">
    关键字：<input id="noticename"> <input type="button" value="搜索" onclick="search()">
</div>
<div data-options="region:'center'" style="padding:5px;">
    <a href="javascript:addGoods();" class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true">添加</a> <a
        href="javascript:addshan();" class="easyui-linkbutton"
        data-options="iconCls:'icon-remove',plain:true">批删</a>
    <div  class="easyui-linkbutton" onclick="exportexcels()" data-options="iconCls:'icon-save',plain:true">导出数据</div>
    <table id="biaodanid1">
        <thead>
        <tr>
            <th data-options="field:'ww',checkbox:true" align="center"></th>
            <th data-options="field:'noticeid'" align="center" width="15%">编号</th>
            <th data-options="field:'noticename'" align="center" width="15%">公告名称</th>
            <th data-options="field:'noticedate'" align="center" width="15%">创建时间</th>
            <th data-options="field:'noticebulletin'" align="center" width="15%">公告内容</th>
            <th data-options="field:'  ',formatter:biaodanid1" align="center" width="12%">操作</th>
        </tr>
        </thead>
    </table>
</div>
<!-- 新增 -->
<div id="dd">
</div>
<!-- 修改 -->
<div  id="qwwe">
</div>
<!-- poi -->
<div  id="dialog_exports">
</div>
<script type="text/javascript">
    $("#biaodanid1").datagrid({
        url:"<%=request.getContextPath()%>/notice/querynotice.do",
        pagination:true,
        pageNumber:1,
        pageSize:3,
        pageList:[3,6,9],
        queryParams: {
            noticename: $('[name="noticename"]').val()
        },
        singleSelect:false,
        checkOnSelect:false,
        onLoadSuccess:function(){
            $('.delete').linkbutton({
                iconCls: 'icon-remove',
                plain:true
            });
            $('.editor').linkbutton({
                iconCls: 'icon-edit',
                plain:true
            });
        }
    });
    function daochu(){
        $.ajax({
            url:"<%=request.getContextPath()%>/poiAction!ExceportExcel.action",
            type:"post",
            dataType:"json",
            success:function(data){

            },error:function(){
                alert("报错");
            }

        })


    }
    function  biaodanid1(val,row){
        return  "<a  href='javascript:delnotice("+row.noticeid+")'  class='delete' ></a><a  href='javascript:updateButton("+row.noticeid+")'  class='editor' ></a>";
    }

    function addGoods(){
        $('#dd').dialog({
            title: '增加公告',
            width: 480,
            height:400,
            closed: false,
            cache: false,
            href: 'notice/addnoticelist.jsp',
            modal: true ,
            buttons:[{
                text:'增加',
                handler:function(){
                    alert("添加成功")
                    $.ajax({
                        url:"<%=request.getContextPath()%>/notice/addnotice",
                        type:"post",
                        data:$("#gonggao").serialize(),
                        success:function(result){
                            $("#biaodanid1").datagrid("reload");
                            $("#dd").dialog("close");
                        }
                    })
                }
            },{
                text:'取消',
                handler:function(){
                    $("#dd").dialog("close");
                }
            }]
        });

    }
    function delnotice(noticeid){
        $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
            if (r){

                $.ajax({
                    url:"<%=request.getContextPath()%>/notice/deletenotice",
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
                            $("#biaodanid1").datagrid("reload");
                            $("#dd").dialog("close");
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
    function updateButton(noticeid){
        $('#dd').dialog({
            title: '修改',
            width: 400,
            height: 400,
            closed: false,

            href: '<%=request.getContextPath()%>/notice/querynoticeById?noticeid='+noticeid,
            modal: true,
            buttons:[{
                text:'保存',
                handler:function(){
                    $('#updatenotice').form('submit', {
                        url:"<%=request.getContextPath()%>/notice/updatenotice",
                        success:function(){
                            $.messager.show({
                                title:'提示消息',
                                msg:'修改成功',
                                timeout:2000,
                                showType:'slide',
                                style:{
                                }
                            });
                            $("#biaodanid1").datagrid("reload");
                            $("#dd").dialog("close");
                        }
                    });
                }
            },{
                text:'关闭',
                handler:function(){
                    $('#dd').dialog("close");
                }
            }]
        });
    }
    //批量删
    function   addshan(){
        var sss= $("#biaodanid1").datagrid("getSelections");
        var biaodanid1a= "";
        for (var i = 0; i < sss.length; i++) {
            biaodanid1a += ","+sss[i].noticeid
        }
        var str1=biaodanid1a.substring(1);
        $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
            if (r){
                $.ajax({
                    url:'<%=request.getContextPath()%>/notice/deleteall',
                    data:{'ids':str1},
                    type:'post',
                    success:function(result){
                        $("#biaodanid1").datagrid("reload");
                        alert("删除成功！！！！")
                    }
                })
            }
        });
    }
    var  add="";
    var  ccc="";
    //条件查
    function  cha(){
        $('#biaodanid1').datagrid({
            queryParams: {
                noticename: $('[name="noticename"]').val(),
                ccc:ccc,
                add:add,
            }
        });
        $('#biaodanid1').datagrid("load");
    }
    //poi
    function exportexcels(){
        $("#dialog_exports").dialog({
            title: '修改信息',
            width: 800,
            height: 200,
            closed: false,
            cache: false,
            href:"<%=request.getContextPath()%>/notice/poidaoc.jsp",
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
                    location.href="<%=request.getContextPath()%>/notice/exceportExcela?gonggao="+array;
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