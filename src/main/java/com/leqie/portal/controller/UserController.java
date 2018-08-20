package com.leqie.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leqie.portal.constants.Template;
import com.leqie.portal.constants.Url;

@Controller
public class UserController {

	@RequestMapping(Url.USER)
	public ModelAndView index(ModelAndView mv) {
		mv.setViewName(Template.USER_INDEX);
		return mv;
	}
	
	@RequestMapping(Url.USER_UPDATE_PWD)
	public ModelAndView updatePwd(ModelAndView mv) {
		mv.setViewName(Template.USER_UPDATE_PWD);
		return mv;
	}
	
}
