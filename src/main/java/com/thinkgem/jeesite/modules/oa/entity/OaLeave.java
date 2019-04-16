/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.entity.Office;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 请假Entity
 * @author sjk
 * @version 2019-04-14
 */
public class OaLeave extends DataEntity<OaLeave> {
	
	private static final long serialVersionUID = 1L;
	private String processInstanceId;		// 流程实例编号
	private Date startTime;		// 开始时间
	private Date endTime;		// 结束时间
	private String leaveType;		// 请假类型
	private String reason;		// 请假理由
	private Date applyTime;		// 申请时间
	private Date realityStartTime;		// 实际开始时间
	private Date realityEndTime;		// 实际结束时间
	private User apply;		// 申请人
	private Office office;		// 部门
	private String company;		// 公司id
	private String totalNum;		// 请假天数
	private String attach;		// 附件
	private String status;		// 状态
	private User curnames;		// 当前办理人
	private User curids;		// 当前办理人id
	private User auditusers;		// 审批办理人
	private User auditresult;		// 审批人及意见
	
	public OaLeave() {
		super();
	}

	public OaLeave(String id){
		super(id);
	}

	@Length(min=0, max=64, message="流程实例编号长度必须介于 0 和 64 之间")
	public String getProcessInstanceId() {
		return processInstanceId;
	}

	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	@Length(min=0, max=20, message="请假类型长度必须介于 0 和 20 之间")
	public String getLeaveType() {
		return leaveType;
	}

	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
	}
	
	@Length(min=0, max=255, message="请假理由长度必须介于 0 和 255 之间")
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getRealityStartTime() {
		return realityStartTime;
	}

	public void setRealityStartTime(Date realityStartTime) {
		this.realityStartTime = realityStartTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getRealityEndTime() {
		return realityEndTime;
	}

	public void setRealityEndTime(Date realityEndTime) {
		this.realityEndTime = realityEndTime;
	}
	
	public User getApply() {
		return apply;
	}

	public void setApply(User apply) {
		this.apply = apply;
	}
	
	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}
	
	@Length(min=0, max=64, message="公司id长度必须介于 0 和 64 之间")
	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}
	
	@Length(min=0, max=64, message="请假天数长度必须介于 0 和 64 之间")
	public String getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(String totalNum) {
		this.totalNum = totalNum;
	}
	
	public String getAttach() {
		return attach;
	}

	public void setAttach(String attach) {
		this.attach = attach;
	}
	
	@Length(min=0, max=64, message="状态长度必须介于 0 和 64 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public User getCurnames() {
		return curnames;
	}

	public void setCurnames(User curnames) {
		this.curnames = curnames;
	}
	
	public User getCurids() {
		return curids;
	}

	public void setCurids(User curids) {
		this.curids = curids;
	}
	
	public User getAuditusers() {
		return auditusers;
	}

	public void setAuditusers(User auditusers) {
		this.auditusers = auditusers;
	}
	
	public User getAuditresult() {
		return auditresult;
	}

	public void setAuditresult(User auditresult) {
		this.auditresult = auditresult;
	}
	
}