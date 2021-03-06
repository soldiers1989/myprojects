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
<title>签约列表</title>
	<link href="css/global.css" type="text/css" rel="stylesheet"/>
</head>
<body>
	<div class="content">
		<form name="queryList" id="queryList" method="post" action="${ pm.url}">
			<div id="control" class="control">
				<a href="javascript:void(0);" onclick="window.location.reload();"><img src="img/square/but_renew.png" class='dotimg' title="刷新" /></a>&nbsp;&nbsp;
			</div>
			
			<table id="table" class="datatable" summary="list of members in EE Studay">
				<tr>
					<th scope="col">序号</th>
					<th scope="col">申请ID</th>
					<th scope="col">客户姓名</th>
					<th scope="col">证件号码</th>
					<th scope="col">机构代码</th>
					<th scope="col">申请时间</th>
					<th scope="col">金额</th>
					<th scope="col">产品</th>
					<th scope="col">期限</th>
					<th scope="col">撮合类型</th>
					<th scope="col">状态</th>

					<th scope="col" width="50">操作</th>
				</tr>
				<c:forEach items="${pm.data}" var="data" varStatus="status">
					<tr>
						<td style="text-align: center;">${ status.index+pm.rowS+1}</td>
						<td>${data.appId}</td>
						<td>${data.name}</td>
						<td>${data.idNo}</td>
						<td>${data.orgId}</td>
						<td>
						${data.createTimeStr}
						</td>
						<td>
<%--						<fmt:parseNumber value="${data.amount}" var="fmtAmount"/>--%>
<%--							${fmtAmount}--%>
							<fmt:formatNumber value="${data.amount}" type="currency"/>
						</td>
						<td>${data.product}</td>
						<td>${data.period}</td>
						<td>
						<c:choose>
							<c:when test="${data.matchType=='0'}">自动撮合</c:when>
							<c:when test="${data.matchType=='1'}">人工撮合</c:when>
						</c:choose>
						</td>
						<td>
									<c:choose>
									<c:when test="${data.state=='1'}">

　　										正常

　									　</c:when>
									<c:when test="${data.state=='2'}">

　　										拒件

　									　</c:when>
									<c:otherwise>

　									复核退回

　　									</c:otherwise>
								</c:choose>
						</td>
						<td>
							<a href="javascript:void(0);" onclick="javascript:updateData('${data.id}');">审核</a>&nbsp;
						</td>
					</tr>
				</c:forEach>
			</table>
	
			<div id="pageStyle">
			${ pm.pageNavigation}
			</div>
		</form>
	</div>
</body>

<script language="javascript">
//更新
function updateData(data_id) {
	window.location = "<%=basePath%>" + "loan/sign/update.do?id=" + data_id;
	
	return;
}

//页面加载完动作
$(document).ready(function (){
	
});
</script>
</html>

