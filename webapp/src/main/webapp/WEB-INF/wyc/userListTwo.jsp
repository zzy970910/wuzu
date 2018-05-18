<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery-easyui/themes/ui-pepper-grinder/easyui.css"/>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery-easyui/themes/icon.css"/>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>

</head>

<%--<script type="text/javascript" src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>--%>
<body>
<div id="p" class="easyui-panel" title="搜索"
	 style="width:100%;height:80px;padding:10px;background:whitesmoke;"
	 data-options="iconCls:'icon-search',collapsible:true">
	关键字：<input id="user"> <input type="button" value="搜索" onclick="search()">
</div>
<table id="dguser">
	<div id="tbb">
		<div  class="easyui-linkbutton" onclick="addUser()" data-options="iconCls:'icon-add',plain:true">新增</div>
		<div  class="easyui-linkbutton" onclick="deleteUsers()" data-options="iconCls:'icon-remove',plain:true">删除</div>
		<%--<div  class="easyui-linkbutton" onclick="updateUser()"  data-options="iconCls:'icon-edit',plain:true">修改</div>--%>
		<div  class="easyui-linkbutton" onclick="daochuUserInfo()"  data-options="iconCls:'icon-save',plain:true">导出数据</div>


	</div>
</table>

<div id="dialog_addqx"></div>
<div id="dialog_add"></div>
<div id="dialog_update"></div>
<div id="dialog_addRole"></div>
<div id="dialog_daochu_user"></div>

<script type="text/javascript">

$(function(){
    search()

})
	function search(){
        $('#dguser').datagrid({
            url:'<%=request.getContextPath()%>/userController/queryUserPage.do',
            queryParams:{username:$("#user").val()},
            fitColumns:true,
            striped:true,
            ctrlSelect:true,
            method:"post",
            loadMsg:"数据库加载中。。。。。。。。。。。。。。。。。。",
            pagination:true,
            pagePosition:"bottom",
            pageNumber:1,
            pageSize:3,
            pageList:[1,3,5,7,10],

            columns:[[
                //field:尽可能对应实体类中的属性名，必须保证唯一性    title：列标题   width：每列宽度
                {field:'che',checkbox:true},
                {field:'userid',title:'用户编号',width:300},
                {field:'username',title:'用户姓名',width:300},
                {field:'age',title:'用户年龄',width:300},
                {field:'birday',title:'用户日期',width:300},
                {field:'telphone',title:'电话',width:300},
				/*  {field:'userpwd',title:'用户密码',width:100},
				 {field:'userflag',title:'排序',width:100},
				 {field:'deptid',title:'用户部门',width:100}, */
                {field:'  ',title:'操作',width:300,

                    formatter: function(value,row,index){
                        return   "<button  onclick='addRole("+row.userid+")'>分配角色</button>";

                    }
                },
            ]]

        });

    }

    function addUser(){
        $("#dialog_add").dialog({
            title: '新增用户',
            width: 400,
            height: 300,
            closed: false,
            cache: false,
            href: '<%=request.getContextPath()%>/userController/toAdd.do',
            modal: true ,
            toolbar:[{
                text:'保存',
                iconCls:'icon-edit',
                handler:function(){
                    //alert($("#add_form").serialize());
                    $.ajax({
                        url:"<%=request.getContextPath()%>/userController/addUser.do",
                        data:$("#add-form").serialize(),
                        type:"post",
                        dataType:"text",
                        success:function(){
                            $("#dialog_add").dialog("close");
                            $("#dguser").datagrid("reload");

                        },error:function(){
                            $.messager.alert('警告','报错');
                        }
                    })

                }
            },{
                text:'取消',
                iconCls:'icon-cancel',
                handler:function(){
                    $("#dialog_add").dialog("close");
                }
            }]
        })
    }

    function deleteUsers(){
        var colArr = $('#dguser').datagrid('getChecked');

        if(colArr.length<1){
            $.messager.alert('重要提示！！！','至少选择一个进行删除','warning');
// 						return false 时 函数不再继续执行
            return false;
        }
        var idsStr = "";
        for(var i=0;i<colArr.length;i++){
            idsStr += ","+colArr[i].userid;
        }
        idsStr = idsStr.substring(1);
        $.ajax({
            url:"<%=request.getContextPath()%>/userController/delUsers?ids="+idsStr,
            type:"post",
            dataType:"text",
            success:function(data){
                if(data=="success"){
                    $.messager.alert('提示','删除成功');
				}
                $("#dguser").datagrid("reload");

            },
			//有BUG
			error:function(){
                $.messager.alert('提示','删除成功');
                $("#dguser").datagrid("reload");

			}
        })
    }

function addRole(userid){
// 	    	alert(userid)
    $("#dialog_addRole").dialog({
        title: '分配角色',
        width: 400,
        height: 200,
        closed: false,
        cache: false,
        href:"<%=request.getContextPath()%>/roleController/toRole.do?userId="+userid,
        modal: true ,
        toolbar:[{
            text:'保存',
            iconCls:'icon-edit',
            handler:function(){
                var data=$("#role_add").serialize();
                $.ajax({
                    url:"<%=request.getContextPath()%>/roleController/addRoleUserRelation.do",
                    data:data+"&userId="+userid,
//                        dataType:"json",
                    type:"post",
                    success:function(data){
                        $.messager.alert('提示','分配角色成功');
                        $("#dialog_addRole").dialog("close");

                    },error:function(){
                        $.messager.alert('警告','报错');
                    }
                })

            }
        },{
            text:'取消',
            iconCls:'icon-cancel',
            handler:function(){
                $("#dialog_add").dialog("close");
            }
        }]
    })
}

<%--function updateUser(){--%>
    <%--var ids=$("#dguser").datagrid("getSelections");--%>
    <%--// alert(ids)--%>
    	<%--alert(ids[0].id)--%>

    <%--if(ids.length !=1){--%>
        <%--$.messager.alert('警告','修改要选择一项');--%>

    <%--}else{--%>
        <%--//alert(ids[0].id)--%>
        <%--//var id = "\""++"\"";--%>
        <%--$("#dialog_update").dialog({--%>
            <%--title: '修改用户',--%>
            <%--width: 700,--%>
            <%--height: 500,--%>
            <%--closed: false,--%>
            <%--cache: false,--%>
            <%--&lt;%&ndash;href:"<%=request.getContextPath()%>/wyc/updateUser.jsp?idsss="+ids[0].id,&ndash;%&gt;--%>
            <%--href:"<%=request.getContextPath()%>/userControllerWyc/queryUserById?idsss="+ids[0].id,--%>
            <%--modal: true ,--%>
            <%--toolbar:[{--%>
                <%--text:'保存',--%>
                <%--iconCls:'icon-edit',--%>
                <%--handler:function(){--%>
                    <%--//alert($("#add_form").serialize());--%>
                    <%--$.ajax({--%>
                        <%--url:"<%=request.getContextPath()%>/userControllerWyc/updateUser",--%>
                        <%--data:$("#update_form_user").serialize(),--%>
                        <%--type:"post",--%>
                        <%--success:function(){--%>
                            <%--$("#dialog_update").dialog("close");--%>
                            <%--$("#dguser").datagrid("reload");--%>

                        <%--},error:function(){--%>
                            <%--$.messager.alert('警告','报错');--%>
                        <%--}--%>
                    <%--})--%>

                <%--}--%>
            <%--},{--%>
                <%--text:'取消',--%>
                <%--iconCls:'icon-cancel',--%>
                <%--handler:function(){--%>
                    <%--$("#dialog_update").dialog("close");--%>
                <%--}--%>
            <%--}]--%>
        <%--})--%>



    <%--}--%>

<%--}--%>


</script>
</body>
</html>