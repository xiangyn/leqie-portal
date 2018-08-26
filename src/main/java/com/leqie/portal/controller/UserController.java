package com.leqie.portal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leqie.portal.constants.Template;
import com.leqie.portal.constants.Url;
import com.leqie.portal.utils.WebUtil;

@Controller
public class UserController {

	@RequestMapping(Url.USER)
	public ModelAndView index(HttpServletRequest request, ModelAndView mv) {
		mv.addObject("user", WebUtil.getUser(request));
		mv.setViewName(Template.USER_INDEX);
		return mv;
	}
	
	@RequestMapping(Url.USER_UPDATE)
	public ModelAndView update(HttpServletRequest request, ModelAndView mv) {
		mv.addObject("user", WebUtil.getUser(request));
		mv.setViewName(Template.USER_UPDATE);
		return mv;
	}
	
	@RequestMapping(Url.USER_UPDATE_PWD)
	public ModelAndView updatePwd(ModelAndView mv) {
		mv.setViewName(Template.USER_UPDATE_PWD);
		return mv;
	}
	
}
