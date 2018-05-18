<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/14
  Time: 11:05
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
<a id="btn2" href="#" class="easyui-linkbutton" onclick="shua()" data-options="iconCls:'icon-lock'">刷新</a>

<a id="btn3" href="#" class="easyui-linkbutton" onclick="que()" data-options="iconCls:'icon-lock'">确认通过</a>
<a id="btn4" href="#" class="easyui-linkbutton" onclick="chaidanclt()" data-options="iconCls:'icon-lock'">进行拆单</a>
订单号:<input class="easyui-textbox" id="indentcodeclt"  style="width:150px">
订单人:<input class="easyui-textbox"  id="usernameclt" style="width:150px">
<a id="btn5" href="#" class="easyui-linkbutton" onclick="conditionsearch()" data-options="iconCls:'icon-search'">搜索</a>
<div id="indentdataclt"></div>

<div id="dialog_fendanclt" style="width:500px"></div>

<script type="text/javascript">
    $(function(){

        $('#indentdataclt').datagrid({
            url:'<%=request.getContextPath()%>/zzyController/queryDing.do',
            columns:[[
                {field:'',checkbox:true},
                {field:'id',title:'编号',width:100},
                {field:'incode',title:'订单号',width:100},
                {field:'price',title:'金额',width:100},
                {field:'stauts',title:'订单状态',width:100,
                    formatter: function(value,row,index){
                        if (row.stauts==1){
                            return "已确认";
                        } else {
                            return "未确认";
                        }
                    }
                },
                {field:'createtime',title:'创建时间',width:100},

                {field:'userid',title:'订单人ID',width:100},
                {field:'username',title:'订单人用户名',width:100},

            ]]  ,

            fitColumns:true,
            pagination:true,
            pageNumber:1,
            pageSize:3,
            pageList:[3,6,10],
            loadMsg:"数据库加载中。。。。。。。。。。。。。。。。。。",
        });
    })
    function conditionsearch(){
        var aa= $("#indentcodeclt").val()
        var bb= $("#usernameclt").val()

        $('#indentdataclt').datagrid('load',{
            incode: aa,
            username : bb
        });
    }
    function que() {
        var arr = $('#indentdataclt').datagrid("getChecked");
        if (arr.length == 1) {
            var a = arr[0].id
            var b = arr[0].stauts
            if (b == 1) {
                alert("已确认过了")
                return;
            } else {
                if (confirm("确定后无法再次分单,确定么?")) {
                    $.ajax({
                        url: "<%=request.getContextPath()%>/zzyController/updateById.do?id=" + a,
                        type: "post",
                        success: function () {
                            $('#indentdataclt').datagrid("reload");
                        }
                    })
                }
            }

        } else {
            alert("请选择一项数据确认")
        }
    }
    function shua() {
        $('#indentdataclt').datagrid("reload");

    }
</script>
</body>
</html>
