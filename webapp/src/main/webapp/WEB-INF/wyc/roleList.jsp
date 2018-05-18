<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>

<!-- 语言 -->
<body>
<%--<div id="p" class="easyui-panel" title="搜索"--%>
     <%--style="width:100%;height:80px;padding:10px;background:whitesmoke;"--%>
     <%--data-options="iconCls:'icon-search',collapsible:true">--%>
    <%--关键字：<input id="name"> <input type="button" value="搜索" onclick="search()">--%>
<%--</div>--%>
<table id="dg">
    <%--<div id="tbb">--%>
        <%--<div  class="easyui-linkbutton" onclick="addRole()" data-options="iconCls:'icon-add',plain:true">新增</div>--%>
        <%--<div  class="easyui-linkbutton" onclick="deleteRole()" data-options="iconCls:'icon-remove',plain:true">删除</div>--%>
        <%--&lt;%&ndash;<div  class="easyui-linkbutton" onclick="updateUser()"  data-options="iconCls:'icon-edit',plain:true">修改</div>&ndash;%&gt;--%>
        <%--<div  class="easyui-linkbutton" onclick="daochuUserInfo()"  data-options="iconCls:'icon-save',plain:true">导出数据</div>--%>


    <%--</div>--%>
</table>
<%--<table id="dg"></table>--%>

<div id="hjhj"></div>


<script type="text/javascript">
    $(function(){
        search()

    })
    function search() {
        $('#dg').datagrid({
            url: '<%=request.getContextPath()%>/role/roleList.do',
//            queryParams: {name: $("#name").val()},
            fitColumns: true,
            pagination: true,
            singleSelect: true,
            pageNumber: 1,
            pageSize: 3,
            pageList: [3, 6, 9, 12],
            columns: [[

                {field: 'id', title: '角色ID', width: 300, align: 'center'},
                {field: 'name', title: '角色名称', width: 300, align: 'center'},
                {field: 'description', title: '角色描述', width: 300, align: 'center'},
                {
                    field: '  ', title: '操作', width: 400, align: 'center',
                    formatter: function (value, row, index) {
                        return "<button  onclick='dell(" + row.id + ")'>分配权限</button>";
                    }
                }

            ]]
        });
    }
    function  dell   (id){
        $('#hjhj').dialog({
            title: '分配权限',
            width: 400,
            height: 400,
            closed: false,
            cache: false,
          //  href: '/wyc/addrolemenu.jsp',   queryaddrolemenu
            href: '<%=request.getContextPath()%>/role/queryaddrolemenu.do',
            modal: true ,
            buttons:[{
                text:'新增',
                handler:function(){
                    var node=$("#roletree").tree("getChecked");
                    var ids ="";
                    for (var i = 0; i < node.length; i++) {
                        ids+=","+node[i].id;
                    }
                    idss=ids.substring(1);

//                    alert(idss)
                    $.ajax({
                        url:"<%=request.getContextPath()%>/role/updaterolemenulist.do",
                        type:"post",
                        data:{"ids":idss,"roid":id},
                        success:function(result){
                            $('#hjhj').dialog("close");
                            $('#dg').datagrid('reload')
                        }

                    })
                }
            },{
                text:'取消',
                handler:function(){
                    $("#hjhj").dialog("close")
                }
            }]
        });
    }




</script>

</body>
</html>