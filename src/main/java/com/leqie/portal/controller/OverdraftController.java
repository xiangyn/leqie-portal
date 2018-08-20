package com.leqie.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leqie.portal.constants.Template;
import com.leqie.portal.constants.Url;

@Controller
public class OverdraftController {

	@RequestMapping(Url.OVERDRAFT)
	public ModelAndView index(ModelAndView mv) {
		mv.setViewName(Template.OVERDRAFT_INDEX);
		return mv;
	}
	
	@RequestMapping(Url.OVERDRAFT_APPLY)
	public ModelAndView apply(ModelAndView mv) {
		mv.setViewName(Template.OVERDRAFT_APPLY);
		return mv;
	}
	
	@RequestMapping(Url.OVERDRAFT_USE_RECORD)
	public ModelAndView useRecord(ModelAndView mv) {
		mv.setViewName(Template.OVERDRAFT_USE_RECORD);
		return mv;
	}
	
}
