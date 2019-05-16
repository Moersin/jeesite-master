<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>审批管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/oa/testAudit/">审批列表</a></li>
		<shiro:hasPermission name="oa:testAudit:edit"><li><a href="${ctx}/oa/testAudit/form">请休假申请</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="testAudit" action="${ctx}/oa/testAudit/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<label>假种：</label>
		<form:select path="leaveType" >
			<form:options id="type" items="${fns:getDictList('oa_leave_type')}" itemLabel="label" itemValue="value" htmlEscape="false" />
		</form:select>		&nbsp;
		<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
			<th>假种</th>
			<th>申请人</th>
			<th>申请时间</th>
			<th>开始时间</th>
			<th>结束时间</th>
			<shiro:hasPermission name="oa:testAudit:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="testAudit">
			<tr>
				<td>${fns:getDictLabel(testAudit.leaveType, 'oa_leave_type', '')}</td>
				<td><c:if test="${testAudit.user.name eq fns:getUser().name}"><a href="${ctx}/oa/testAudit/form?id=${testAudit.id}"></c:if>
				${testAudit.user.name}</a></td>
				<td><fmt:formatDate value="${testAudit.createDate}" type="both"/></td>
				<td><fmt:formatDate value="${testAudit.startTime}" type="both"/></td>
				<td><fmt:formatDate value="${testAudit.endTime}" type="both"/></td>
				<shiro:hasPermission name="oa:testAudit:edit"><td>
				<c:if test="${testAudit.user.name eq fns:getUser().name}">
    				<a href="${ctx}/oa/testAudit/form?id=${testAudit.id}">查看</a>
					<a href="${ctx}/oa/testAudit/delete?id=${testAudit.id}" onclick="return confirmx('确认要删除该审批吗？', this.href)">删除</a>
					</c:if>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
