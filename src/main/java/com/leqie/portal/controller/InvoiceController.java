package com.leqie.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leqie.portal.constants.Template;
import com.leqie.portal.constants.Url;

@Controller
public class InvoiceController {
	
	@RequestMapping(Url.INVOICE)
	public ModelAndView index(ModelAndView mv) {
		mv.setViewName(Template.INVOICE_INDEX);
		return mv;
	}
	
	@RequestMapping(Url.INVOICE_OPEN)
	public ModelAndView open(ModelAndView mv) {
		mv.setViewName(Template.INVOICE_OPEN);
		return mv;
	}
	
	@RequestMapping(Url.INVOICE_WILL)
	public ModelAndView will(ModelAndView mv) {
		mv.setViewName(Template.INVOICE_WILL);
		return mv;
	}
	
}
