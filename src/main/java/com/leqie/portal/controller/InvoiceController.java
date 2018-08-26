package com.leqie.portal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.leqie.portal.constants.Template;
import com.leqie.portal.constants.Url;
import com.leqie.portal.model.InvoiceInfo;
import com.leqie.portal.model.request.InvoiceOrder;
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
	
	@RequestMapping(Url.INVOICE_OPEN)
	public ModelAndView openInvoice(HttpServletRequest request, ModelAndView mv) {
		mv.setViewName(Template.INVOICE_OPEN);
		return mv;
	}
	
	@RequestMapping(Url.INVOICE_WILL)
	public ModelAndView willInvoice(@RequestParam(value="status", defaultValue="0")int status, 
			HttpServletRequest request, ModelAndView mv) {
		InvoiceOrder search = new InvoiceOrder();
		search.setPhone(WebUtil.getUserPhone(request));
		search.setKaipiaoStatus(Integer.toString(status));
		mv.addObject("data", service.findOrderCanInvoice(search));
		mv.setViewName(Template.INVOICE_WILL);
		return mv;
	}
	
}
