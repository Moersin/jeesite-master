<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>审批管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/oa/testAudit/">审批列表</a></li>
		<li class="active"><a href="#"><shiro:hasPermission name="oa:testAudit:edit">${testAudit.act.taskName}</shiro:hasPermission><shiro:lacksPermission name="oa:testAudit:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<form:form id="inputForm" modelAttribute="testAudit" action="${ctx}/oa/testAudit/saveAudit" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="act.taskId"/>
		<form:hidden path="act.taskName"/>
		<form:hidden path="act.taskDefKey"/>
		<form:hidden path="act.procInsId"/>
		<form:hidden path="act.procDefId"/>
		<form:hidden id="flag" path="act.flag"/>
		<sys:message content="${message}"/>
		<fieldset>
			<legend>${testAudit.act.taskName}</legend>
			<table class="table-form">
				<tr>
					<td class="tit">姓名</td><td>${testAudit.user.name}</td>
					<td class="tit">部门</td><td>${testAudit.office.name}</td>
				</tr>
				<tr>
					<td class="tit">请休假原因</td>
					<td colspan="5">${testAudit.content}</td>
				</tr>
				<tr>
					<td class="tit">请休假类型</td>
					<td colspan="5">
					${fns:getDictLabel(testAudit.leaveType, 'oa_leave_type', '')}</td>
				</tr>
				<tr>
					<td class="tit">请休假时间</td>
					<td colspan="5">
						<ins><fmt:formatDate value="${testAudit.startTime}" pattern="yyyy年MM月dd日 HH:mm"/></ins>
						至<ins><fmt:formatDate value="${testAudit.endTime}" pattern="yyyy年MM月dd日 HH:mm"/></ins>
					</td>
				</tr>
				<tr>
					<td class="tit">附件</td>
					<td colspan="5">
					<input id="testAudit_attach" name="testAudit.attach" type="hidden" value="${testAudit.attach}"/>
                       <sys:ckfinder input="testAudit_attach" type="images" uploadPath="/oa/testAudit" maxWidth="120" maxHeight="120" selectMultiple="true" readonly="true"/>
					</td>
				</tr>
				<tr>
					<td class="tit">您的意见</td>
					<td colspan="5">
						<form:textarea path="act.comment" class="required" rows="5" maxlength="20" cssStyle="width:500px"/>
					</td>
				</tr>
				<c:if test="${testAudit.act.taskName eq '销假'}">
				<tr>
					<td class="tit">实际结束时间</td>
					<td colspan="5">
						<input id="endTime" name="endTime" type="text" readonly="readonly" maxlength="20" class="Wdate required"
						value="<fmt:formatDate value="${testAudit.endTime}" pattern="yyyy-MM-dd HH:mm"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:false});"/>
					</td>
				</tr>
				</c:if>
			</table>
		</fieldset>
		<div class="form-actions">
			<shiro:hasPermission name="oa:testAudit:edit">
				<%-- <c:if test="${testAudit.act.taskDefKey eq 'apply_end'}">
					<input id="btnSubmit" class="btn btn-primary" type="submit" value="兑 现" onclick="$('#flag').val('yes')"/>&nbsp;
				</c:if> --%>
				<c:if test="${testAudit.act.taskName ne '销假'}">
					<input id="btnSubmit" class="btn btn-primary" type="submit" value="同 意" onclick="$('#flag').val('yes')"/>&nbsp;
					<input id="btnSubmit" class="btn btn-inverse" type="submit" value="驳 回" onclick="$('#flag').val('no')"/>&nbsp;
				</c:if>
				<c:if test="${testAudit.act.taskName eq '销假'}">
					<input id="btnSubmit" class="btn btn-primary" type="submit" value="确认" onclick="$('#flag').val('yes')"/>
				</c:if>
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
		<act:histoicFlow procInsId="${testAudit.act.procInsId}"/>
	</form:form>
</body>
</html>
