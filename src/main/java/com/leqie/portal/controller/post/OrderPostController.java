package com.leqie.portal.controller.post;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.leqie.portal.model.request.order.OrderSave;
import com.leqie.portal.service.OrderService;
import com.leqie.portal.utils.WebUtil;
import com.leqie.portal.web.model.Result;

@RestController
@RequestMapping(method=RequestMethod.POST)
public class OrderPostController {
	
	@Autowired
	private OrderService service;
	
	@RequestMapping("/app/order/fast.jo")
	public Result<Void> save(HttpServletRequest request, @RequestParam("file")String file) {
		String userId = WebUtil.getUserId(request);
		return new Result<Void>(service.fastOrder(userId, file));
	}

	@RequestMapping("/app/order/save.jo")
	public Result<Void> save(HttpServletRequest request, @ModelAttribute("model")OrderSave order) {
		order.setPhone(WebUtil.getUserPhone(request));
		order.setUserId(WebUtil.getUserId(request));
		return service.saveOrder(order);
	}
	
	@RequestMapping("/app/order/cancel.jo")
	public Result<Void> cancel(@RequestParam("no")String no) {
		return new Result<Void>(service.cancelOrder(no));
	}
	
	@RequestMapping("/app/order/finish.jo")
	public Result<Void> finish(@RequestParam("no")String no) {
		return new Result<Void>(service.finishOrder(no));
	}
	
}
