package com.leqie.portal.controller;

import java.io.IOException;
import java.nio.charset.Charset;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.util.URLEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.leqie.portal.constants.Session;
import com.leqie.portal.constants.Template;
import com.leqie.portal.constants.Url;
import com.leqie.portal.remote.RemoteServer;
import com.leqie.portal.service.PriceService;

@Controller
public class IndexController {
	
	@Autowired
	private PriceService priceService;

	@RequestMapping({"", Url.INDEX})
	public ModelAndView index(ModelAndView mv) {
		mv.addObject("prices", priceService.priceTopPageList(4));
		mv.setViewName(Template.INDEX);
		return mv;
	}
	
	@RequestMapping(Url.LOGIN)
	public ModelAndView login(
			@RequestParam(value="redirect", defaultValue="")String redirectUrl,
			HttpServletRequest request, 
			ModelAndView mv) {
		if(StringUtils.isEmpty(redirectUrl)) {
			redirectUrl = new URLEncoder().encode(request.getContextPath() + Url.INDEX, 
					Charset.forName(request.getCharacterEncoding()));
		}
		mv.addObject("redirectUrl", redirectUrl);
		mv.setViewName(Template.LOGIN);
		return mv;
	}
	
	@RequestMapping(Url.FORGET)
	public String forget() {
		return Template.FORGET;
	}
	
	@RequestMapping(Url.LOGOUT)
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute(Session.USER);
		request.getSession().removeAttribute(Session.SHOPCAR_COUNT);
		return "redirect:"+Url.INDEX;
	}
	
	@RequestMapping(Url.REGISTER)
	public String register() {
		return Template.REGISTER;
	}
	
	@RequestMapping(Url.COMPANY)
	public String company(@PathVariable("child")String child) {
		return "company/" + child;
	}
	
	@Autowired
	private RemoteServer server;
	
	@RequestMapping("/u.jhtml")
	public void url(@RequestParam("u")String url, 
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		server.request(url, response.getOutputStream());
	}
	
}
