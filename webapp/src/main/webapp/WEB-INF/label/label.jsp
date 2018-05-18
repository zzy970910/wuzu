<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>


</head>
<body   class="easyui-layout">
<div data-options="region:'center'" style="padding:5px;">
    <a href="javascript:addGood();" class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true">添加</a>

    <table id="bdidluzhi">
        <thead>
        <tr>
            <th data-options="field:'ww',checkbox:true" align="center"></th>
            <th data-options="field:'labelid'" align="center" width="15%">编号</th>
            <th data-options="field:'labelname'" align="center" width="15%">标签名称</th>
            <th data-options="field:'labeladdress'" align="center" width="15%">标签地址</th>
            <th data-options="field:'  ',formatter:bdidluzhi" align="center" width="12%">操作</th>
        </tr>
        </thead>
    </table>
</div>
<!-- 新增 -->
<div   id="xinzeng">
</div>
<!-- 修改 -->
<div  id="xiugai">
</div>
<script type="text/javascript">
    $("#bdidluzhi").datagrid({
        url:"<%=request.getContextPath()%>/labelController/selectlabel.do",
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
        return  "<a  href='javascript:shan("+row.labelid+")'  class='delete' ></a><a  href='javascript:gaii("+row.labelid+")'  class='editor' ></a>";
    }


    function addGood(){
        $('#xinzeng').dialog({
            title: '添加标签',
            width: 480,
            height:400,
            closed: false,
            cache: false,
            href: '<%=request.getContextPath()%>/tiao/jumpAddLabel.do',
            modal: true ,
            buttons:[{
                text:'增加',
                handler:function() {
                    //biaoqian是form表单的id
                    $("#biaoqian").form('submit', {
                        url:"<%=request.getContextPath()%>/labelController/addLabel.do",
                        success: function (data) {
                            if (data.success) {
                                $.messager.alert("提示", data.msg);
                                //弹框
                                $('#xinzeng').dialog('close');
                                //数据表格（table）
                                $('#bdidluzhi').datagrid('load');
                            } else {
                                $('#xinzeng').dialog('close');
                                $('#bdidluzhi').datagrid('load');
                            }

                        }
                    })
                   }
                }]
        });

    }
    // url:"<%=request.getContextPath() %>/labelController/updateLabel.do",
    function   gaii(){
        var pp= $("#bdidluzhi").datagrid("getSelected");
        $('#xiugai').dialog({
            title: '修改员工',
            width: 480,
            height: 400,
            closed: false,
            cache: false,
            href: '<%=request.getContextPath()%>/tiao/jumpUpdateLabel.do',
            modal: true ,
            onLoad:function(){
            },
            buttons:[{
                text:'修改',
                handler:function(){
                    $.ajax({
                        url:"<%=request.getContextPath() %>/labelController/updateLabel.do",
                        type:"post",
                        data:$("#fdc").serialize(),
                        success:function(data){
                            $("#bdidluzhi").datagrid("reload");
                            $("#xiugai").dialog("close");
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
    /**
     * 单删
     */
    function   shan(id){
        $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
            if (r){
                $.ajax({
                    url:'<%=request.getContextPath()%>/labelController/deleteLabel.do?labelid='+id,
                    type:'get',
                    success:function(result){
                        $("#bdidluzhi").datagrid("reload");
                        alert("删除成功！！！！")
                    }
                })
            }
        });
    }
    //批量删
    function   addshan(){
        var sss= $("#bdidluzhi").datagrid("getSelections");
        var bdidluzhia= "";
        for (var i = 0; i < sss.length; i++) {
            bdidluzhia += ","+sss[i].labelid
        }
        var str1=bdidluzhia.substring(1);
        $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
            if (r){
                $.ajax({
                    url:'<%=request.getContextPath()%>/labelaction!deletelabellist2.action',
                    data:{'ll':str1},
                    type:'post',
                    success:function(result){
                        $("#bdidluzhi").datagrid("reload");
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
        $('#bdidluzhi').datagrid({
            queryParams: {
                noticename: $('[name="noticename"]').val(),
                ccc:ccc,
                add:add,
            }
        });
        $('#bdidluzhi').datagrid("load");
    }



</script>


</body>
</html>