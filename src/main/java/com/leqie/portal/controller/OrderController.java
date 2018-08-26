package com.leqie.portal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.leqie.portal.constants.OrderStatus;
import com.leqie.portal.constants.Template;
import com.leqie.portal.constants.Url;
import com.leqie.portal.model.OrderBuy;
import com.leqie.portal.model.request.order.OrderPage;
import com.leqie.portal.service.OrderService;
import com.leqie.portal.utils.WebUtil;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;

	@RequestMapping(Url.FAST_ORDER)
	public String fastOrder() {
		return Template.FAST_ORDER;
	}
	
	@RequestMapping(Url.ORDER_BUY)
	public ModelAndView buy(@ModelAttribute("model")OrderBuy model, 
			HttpServletRequest request,
			ModelAndView mv) {
		mv.setViewName(Template.ORDER_BUY);
		return mv;
	}
	
	@RequestMapping(Url.ORDER_PAY)
	public ModelAndView all(@RequestParam("no")String no, 
			HttpServletRequest request,
			ModelAndView mv) {
		mv.addObject("data", service.getDetail(no));
		mv.setViewName(Template.ORDER_PAY);
		return mv;
	}
	
	@RequestMapping(Url.ORDER_INDEX)
	public ModelAndView index(@ModelAttribute("seach")OrderPage search, 
			HttpServletRequest request,
			ModelAndView mv) {
		search.setPhone(WebUtil.getUserPhone(request));
		search.setType(null);
		mv.addObject("data", service.findOrder(search));
		mv.setViewName(Template.ORDER_INDEX);
		return mv;
	}
	
	@RequestMapping(Url.ORDER_UNPAY)
	public ModelAndView unpay(@ModelAttribute("seach")OrderPage search, 
			HttpServletRequest request,
			ModelAndView mv) {
		search.setPhone(WebUtil.getUserPhone(request));
		search.setType(OrderStatus.UNPAY);
		mv.addObject("data", service.findOrder(search));
		mv.setViewName(Template.ORDER_UNPAY);
		return mv;
	}
	
	@RequestMapping(Url.ORDER_UNRECV)
	public ModelAndView unrecv(@ModelAttribute("seach")OrderPage search, 
			HttpServletRequest request,
			ModelAndView mv) {
		search.setPhone(WebUtil.getUserPhone(request));
		search.setType(OrderStatus.UNRECV);
		mv.addObject("data", service.findOrder(search));
		mv.setViewName(Template.ORDER_UNRECV);
		return mv;
	}
	
	@RequestMapping(Url.ORDER_FINISHED)
	public ModelAndView finished(@ModelAttribute("seach")OrderPage search, 
			HttpServletRequest request,
			ModelAndView mv) {
		search.setPhone(WebUtil.getUserPhone(request));
		search.setType(OrderStatus.FINISHED);
		mv.addObject("data", service.findOrder(search));
		mv.setViewName(Template.ORDER_FINISHED);
		return mv;
	}
	
	@RequestMapping(Url.ORDER_ALL)
	public ModelAndView all(@ModelAttribute("seach")OrderPage search, 
			HttpServletRequest request,
			ModelAndView mv) {
		search.setPhone(WebUtil.getUserPhone(request));
		search.setType(null);
		mv.addObject("data", service.findOrder(search));
		mv.setViewName(Template.ORDER_ALL);
		return mv;
	}
	
}
