<%@page import="com.tera.sys.model.Org"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/sys/include.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<title>用户管理</title>
<link href="css/global.css" type="text/css" rel="stylesheet" />
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/jquery.form.js" type="text/javascript"></script>
<script type="text/javascript" src="js/dtree.js"></script>
<link href="css/dtree.css" rel="stylesheet" type="text/css"></link>
<script src="js/artDialog/artDialog.js?skin=opera"></script>
<script src="js/artDialog/plugins/iframeTools.source.js"></script>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script src="js/jquery.validate.ms.js" type="text/javascript"></script>
<link href="css/global.css" type="text/css" rel="stylesheet"/>
<link href="css/icon.css" type="text/css" rel="stylesheet" />
<link href="css/default/easyui.css" type="text/css" rel="stylesheet" />
<script src="js/jquery.easyui.min.js" type="text/javascript"></script>
<script src="js/easyui-lang-zh_CN.js" type="text/javascript"></script>
<style type="text/css">
	.content table td {
		padding: 0;
	}
</style>
</head>
<body>
<div id="main">

	<div class="part" id="part1" >
		<p class="title">当前设置用户:${name}</p>
		<div class="content">
			<form action="">
				<table class="easyui-treegrid" data-options="fitColumns:true" id="treegrid" style="overflow-x:scroll"></table>
				<div id="rolecontrl" align="right">
					<input type="button" class="btn" value="提交" onclick="submitForm()" />
					<input type="button" class="btn" value="返回"
						onclick="javascript:back();" />
				</div>
			</form>
		</div>
	</div>

</div>

<!-- javascript -->
<script type="text/javascript">
//加载列表方法
function gridLoad(){
	$('#treegrid').treegrid({    
	    url:'sys/user/listOrgTree.do?loginId=${setUserLoginId}',   
	    singleSelect:true,
	    selectOnCheck:false,
	    checkOnSelect:false,
	    idField:'id',    
	    treeField:'orgName', 
	    frozenColumns:[[
			{title:'机构名称', field:'orgName', width:200
				/* ,formatter: function(value,row,index){
					return '<input type=\"checkbox\" name="orgId" value=\"' +row.orgId+ '\">' + row.orgName ;
				} */
			},
			{title:'机构代码', field:'orgId', width:150},
		]],
	    columns:[[ 
			{title:'ID', field:'id', hidden:true, width:50},
			{title:'orgAndRoleIds', field:'orgAndRoleIds', hidden:true, width:50},
			{title:'关联角色', field:'roleNames',width:400},
	    ]],
	    onSelect: function(row,data) {
	    	var org_code = row.orgId;
	    	var org_id = row.id;
	    	if($("body").find("#dialogDiv").length==0){
		   		 $('body').append($("<div id='dialogDiv' style='top:50%'></div>"));
		   	}
		   	$('#dialogDiv').dialog({
		   	    title: "设置角色",
		   	    width: 600,
		   	    closed: false,
		   	    cache: false,
		   	    href: 'sys/user/setRole.do?userId=${userId}&loginId=${setUserLoginId}&orgId='+org_id+'&orgCode='+org_code,
		   	    modal: true,
		   	    onClose:function(){
		   	    	var orgAndRoleIds = new Array();
		   	    	var roleNames = new Array();
		   	    	$("input[name='roleId']:checked").each(function(){
		   	    		roleNames.push($('#'+$(this).val()).text());
		   	    		orgAndRoleIds.push(org_id+'_'+$(this).val());
		   	    	});
		   	    	roleNames.join(",");
		   	    	orgAndRoleIds.join(",");
		   	    	$("#treegrid").treegrid("update", {
		   	    		id: org_id,
		   	    		row: {
		   	    			orgAndRoleIds:orgAndRoleIds,
		   	    			roleNames: roleNames,
		   	    		}
		   	    	});
		   	    }
		   	});
		},
	    onLoadSuccess:function(row, data){
	    }
	}); 
};

//页面加载完动作
$(document).ready(function (){
	//加载列表
    gridLoad();
    $(window).resize(function(){
	 	$('#treegrid').datagrid('resize');
	});
});

//提交
function submitForm(){
	$("#treegrid").treegrid('selectAll');
	var orgAndRoleIds = [];
	var rows = $('#treegrid').datagrid('getSelections');
	for(var i=0; i<rows.length; i++){
		var ids = rows[i].orgAndRoleIds;
		if(ids != null && ids != ''){
			orgAndRoleIds.push(ids);
		}
	}
	orgAndRoleIds.join(',');
	
	$.ajax({
			url:"<%=basePath%>sys/user/setOrgAction.do",
			//防止浏览器缓存，在URL后加时间戳 "&timestamp=" + (new Date()).getTime()
			data:encodeURI("id=${userId}&loginId=${setUserLoginId}&orgIds="+orgAndRoleIds+"&timestamp="+(new Date()).getTime()),
			dataType:"json",
			success:function(data){
				if("true" == data.success){
					$.messager.alert('消息', data.message,"info", function(){
						window.location = 'sys/user/query.do';
		        	});
		         } else {
					$.messager.alert('消息', data.message);
	            }
			},
			error : function() {
				$.messager.alert('消息',"操作失败，请联系管理员！");
			}
			});
	/* window.location = 'sys/user/query.do'; */
	return;
}
//返回
function back(){
	window.location = 'sys/user/query.do';
	return;
}
</script>

</body>
</html>

