<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>批次管理</title>
</head>
<body>


<div data-options="region:'center'" style="padding:5px;">
    <a href="javascript:addGood();" class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true">添加</a>

    <table id="bdidluzhi">
        <thead>
        <tr>
            <th data-options="field:'ww',checkbox:true" align="center"></th>
            <th data-options="field:'id'" align="center" width="15%">批次id</th>
            <th data-options="field:'bname'" align="center" width="15%">批次名称</th>
            <th data-options="field:'  ',formatter:bdidluzhi" align="center" width="12%">操作</th>
        </tr>
        </thead>
    </table>
</div>

<!-- 新增 -->
<div id="xingzeng"></div>
<!-- 修改 -->
<div id="xui"></div>


<script type="text/javascript">
    $("#bdidluzhi").datagrid({
        url:"<%=request.getContextPath()%>/batchController/selectbatch.do",
        pagination:true,
        pageNumber:1,
        pageSize:3,
        pageList:[3,6,9],
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
    function  bdidluzhi(val,row){
        return  "<a  href='javascript:shan("+row.id+")'  class='delete' ></a><a  href='javascript:gaii("+row.id+")'  class='editor' ></a>";
    }


    //新增
    function addGood(){
        $('#xingzeng').dialog({
            title: '新增用户',
            width: 480,
            height:400,
            closed: false,
            cache: false,
            href: '<%=request.getContextPath()%>/tiao/jumpAddBatch.do',
            modal: true ,
            buttons:[{
                text:'增加',
                handler:function() {
                    //biaoqian是form表单的id
                    $("#aa").form('submit', {
                        url:"<%=request.getContextPath()%>/batchController/addBatchList.do",
                        success: function (data) {
                            if (data.success) {
                                $.messager.alert("提示", data.msg);
                                //弹框
                                $('#xingzeng').dialog('close');
                                //数据表格（table）
                                $('#dgbatch').datagrid('load');
                            } else {
                                $('#xingzeng').dialog('close');
                                $('#dgbatch').datagrid('load');
                            }

                        }
                    })
                }
            }]
        });

    }

    /**
     * 单删
     */
    function   shan(ids){
        $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
            if (r){
                $.ajax({
                    url:'<%=request.getContextPath()%>/batchController/deleteBatch.do?id='+ids,
                    type:'get',
                    success:function(result){
                        $("#bdidluzhi").datagrid("reload");
                        alert("删除成功！！！！")
                    }
                })
            }
        });
    }


    //修改
    function   gaii(){
        var pp= $("#dgbatch").datagrid("getSelected");
$    ('#xui').dialog({
            title: '修改员工',
            width: 480,
            height: 400,
            closed: false,
            cache: false,
            href: '<%=request.getContextPath()%>/tiao/jumpUpdateBatch.do',
            modal: true ,
            onLoad:function(){
            },
            buttons:[{
                text:'修改',
                handler:function(){
                    $.ajax({
                        url:"<%=request.getContextPath() %>/batchController/updateBatch.do",
                        type:"post",
                        data:$("#updatebatch").serialize(),
                        success:function(data){
                            $("#bdidluzhi").datagrid("reload");
                            $("#xui").dialog("close");
                        }
                    })
                }
            },{
                text:'取消',
                handler:function(){
                }
            }]
        });

    }






</script>



















</body>
</html>