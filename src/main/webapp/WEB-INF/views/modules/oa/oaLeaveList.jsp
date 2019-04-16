<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>请假管理</title>
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
		<li class="active"><a href="${ctx}/oa/oaLeave/">请假列表</a></li>
		<shiro:hasPermission name="oa:oaLeave:edit"><li><a href="${ctx}/oa/oaLeave/form">请假添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="oaLeave" action="${ctx}/oa/oaLeave/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>申请人：</label>
				<sys:treeselect id="apply" name="apply.id" value="${oaLeave.apply.id}" labelName="" labelValue="${oaLeave.}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>申请人姓名：</label>
				<sys:treeselect id="apply" name="apply.name" value="${oaLeave.apply.name}" labelName="" labelValue="${oaLeave.}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>状态：</label>
				<form:input path="status" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>更新时间</th>
				<th>备注信息</th>
				<th>申请人</th>
				<th>申请人姓名</th>
				<shiro:hasPermission name="oa:oaLeave:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="oaLeave">
			<tr>
				<td><a href="${ctx}/oa/oaLeave/form?id=${oaLeave.id}">
					<fmt:formatDate value="${oaLeave.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</a></td>
				<td>
					${oaLeave.remarks}
				</td>
				<td>
					${oaLeave.}
				</td>
				<td>
					${oaLeave.}
				</td>
				<shiro:hasPermission name="oa:oaLeave:edit"><td>
    				<a href="${ctx}/oa/oaLeave/form?id=${oaLeave.id}">修改</a>
					<a href="${ctx}/oa/oaLeave/delete?id=${oaLeave.id}" onclick="return confirmx('确认要删除该请假吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>