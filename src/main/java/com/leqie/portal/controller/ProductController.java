package com.leqie.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leqie.portal.model.request.product.ZhengBanPage;
import com.leqie.portal.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService service;
	
	@RequestMapping("/app/product-zheng.jhtml")
	public ModelAndView zhengban(@ModelAttribute("search")ZhengBanPage search, ModelAndView mv) {
		mv.addObject("data", service.findZhengPage(search));
		mv.setViewName("/product/zheng");
		return mv;
	}
	
	@RequestMapping("/app/product-zheng-{id}.jhtml")
	public ModelAndView zhengbanProduct(@PathVariable("id")long id, ModelAndView mv) {
		mv.addObject("data", service.getProduct(id));
		mv.setViewName("/product/zheng-product");
		return mv;
	}
	
	@RequestMapping("/app/product-lingqie.jhtml")
	public ModelAndView lingqie(ModelAndView mv) {
		mv.addObject("cates", service.findCates());
		mv.setViewName("/product/lingqie");
		return mv;
	}
	
	@RequestMapping("/app/product-yuanbang.jhtml")
	public ModelAndView yuanbang(ModelAndView mv) {
		mv.addObject("cates", service.findCates());
		mv.setViewName("/product/yuanbang");
		return mv;
	}
	
	@RequestMapping("/app/product-xingcai.jhtml")
	public ModelAndView xingcai(ModelAndView mv) {
		mv.addObject("cates", service.findCates());
		mv.setViewName("/product/xingcai");
		return mv;
	}
	
	@RequestMapping("/app/product-guancai.jhtml")
	public ModelAndView guancai(ModelAndView mv) {
		mv.addObject("cates", service.findCates());
		mv.setViewName("/product/guancai");
		return mv;
	}
	
}