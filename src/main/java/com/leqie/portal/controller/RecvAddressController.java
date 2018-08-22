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
import com.leqie.portal.model.Address;
import com.leqie.portal.service.AddressService;
import com.leqie.portal.utils.WebUtil;

@Controller
public class RecvAddressController {

	@Autowired
	private AddressService service;
	
	@RequestMapping(Url.RECV_ADDRESS)
	public ModelAndView index(HttpServletRequest request, ModelAndView mv) {
		mv.addObject("data", service.getAddress(WebUtil.getUserId(request)));
		mv.setViewName(Template.RECV_ADDRESS_INDEX);
		return mv;
	}
	
	@RequestMapping(Url.RECV_ADDRESS_NEW)
	public ModelAndView newRecvAddress(ModelAndView mv) {
		mv.setViewName(Template.RECV_ADDRESS_NEW);
		return mv;
	}
	
	@RequestMapping(Url.RECV_ADDRESS_UPDATE)
	public ModelAndView updateRecvAddress(@RequestParam("id")int id, HttpServletRequest request, ModelAndView mv) {
		List<Address> list = service.getAddress(WebUtil.getUserId(request));
		for(Address address : list) {
			if(address.getId() == id) {
				mv.addObject("data", address);
			}
		}
		mv.setViewName(Template.RECV_ADDRESS_UPDATE);
		return mv;
	}
	
}
