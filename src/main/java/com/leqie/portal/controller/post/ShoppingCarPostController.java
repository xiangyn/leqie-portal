package com.leqie.portal.controller.post;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.leqie.portal.constants.ResponseStatus;
import com.leqie.portal.constants.Session;
import com.leqie.portal.model.ShopcarSave;
import com.leqie.portal.model.request.order.OrderSave;
import com.leqie.portal.model.response.Response;
import com.leqie.portal.service.ShoppingCarService;
import com.leqie.portal.utils.WebUtil;
import com.leqie.portal.web.model.Result;

@RestController
@RequestMapping(method=RequestMethod.POST)
public class ShoppingCarPostController {

	@Autowired
	private ShoppingCarService service;
	
	@RequestMapping("/app/shoppingcar/add.jo")
	public Result<Void> add(@ModelAttribute("model")OrderSave model, HttpServletRequest request) {
		model.setPhone(WebUtil.getUserPhone(request));
		boolean success = service.addToShopCar(model);
		if(success) {
			int count = (int)(request.getSession().getAttribute(Session.SHOPCAR_COUNT)) + 1;
			request.getSession().setAttribute(Session.SHOPCAR_COUNT, count);
		}
		return new Result<Void>(success);
	}
	
	@RequestMapping("/app/shoppingcar/update.jo")
	public Result<Void> update(@ModelAttribute("model")OrderSave model, HttpServletRequest request) {
		model.setPhone(WebUtil.getUserPhone(request));
		return new Result<Void>(service.updateToShopCar(model));
	}
	
	@RequestMapping("/app/shoppingcar/remove.jo")
	public Result<Void> remove(@RequestParam("id")String id, HttpServletRequest request) {
		boolean success = service.deleteInShopCar(id);
		int count = (int)(request.getSession().getAttribute(Session.SHOPCAR_COUNT)) - 1;
		request.getSession().setAttribute(Session.SHOPCAR_COUNT, count);
		return new Result<Void>(success);
	}
	
	@RequestMapping("/app/shoppingcar/order.jo")
	public Result<Response> order(@ModelAttribute("model")ShopcarSave model, HttpServletRequest request) {
		model.setPhone(WebUtil.getUserPhone(request));
		Response resp = service.saveToOrder(model);
		return new Result<Response>(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())).setData(resp);
	}
	
}
