package com.leqie.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leqie.portal.constants.Template;
import com.leqie.portal.constants.Url;

@Controller
public class RecvAddressController {

	@RequestMapping(Url.RECV_ADDRESS)
	public ModelAndView index(ModelAndView mv) {
		mv.setViewName(Template.RECV_ADDRESS_INDEX);
		return mv;
	}
	
	@RequestMapping(Url.RECV_ADDRESS_NEW)
	public ModelAndView newRecvAddress(ModelAndView mv) {
		mv.setViewName(Template.RECV_ADDRESS_NEW);
		return mv;
	}
	
	@RequestMapping(Url.RECV_ADDRESS_UPDATE)
	public ModelAndView updateRecvAddress(ModelAndView mv) {
		mv.setViewName(Template.RECV_ADDRESS_UPDATE);
		return mv;
	}
	
}
