package com.leqie.portal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leqie.portal.constants.Template;
import com.leqie.portal.constants.Url;
import com.leqie.portal.model.Overdraft;
import com.leqie.portal.model.Page;
import com.leqie.portal.service.OverdraftService;
import com.leqie.portal.utils.WebUtil;

@Controller
public class OverdraftController {
	
	@Autowired
	private OverdraftService service;

	@RequestMapping(Url.OVERDRAFT)
	public ModelAndView index(HttpServletRequest request, ModelAndView mv) {
		String userId = WebUtil.getUserId(request);
		Overdraft over = service.getOverdraft(userId);
		if(over != null && "审核通过".equals(over.getStatus())) {
			mv.addObject("edu", service.getEdu(userId));
		}
		mv.addObject("over", over);
		mv.addObject("page", new Page<Object>());
		mv.setViewName(Template.OVERDRAFT_INDEX);
		return mv;
	}
	
	@RequestMapping(Url.OVERDRAFT_APPLY)
	public ModelAndView apply(HttpServletRequest request, ModelAndView mv) {
		String userId = WebUtil.getUserId(request);
		Overdraft over = service.getOverdraft(userId);
		mv.addObject("over", over);
		mv.setViewName(Template.OVERDRAFT_APPLY);
		return mv;
	}
	
}
