<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/14
  Time: 16:26
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
<body><script type="text/javascript" src="<%=request.getContextPath()%>/js/uploadify/jquery.uploadify.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/uploadify/uploadify.css"/>
<div>
    <form id="ff" >
        <div>

            商品名称:<input class="easyui-textbox" name="sname" id="sname" style="width:200px">
            <div id="btn" href="#" class="easyui-linkbutton" onclick="hereSelect()" data-options="iconCls:'icon-search'">查询</div>
        </div>
    </form>

</div>
<div  class="easyui-linkbutton" onclick="addShop()" data-options="iconCls:'icon-add',plain:true">新增</div>
<div  class="easyui-linkbutton" onclick="deleteShop()" data-options="iconCls:'icon-remove',plain:true">批量删除</div>
<div  class="easyui-linkbutton" onclick="hot()" data-options="iconCls:'icon-redo',plain:true">设为热卖</div>
<div  class="easyui-linkbutton" onclick="tejia()" data-options="iconCls:'icon-redo',plain:true">设为特价</div>
<div  class="easyui-linkbutton" onclick="kucunxingqinga()" data-options="iconCls:'icon-sum',plain:true">库存详情</div>
<div  class="easyui-linkbutton" onclick="miaosha()" data-options="iconCls:'icon-filter',plain:true">添加秒杀</div>
<div  class="easyui-linkbutton" onclick="exportexcel()" data-options="iconCls:'icon-save',plain:true">导出数据</div>

<div id="addShop"></div>
<div id="zzy1"></div>


<script type="text/javascript">
    $(function(){
        $('#zzy1').datagrid({
            url:'<%=request.getContextPath()%>/zzyController/queryShang.do',
            columns:[[
                {field:'',checkbox:true},
                {field:'id',title:'商品id',width:100},
                {field:'sname',title:'商品名称',width:100},
                {field:'price',title:'金额',width:100},
                {field:'kucun',title:'库存',width:100},
                {field:'dname',title:'所属总类',width:100},
                {field:'name',title:'所属分类',width:100},
                {field:'pasttime',title:'过期时间',width:100},
                {field:'image',title:'图片',width:60,
                    formatter: function(value,row,index){
                        return "<img  src='"+row.image+"' class='img-rounded' width='105px' height='74px'>";
                    }
                },
                {field:'rid',title:'是否热卖',width:100,
                    formatter: function(value,row,index){
                        if (row.rid==1){
                            return "是";
                        } else {
                            return "否";
                        }
                    }
                },
                {field:'tid',title:'是否特价',width:100,
                    formatter: function(value,row,index){
                        if (row.tid==1){
                            return "是";
                        } else {
                            return "否";
                        }
                    }
                },
                {field:'mid',title:'是否秒杀',width:100,
                    formatter: function(value,row,index){
                        if (row.mid=1){
                            return "是";
                        } else {
                            return "否";
                        }
                    }
                },
            ]]  ,

            fitColumns:true,
            pagination:true,
            pageNumber:1,
            pageSize:3,
            pageList:[3,6,10],
           toolbar:"#ff",
            loadMsg:"数据库加载中。。。。。。。。。。。。。。。。。。",
        });
    })
</script>
<script>
    function hereSelect(){
        //alert(123)
        $('#zzy1').datagrid('load', {
            sname:$("#sname").textbox('getValue'),
        });

        //alert(pcid);
        //alert(sname);

    }
    function addShop(){

        $('#addShop').dialog({
            title: '新增商品',
            width: 300,
            height: 300,
            closed: false,
            cache: false,
            modal: true,
            href:"<%=request.getContextPath()%>/jump/toAddShop.do",
            buttons:[{
                text:'保存',
                handler:function(){

                    $.ajax({
                        url:"<%=request.getContextPath()%>/echartsController/addShop.do",
                        type:"post",
                        data:new FormData($("#addShopForm")[0]),
                        dataType:"text",
                        processData : false,
                        contentType : false,
                        success:function (addFlag){
                            if(addFlag == "1"){
                                alert("新增成功!");
                                $('#addShop').dialog('close',true);
                                $('#zzy1').datagrid('reload');
                            }else{
                                alert("失败");
                                $('#addShop').dialog('close',true);
                                $('#zzy1').datagrid('reload');
                            }
                        },
                        error:function (){
                            alert("新增出错");
                        }

                    })
                }
            }]
        });
    }
    function deleteShop() {

        var arr = $('#zzy1').datagrid("getSelections");
        if(arr.length == 0){
            alert("你没与选择")
            return false;
        }
        var strid = "";
        $.each(arr,function(){
            strid += ","+this.id;
        })
        strid = strid.substr(1);
        $.ajax({

            url:"<%=request.getContextPath()%>/echartsController/deleteShop.do",
            data:{"strid":strid},
            dataType:"text",
            type:"post",
            async:false,
            success:function(succ){
                if (succ == "1"){
                    alert("删除成功")
                    $('#zzy1').datagrid('reload');
                }
            },
            error:function(){
                alert("服务器故障")
            }

        })
    }
</script>
<script>
    function tejia(){
        var id=$("#zzy1").datagrid("getSelections");
        //alert(id[0].id)
        $.ajax({
            url:"<%=request.getContextPath()%>/zzyController/updatetejia.do",
            data:{"id":id[0].id},
            type:"post",
            success:function(){
                $("#zzy1").datagrid("reload");
            },error:function(){
                $.messager.alert('警告','报错');
            }
        })

    }
    function miaosha() {
        var id=$("#zzy1").datagrid("getSelections");
        //alert(id[0].id)
        alert(id[0].id)
        if(id.length != 1){
            $.messager.alert('警告','请选择要设置的一项');
        }else{
            $("#addShop").dialog({
                title: '修改信息',
                width: 400,
                height: 200,
                closed: false,
                cache: false,

                href:"<%=request.getContextPath()%>/zzyController/selectmiaosha.do?miaosha="+id[0].id,
                modal: true ,
                toolbar:[{
                    text:'添加',
                    iconCls:'icon-edit',
                    handler:function(){
                        //alert($("#add_form").serialize());
                        $.ajax({
                            url:"<%=request.getContextPath()%>/zzyController/addShop.do",
                            data:$("#miaoshaform").serialize(),
                            type:"post",
                            success:function(){
                                alert("添加成功成功")
                                $("#addShop").dialog("close");
                                $("#zzy1").datagrid("reload");

                            },error:function(){
                                $.messager.alert('警告','报错');
                            }
                        })

                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $("#dialog_maosha").dialog("close");
                    }
                }]
            })
        }
    }


</script>
</body>
</html>
