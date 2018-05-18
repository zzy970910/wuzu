<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/jquery-easyui/themes/icon.css"/>
</head>
<body>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <table id="rizhiwb"></table>
<div id="tbrizhi">
    <div>
        <%--<input type="text" name="clazzName"  id="classname">--%>
        <input type="text" class="Wdate" id="timeStart" name="logtimestart" onClick="WdatePicker()">
        &nbsp;-&nbsp;
        <input type="text" class="Wdate" id="timeEnd" name="logtimeend" onClick="WdatePicker()">
        <a id="searchbtu" href="javascript:rizhisousuo()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索日志</a>
        <a href="javascript:deleterizhi()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除日志</a>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        getdata();
    })
    $("#searchbtu").click(function(){
        getdata();
    })
   function getdata(){
        //加载数据
        $('#rizhiwb').datagrid({
            url:"<%=request.getContextPath()%>/LogController/queryRiZhi.do",
            queryParams: {
                classname:$('#classname').val(),
                timestart:$('#timeStart').val(),
                timeend:$('#timeEnd').val()
            },
            fit:true,
            //按ctrl多选
            ctrlSelect:true,
            //开启分页
            pagination:true,
            //每页条数
            pageSize:20,
            pageList:[20,40,60,80,100],
            //引入工具栏
            toolbar:"#tbrizhi",
            columns:[[
                {field:'x',title:'',checkbox:true},
                {field:'logId',title:'日志id',width:200},
                {field:'tiem',title:'访问时间',width:200},
                {field:'clazzName',title:'类名',width:200},
                {field:'methodName',title:'方法名',width:200},
                {field:'params',title:'参数与参数名',width:500}
            ]],
        });

   };

</script>
<script type="text/javascript">
    function deleterizhi(){
        var temp = "";
        var de = $('#rizhiwb').datagrid("getSelections");
        for (var i = 0; i < de.length; i++) {
            temp+=","+de[i].logId;
        }
        temp = temp.substr(1);
        alert(temp);
        $.ajax({
            url:"<%=request.getContextPath()%>/LogController/deleterizhiwb.?ids="+temp,
            type:"post",
            dataType:"json",
            success:function(aaaa){
                $("#rizhiwb").datagrid("load");
                $.messager.alert("提示","日志删除失败");

            },
            error:function(aaaa){
                $("#rizhiwb").datagrid("load");
                $.messager.alert("提示","日志删除成功");
            }

        });
    }
</script>
</body>
</html>
