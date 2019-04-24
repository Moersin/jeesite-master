<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>请休假</title>
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
		<li class="active"><a href="${ctx}/oa/testAudit/form?id=${testAudit.id}"><shiro:hasPermission name="oa:testAudit:edit">请休假${not empty testAudit.id?'修改':'申请'}</shiro:hasPermission><shiro:lacksPermission name="oa:testAudit:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<form:form id="inputForm" modelAttribute="testAudit" action="${ctx}/oa/testAudit/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="act.taskId"/>
		<form:hidden path="act.taskName"/>
		<form:hidden path="act.taskDefKey"/>
		<form:hidden path="act.procInsId"/>
		<form:hidden path="act.procDefId"/>
		<form:hidden id="flag" path="act.flag"/>
		<sys:message content="${message}"/>
		<fieldset>
			<legend>审批申请</legend>
			<table class="table-form">
				<tr>
					<td class="tit">姓名</td><td>
						<sys:treeselect id="user" name="user.id" value="${testAudit.user.id}" labelName="user.name" labelValue="${testAudit.user.name}" 
							title="申请人" url="/sys/office/treeData?type=3" cssClass="required recipient" cssStyle="width:150px" 
							allowClear="true" notAllowSelectParent="true" smallBtn="false"/>
					</td><td class="tit">部门</td><td>
						<sys:treeselect id="office" name="office.id" value="${testAudit.office.id}" labelName="office.name" labelValue="${testAudit.office.name}" 
							title="部门" url="/sys/office/treeData?type=2" cssClass="required recipient" cssStyle="width:150px" 
							allowClear="true" notAllowSelectParent="true" smallBtn="false"/>
					</td>
				</tr>
				<tr>
					<td class="tit">请休假类型</td>
					<td colspan="5">
						<form:select path="leaveType" >
							<form:options items="${fns:getDictList('oa_leave_type')}" itemLabel="label" itemValue="value" htmlEscape="false" />
						</form:select>
					</td>
				</tr>
				<tr>
					<td class="tit">请休假时间</td>
					<td colspan="5">
						<input id="startTime" name="startTime" type="text" readonly="readonly" maxlength="20" class="Wdate required"
						value="<fmt:formatDate value="${testAudit.startTime}" pattern="yyyy-MM-dd HH:mm"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:false});"/>
						至<input id="endTime" name="endTime" type="text" readonly="readonly" maxlength="20" class="Wdate required"
						value="<fmt:formatDate value="${testAudit.endTime}" pattern="yyyy-MM-dd HH:mm"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:false});"/>
					</td>
				</tr>
				<tr>
					<td class="tit">请休假原因</td>
					<td colspan="5">
						<form:textarea path="content" class="required" rows="5" maxlength="200" cssStyle="width:500px"/>
					</td>
				</tr>
				<tr>
					<td class="tit">附件</td>
					<td colspan="5">
					<form:hidden id="testAudit_attach" path="attach" htmlEscape="false" maxlength="2000" />
					<sys:ckfinder input="testAudit_attach" type="images" uploadPath="/oa/testAudit" selectMultiple="true"/>
					</td>
				</tr>
			</table>
		</fieldset>
		<div class="form-actions">
			<shiro:hasPermission name="oa:testAudit:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="提交申请" onclick="$('#flag').val('yes')"/>&nbsp;
				<c:if test="${not empty testAudit.id}">
					<input id="btnSubmit2" class="btn btn-inverse" type="submit" value="销毁申请" onclick="$('#flag').val('no')"/>&nbsp;
				</c:if>
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
		<c:if test="${not empty testAudit.id}">
			<act:histoicFlow procInsId="${testAudit.act.procInsId}" />
		</c:if>
	</form:form>
</body>
</html>
