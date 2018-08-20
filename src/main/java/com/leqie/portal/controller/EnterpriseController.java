package com.leqie.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leqie.portal.constants.Template;
import com.leqie.portal.constants.Url;

@Controller
public class EnterpriseController {

	@RequestMapping(Url.ENTERPRISE)
	public ModelAndView index(ModelAndView mv) {
		mv.setViewName(Template.ENTERPRISE);
		return mv;
	}
	
	@RequestMapping(Url.ENTERPRISE_AUTH)
	public ModelAndView auth(ModelAndView mv) {
		mv.setViewName(Template.ENTERPRISE_AUTH);
		return mv;
	}
	
}
