package com.leqie.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leqie.portal.constants.Template;
import com.leqie.portal.constants.Url;

@Controller
public class WalletController {

	@RequestMapping(Url.WALLET)
	public ModelAndView index(ModelAndView mv) {
		mv.setViewName(Template.WALLET_INDEX);
		return mv;
	}
	
	@RequestMapping(Url.WALLET_RECORD)
	public ModelAndView newRecvAddress(ModelAndView mv) {
		mv.setViewName(Template.WALLET_RECORD);
		return mv;
	}

}
