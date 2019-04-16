package com.thinkgem.jeesite.modules.oa.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.oa.entity.OaLeave;
import com.thinkgem.jeesite.modules.oa.service.OaLeaveService;

/**
 * 请假Controller
 * @author sjk
 * @version 2019-04-14
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/oaLeave")
public class OaLeaveController extends BaseController {

	@Autowired
	private OaLeaveService oaLeaveService;
	
	@ModelAttribute
	public OaLeave get(@RequestParam(required=false) String id) {
		OaLeave entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = oaLeaveService.get(id);
		}
		if (entity == null){
			entity = new OaLeave();
		}
		return entity;
	}
	
	@RequiresPermissions("oa:oaLeave:view")
	@RequestMapping(value = {"list", ""})
	public String list(OaLeave oaLeave, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OaLeave> page = oaLeaveService.findPage(new Page<OaLeave>(request, response), oaLeave); 
		model.addAttribute("page", page);
		return "modules/oa/oaLeaveList";
	}

	@RequiresPermissions("oa:oaLeave:view")
	@RequestMapping(value = "form")
	public String form(OaLeave oaLeave, Model model) {
		model.addAttribute("oaLeave", oaLeave);
		return "modules/oa/oaLeaveForm";
	}

	@RequiresPermissions("oa:oaLeave:edit")
	@RequestMapping(value = "save")
	public String save(OaLeave oaLeave, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, oaLeave)){
			return form(oaLeave, model);
		}
		oaLeaveService.save(oaLeave);
		addMessage(redirectAttributes, "保存请假成功");
		return "redirect:"+Global.getAdminPath()+"/oa/oaLeave/?repage";
	}
	
	@RequiresPermissions("oa:oaLeave:edit")
	@RequestMapping(value = "delete")
	public String delete(OaLeave oaLeave, RedirectAttributes redirectAttributes) {
		oaLeaveService.delete(oaLeave);
		addMessage(redirectAttributes, "删除请假成功");
		return "redirect:"+Global.getAdminPath()+"/oa/oaLeave/?repage";
	}

}