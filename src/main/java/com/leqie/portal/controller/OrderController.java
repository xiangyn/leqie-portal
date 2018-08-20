package com.leqie.portal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leqie.portal.constants.RequestAttributes;
import com.leqie.portal.constants.Template;
import com.leqie.portal.constants.Url;
import com.leqie.portal.model.request.order.OrderPage;
import com.leqie.portal.service.OrderService;

@Controller
public class OrderController {
	
	private static final String ALL = null;
	
	private static final String UNPAY = "0";
	
	private static final String UNRECV = "1";
	
	private static final String FINISHED = "2";
	
	@Autowired
	private OrderService service;

	@RequestMapping(Url.FAST_ORDER)
	public String fastOrder() {
		return Template.FAST_ORDER;
	}
	
	@RequestMapping(Url.ORDER_INDEX)
	public ModelAndView index(@ModelAttribute("seach")OrderPage search, 
			HttpServletRequest request,
			ModelAndView mv) {
		search.setPhone((String) request.getAttribute(RequestAttributes.PHONE_ATTR_NAME));
		search.setType(ALL);
		mv.addObject("data", service.findOrder(search));
		mv.setViewName(Template.ORDER_INDEX);
		return mv;
	}
	
	@RequestMapping(Url.ORDER_UNPAY)
	public ModelAndView unpay(@ModelAttribute("seach")OrderPage search, 
			HttpServletRequest request,
			ModelAndView mv) {
		search.setPhone((String) request.getAttribute(RequestAttributes.PHONE_ATTR_NAME));
		search.setType(UNPAY);
		mv.addObject("data", service.findOrder(search));
		mv.setViewName(Template.ORDER_UNPAY);
		return mv;
	}
	
	@RequestMapping(Url.ORDER_UNRECV)
	public ModelAndView unrecv(@ModelAttribute("seach")OrderPage search, 
			HttpServletRequest request,
			ModelAndView mv) {
		search.setPhone((String) request.getAttribute(RequestAttributes.PHONE_ATTR_NAME));
		search.setType(UNRECV);
		mv.addObject("data", service.findOrder(search));
		mv.setViewName(Template.ORDER_UNRECV);
		return mv;
	}
	
	@RequestMapping(Url.ORDER_FINISHED)
	public ModelAndView finished(@ModelAttribute("seach")OrderPage search, 
			HttpServletRequest request,
			ModelAndView mv) {
		search.setPhone((String) request.getAttribute(RequestAttributes.PHONE_ATTR_NAME));
		search.setType(FINISHED);
		mv.addObject("data", service.findOrder(search));
		mv.setViewName(Template.ORDER_UNRECV);
		return mv;
	}
	
	@RequestMapping(Url.ORDER_ALL)
	public ModelAndView all(@ModelAttribute("seach")OrderPage search, 
			HttpServletRequest request,
			ModelAndView mv) {
		search.setPhone((String) request.getAttribute(RequestAttributes.PHONE_ATTR_NAME));
		search.setType(ALL);
		mv.addObject("data", service.findOrder(search));
		mv.setViewName(Template.ORDER_ALL);
		return mv;
	}
	
}
