/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.oa.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.oa.entity.OaLeave;

/**
 * 请假DAO接口
 * @author sjk
 * @version 2019-04-14
 */
@MyBatisDao
public interface OaLeaveDao extends CrudDao<OaLeave> {
	
}