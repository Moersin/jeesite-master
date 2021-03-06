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
		<li class="active"><a href="${ctx}/oa/testAudit/form/?procInsId=${testAudit.procInsId}">审批详情</a></li>
	</ul>
	<form:form class="form-horizontal">
		<sys:message content="${message}"/>
		<fieldset>
			<legend>审批详情</legend>
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
			</table>
		</fieldset>
		<act:histoicFlow procInsId="${testAudit.act.procInsId}" />
		<div class="form-actions">
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
