package com.leqie.portal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.leqie.portal.constants.Template;
import com.leqie.portal.constants.Url;
import com.leqie.portal.model.InvoiceInfo;
import com.leqie.portal.model.request.UserIdPage;
import com.leqie.portal.service.InvoiceService;
import com.leqie.portal.utils.WebUtil;

@Controller
public class InvoiceController {
	
	@Autowired
	private InvoiceService service;
	
	@RequestMapping(Url.INVOICE)
	public ModelAndView index(HttpServletRequest request, ModelAndView mv) {
		mv.addObject("data", service.getByUserId(WebUtil.getUserId(request)));
		mv.setViewName(Template.INVOICE_INDEX);
		return mv;
	}
	
	@RequestMapping(Url.INVOICE_NEW)
	public ModelAndView newInvoice(ModelAndView mv) {
		mv.setViewName(Template.INVOICE_NEW);
		return mv;
	}
	
	@RequestMapping(Url.INVOICE_UPDATE)
	public ModelAndView updateInvoice(@RequestParam("id")int id, HttpServletRequest request, ModelAndView mv) {
		List<InvoiceInfo> list = service.getByUserId(WebUtil.getUserId(request));
		for(InvoiceInfo info : list) {
			if(info.getId() == id) {
				mv.addObject("model", info);
			}
		}
		mv.setViewName(Template.INVOICE_UPDATE);
		return mv;
	}
	
	@RequestMapping("/app/invoice/record-wait.jhtml")
	public ModelAndView waitRecord(@ModelAttribute("page")UserIdPage page, 
			HttpServletRequest request, ModelAndView mv) {
		page.setUserId(WebUtil.getUserId(request));
		page.setKaipiaoStatus("开票中");
		mv.addObject("data", service.findInvoice(page));
		mv.setViewName(Template.INVOICE_WAIT);
		return mv;
	}
	
	@RequestMapping("/app/invoice/record-finished.jhtml")
	public ModelAndView finishedRecord(@ModelAttribute("page")UserIdPage page, 
			HttpServletRequest request, ModelAndView mv) {
		page.setUserId(WebUtil.getUserId(request));
		page.setKaipiaoStatus("开票完成");
		mv.addObject("data", service.findInvoice(page));
		mv.setViewName(Template.INVOICE_FINISHED);
		return mv;
	}
	
}
