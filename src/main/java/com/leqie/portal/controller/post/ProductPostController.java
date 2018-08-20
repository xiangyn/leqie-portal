package com.leqie.portal.controller.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.leqie.portal.model.request.order.OrderMoney;
import com.leqie.portal.model.request.order.OrderSave;
import com.leqie.portal.model.request.product.GuancaiNeijing;
import com.leqie.portal.model.request.product.GuancaiWaijing;
import com.leqie.portal.model.request.product.XingcaiHoudu;
import com.leqie.portal.model.request.product.XingcaiKuandu;
import com.leqie.portal.model.request.product.Zhengzhi;
import com.leqie.portal.model.response.OrderMoneyResponse;
import com.leqie.portal.service.OrderService;
import com.leqie.portal.service.ProductService;
import com.leqie.portal.web.model.ListResult;
import com.leqie.portal.web.model.Result;
import com.leqie.portal.web.util.ResultUtil;

@RestController
@RequestMapping(method=RequestMethod.POST)
public class ProductPostController {
	
	@Autowired
	private ProductService service;
	
	@Autowired
	private OrderService orderService;

	@RequestMapping("/app/product/getHoudu.jo")
	public ListResult<Integer> getHoudu(@ModelAttribute("params") XingcaiKuandu params) {
		List<Integer> data = service.getXingcaiHoudu(params);
		if(CollectionUtils.isEmpty(data)) {
			return new ListResult<>(false);
		}
		return new ListResult<>(data);
	}
	
	@RequestMapping("/app/product/getKuandu.jo")
	public ListResult<Integer> getKuandu(@ModelAttribute("params") XingcaiHoudu params) {
		List<Integer> data = service.getXingcaiKuandu(params);
		if(CollectionUtils.isEmpty(data)) {
			return new ListResult<>(false);
		}
		return new ListResult<>(data);
	}
	
	@RequestMapping("/app/product/getNeijing.jo")
	public ListResult<Integer> getKuandu(@ModelAttribute("params") GuancaiWaijing params) {
		List<Integer> data = service.getGuancaiNeijing(params);
		if(CollectionUtils.isEmpty(data)) {
			return new ListResult<>(false);
		}
		return new ListResult<>(data);
	}
	
	@RequestMapping("/app/product/getWaijing.jo")
	public ListResult<Integer> getKuandu(@ModelAttribute("params") GuancaiNeijing params) {
		List<Integer> data = service.getGuancaiWaijing(params);
		if(CollectionUtils.isEmpty(data)) {
			return new ListResult<>(false);
		}
		return new ListResult<>(data);
	}
	
	@RequestMapping("/app/product/getZhengzhi.jo")
	public ListResult<Integer> getKuandu(@ModelAttribute("params") Zhengzhi params) {
		List<Integer> data = service.getZhengzhi(params);
		if(CollectionUtils.isEmpty(data)) {
			return new ListResult<>(false);
		}
		return new ListResult<>(data);
	}
	
	@RequestMapping("/app/product/getMoney.jo")
	public Result<OrderMoneyResponse> getMoney(@ModelAttribute("params") OrderMoney params) {
		OrderMoneyResponse data = orderService.getOrderMoney(params);
		if(data == null) {
			return ResultUtil.error();
		}
		return new Result<OrderMoneyResponse>(data);
	}
	
	@RequestMapping("/app/product/order.jo")
	public Result<Void> order(@ModelAttribute("params") OrderSave params) {
		return new Result<Void>(orderService.saveOrder(params));
	}
}
