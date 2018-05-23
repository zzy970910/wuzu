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
</head>
	
   <body class="easyui-layout">
   <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
   <!-- 
	布局组件  easyui-layout
	手风琴组件  easyui-accordion
	树  easyui-tree
	
	选项卡  easyui-tabs
 --> 
   	<div data-options="region:'north',split:true,border:false" style="height:100px;">
		<img  style="CURSOR: pointer" onclick="javascript:window.open('http://b.qq.com/webc.htm?new=0&sid=1498162732&o=192.168.3.69:/8080/.jsp&q=7', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');"  border="0" SRC=http://wpa.qq.com/pa?p=1:1498162732:3 alt="亲,需要帮助吗">
		<iframe allowtransparency="true" frameborder="0" width="875" height="98" scrolling="no" src="//tianqi.2345.com/plugin/widget/index.htm?s=2&z=3&t=1&v=0&d=5&bd=0&k=&f=&ltf=009944&htf=cc0000&q=1&e=1&a=1&c=54511&w=875&h=98&align=center"></iframe>
	</div>
   	<div data-options="region:'west',split:true,border:false" style="width:200px;">
   		<div id="aa" class="easyui-accordion" data-options="fit:true" style="width:300px;height:200px;">   
		    <div title="后台管理" data-options="iconCls:'icon-save'" style="overflow:auto;padding:10px;">
		      
		       <ul id="tree" class="easyui-tree"></ul>
		    </div>   
		</div>  
   	</div>   
   	<div data-options="region:'center',border:false" style="padding:5px;background:#eee;" >
   		<div id="tables" class="easyui-tabs" data-options="fit:true">
		    <div title="" style="padding:20px;display:none;">   
		        	欢迎来到后台管理系统
		    </div>   
		</div>  
   	</div>   
	<script type="text/javascript">
		//在浏览器控制台打印信息
		//console.info(node)
			//alert(id)
		$('#tree').tree({
		    url:"<%=request.getContextPath()%>/UserController/getTree",
		    method:"post",
          //  data:{"id":id},
		    onClick:function (node){
		    	if($("#tree").tree("isLeaf",node.target)){
		    		if($('#tables').tabs("exists",node.text)){
		    			$('#tables').tabs("select",node.text)
		    		}else{
		    			$('#tables').tabs('add',{    
				    	    title:node.text,    
				    	    href:node.url,
				    	    closable:true,    
				    	    tools:[{
				    	        iconCls:'icon-mini-refresh',    
				    	        handler:function(){    
				    	           	
				    	        }    
				    	    }]    
				    	}); 
		    		}
		    	}
		    }
		});  
	</script>
</body>  
</html>