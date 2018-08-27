package com.leqie.portal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.leqie.portal.constants.Template;
import com.leqie.portal.constants.Url;
import com.leqie.portal.model.EnterpriseAuth;
import com.leqie.portal.service.UserService;
import com.leqie.portal.utils.WebUtil;
import com.leqie.portal.web.model.Result;

@Controller
public class EnterpriseController {
	
	@Autowired
	private UserService service;

	@RequestMapping(Url.ENTERPRISE)
	public ModelAndView index(HttpServletRequest request, ModelAndView mv) {
		mv.addObject("data", service.getAuth(WebUtil.getUserId(request)));
		mv.setViewName(Template.ENTERPRISE);
		return mv;
	}
	
	@RequestMapping(Url.ENTERPRISE_AUTH)
	public ModelAndView authPage(HttpServletRequest request, ModelAndView mv) {
		EnterpriseAuth model = service.getAuth(WebUtil.getUserId(request));
		if(model == null) {
			model = new EnterpriseAuth();
		}
		mv.addObject("model", model);
		mv.setViewName(Template.ENTERPRISE_AUTH);
		return mv;
	}
	
	@RequestMapping(value="/app/enterprise/auth.jo", method=RequestMethod.POST)
	@ResponseBody
	public Result<Void> auth(HttpServletRequest request,
			@ModelAttribute("model")EnterpriseAuth model) {
		String userId = WebUtil.getUserId(request);
		model.setUserId(userId);
		EnterpriseAuth old = service.getAuth(userId);
		if(old != null) {
			model.setRenzhengId(old.getId());
			return new Result<Void>(service.updateAuth(model));
		}else {
			return new Result<Void>(service.saveAuth(model));
		}
	}
	
}
