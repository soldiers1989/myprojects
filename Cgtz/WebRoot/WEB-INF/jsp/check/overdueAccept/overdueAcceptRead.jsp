<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/sys/include.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<title>逾期受理查看</title>
	<link href="css/global.css" type="text/css" rel="stylesheet"/>
	<link href="css/icon.css" type="text/css" rel="stylesheet"/>
	<link href="css/default/easyui.css" type="text/css" rel="stylesheet"/>
	<script src="js/jquery.min.js" type="text/javascript"></script>
	<script src="js/jquery.form.js" type="text/javascript"></script>
	<script src="js/jquery.easyui.min.js" type="text/javascript"></script>
	<script src="js/easyui-lang-zh_CN.js" type="text/javascript"></script>
<style type="text/css">
</style>
</head>
<body>
<div id="main">
	<div id="part1" class="part">
		<p class="title"><a href="javascript:void(0);">逾期申请受理</a></p>
		<div class="content">
			<form id="updateOverDueAcceptForm" >
				<input type="hidden" id="id" name="id" value="${bean.id}"/>
				<table>
					<tbody>
					<tr>
<td>申请ID:</td>
<td><input id="loanId" name="loanId" type="text" readonly="readonly"  data-options="validType:['length[0,50]']" class="textbox easyui-validatebox" value="${bean.loanId}"/></td>

<td>合同ID:</td>
<td><input id="contractId" name="contractId" type="text" readonly="readonly"  data-options="validType:['length[0,50]']" class="textbox easyui-validatebox" value="${bean.contractId}"/></td>

<td>期数:</td>
<td><input id="num" name="num" type="text" readonly="readonly"  data-options="min:0,precision:0" class="textbox easyui-numberbox" value="${bean.num}"/></td>
</tr>
<tr>
<td>部门:</td>
<%-- <td><input id="dept" name="dept" type="text"  data-options="validType:['length[0,50]']" class="textbox easyui-validatebox" value="${bean.dept}"/></td> --%>
<td><input id="dept" name="dept" type="text" class="textbox easyui-combobox"
data-options="editable:false,panelHeight:'auto',valueField:'id',textField:'name',
url:'sys/dept/listDept.do'" value="${bean.dept}"/></td>
<td>日期:</td>
<td><input id="regDate" name="regDate" type="text"  editable="false" class="textbox easyui-datebox" value="${bean.regDateStr}"/></td>

<td>业务经办人:</td>
<td><input id="busName" name="busName" type="text" data-options="validType:['length[0,50]']" class="textbox easyui-validatebox" value="${bean.busName}"/></td>
</tr>
<tr>
<td>联系方式:</td>
<td><input id="tel" name="tel" type="text" data-options="validType:['mobile','length[0,20]']" class="textbox easyui-validatebox" value="${bean.tel}"/></td>

<td>性质:</td>
<td><input id="property" name="property" type="text"  class="textbox easyui-combobox" value="${bean.property}"
    data-options="editable:false,panelHeight:'auto',valueField:'keyProp',textField:'keyValue',
    data:[{'keyProp':'','keyValue':'请选择'},{'keyProp':'1','keyValue':'利息逾期'},{'keyProp':'2','keyValue':'本金逾期'}]"/>
</td>

<td>部门负责人:</td>
<td><input id="deptOwner" name="deptOwner" type="text" data-options="validType:['length[0,200]']" class="textbox easyui-validatebox" value="${bean.deptOwner}"/></td>
</tr>
<tr>
<td>评审成员:</td>
<td><input id="auditMem" name="auditMem" type="text" data-options="validType:['length[0,200]']" class="textbox easyui-validatebox" value="${bean.auditMem}"/></td>

<td>风控人员:</td>
<td><input id="riskName" name="riskName" type="text" data-options="validType:['length[0,200]']" class="textbox easyui-validatebox" value="${bean.riskName}"/></td>

<td>法务人员:</td>
<td><input id="lawName" name="lawName" type="text" data-options="validType:['length[0,200]']" class="textbox easyui-validatebox" value="${bean.lawName}"/></td>
</tr>
<tr>
<td>产品类型:</td>
			    <td><input id="proType" name="proType" type="text" class="textbox easyui-combobox"
			         data-options="editable:false,panelHeight:'auto',valueField:'keyProp',textField:'keyValue',
			         url:'sys/datadictionary/listjason.do?keyName=productType'" value="${bean.proType }"/></td>		     

<td>逾期时间:</td>
<td><input id="lateDate" name="lateDate" type="text"  editable="false" class="textbox easyui-datebox" value="${bean.lateDateStr}"/></td>

<td>金额:</td>
<td><input id="amt" name="amt" type="text" editable="false"  data-options="min:0,precision:2" class="textbox easyui-numberbox" value="${bean.amt}"/>元</td>
</tr>
<tr>
<td>借款人的基本情况:</td>
<td colspan="8"><textarea id="loanInfo" name="loanInfo" type="text" data-options="validType:['length[0,500]']" 
              class="textbox easyui-validatebox" value="${bean.loanInfo}" style="resize:none;width:625px;height:50px!important;">
${bean.loanInfo}
</textarea></td>
</tr>
<tr>
<td>逾期报告摘要:</td>
<td colspan="8"><textarea id="reportSummary" name="reportSummary" type="text" data-options="validType:['length[0,500]']" 
              class="textbox easyui-validatebox" value="${bean.reportSummary}" style="resize:none;width:625px;height:50px!important;">
${bean.reportSummary}
</textarea></td>
</tr>
<tr>
<td>部门经理审核意见:</td>
<td><input id="deptAuditAdv" name="deptAuditAdv" type="text" data-options="validType:['length[0,500]']" class="textbox easyui-validatebox" value="${bean.deptAuditAdv}"/></td>
<td>承办人审核意见:</td>
<td><input id="busAdv" name="busAdv" type="text" data-options="validType:['length[0,500]']" class="textbox easyui-validatebox" value="${bean.busAdv}"/></td>
</tr>
<tr>
<td>稽查部门负责人意见:</td>
<td><input id="checkAdv" name="checkAdv" type="text" data-options="validType:['length[0,500]']" class="textbox easyui-validatebox" value="${bean.checkAdv}"/></td>

<td>保全小组意见:</td>
<td><input id="keepAdv" name="keepAdv" type="text" data-options="validType:['length[0,500]']" class="textbox easyui-validatebox" value="${bean.keepAdv}"/></td>
</tr>
<tr>
<td>领导意见:</td>
<td><input id="leaderAdv" name="leaderAdv" type="text" data-options="validType:['length[0,500]']" class="textbox easyui-validatebox" value="${bean.leaderAdv}"/></td>

<td>状态:</td>
<td><input id="state" name="state" type="text"  class="textbox easyui-combobox" value="${bean.state}"
    data-options="editable:false,panelHeight:'auto',valueField:'keyProp',textField:'keyValue',
    data:[{'keyProp':'1','keyValue':'可以修改'},{'keyProp':'2','keyValue':'存档'}]"/>
</td>
</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</div>

</body>
<script type="text/javascript">
//开启遮罩
function openMask(){
	$("<div class=\"datagrid-mask\" id='mask_id'></div>").css({display:"block",width:"100%",height:$(window).height()}).appendTo("body");
	$("<div class=\"datagrid-mask-msg\" id='mask_msg_id'></div>").html("请稍候。。。").appendTo("body").css({display:"block",left:($(document.body).outerWidth(true) - 190) / 2,top:($(window).height() - 45) / 2}); 
}
//关闭遮罩
function closeMask(){
	$("#mask_id").remove();
	$("#mask_msg_id").remove();
}
</script>

<script type="text/javascript">

//页面加载完动作
$(document).ready(function (){
	//将Form元素禁用
	$("#updateOverDueAcceptForm").find("input").attr("disabled", "disabled");
	$("#updateOverDueAcceptForm").find("textarea").attr("disabled", "disabled");
	$("#updateOverDueAcceptForm").find("select").attr("disabled", "disabled");
	//将easyui控件禁用
	$("#updateOverDueAcceptForm").find(".easyui-combobox").combo('disable');
	$("#updateOverDueAcceptForm").find(".easyui-numberbox").numberbox('disable');
	$("#updateOverDueAcceptForm").find(".easyui-numberspinner").numberspinner('disable');
	$("#updateOverDueAcceptForm").find(".easyui-datebox").datebox('disable');
	$("#updateOverDueAcceptForm").find(".easyui-datetimebox").datetimebox('disable');
});

</script>
</html>

