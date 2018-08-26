package com.leqie.portal.controller.post;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.leqie.portal.model.InvoiceInfo;
import com.leqie.portal.service.InvoiceService;
import com.leqie.portal.utils.WebUtil;
import com.leqie.portal.web.model.Result;

@RestController
@RequestMapping(method=RequestMethod.POST)
public class InvoicePostController {
	
	@Autowired
	private InvoiceService service;
	
	@RequestMapping("/app/invoice/save.jo")
	public Result<Void> save(@ModelAttribute("model")InvoiceInfo model, HttpServletRequest request) {
		model.setUserId(WebUtil.getUserId(request));
		return new Result<Void>(service.saveInvoiceInfo(model));
	}
	
	@RequestMapping("/app/invoice/update.jo")
	public Result<Void> update(@ModelAttribute("model")InvoiceInfo model, HttpServletRequest request) {
		model.setUserId(WebUtil.getUserId(request));
		return new Result<Void>(service.updateInvoiceInfo(model));
	}
	
	@RequestMapping("/app/invoice/delete.jo")
	public Result<Void> update(@RequestParam("id")int id, HttpServletRequest request) {
		InvoiceInfo model = new InvoiceInfo();
		model.setUserId(WebUtil.getUserId(request));
		model.setFapiaoId(Integer.toString(id));
		return new Result<Void>(service.deleteInvoiceInfo(model));
	}
	
}
