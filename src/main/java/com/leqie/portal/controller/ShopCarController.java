package com.leqie.portal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leqie.portal.model.request.ShopCarPage;
import com.leqie.portal.service.ShoppingCarService;
import com.leqie.portal.utils.WebUtil;

@Controller
public class ShopCarController {
	
	@Autowired
	private ShoppingCarService service;

	@RequestMapping("/app/shoppingCar.jhtml")
	public ModelAndView open(HttpServletRequest request, 
			@ModelAttribute("search")ShopCarPage search ,ModelAndView mv) {
		search.setPhone(WebUtil.getUserPhone(request));
		mv.addObject("data", service.getShopCarList(search));
		mv.setViewName("shoppingcar");
		return mv;
	}
}
