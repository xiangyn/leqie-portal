package com.leqie.portal.controller.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.leqie.portal.model.request.order.OrderMoney;
import com.leqie.portal.model.request.product.GuancaiNeijing;
import com.leqie.portal.model.request.product.GuancaiWaijing;
import com.leqie.portal.model.request.product.XingcaiHoudu;
import com.leqie.portal.model.request.product.XingcaiKuandu;
import com.leqie.portal.model.request.product.Zhengzhi;
import com.leqie.portal.model.response.OrderMoneyResponse;
import com.leqie.portal.model.response.ProductParamsResponse;
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
	
	
	@RequestMapping("/app/product/getParams.jo")
	public Result<ProductParamsResponse> getParams(
			@RequestParam("zhonglei")String zhonglei, @RequestParam("xinghaoId")String xinghaoId) {
		ProductParamsResponse data = service.getParams(zhonglei, xinghaoId);
		if(data == null) {
			return ResultUtil.error();
		}
		return new Result<ProductParamsResponse>(data);
	}

	@RequestMapping("/app/product/getHoudu.jo")
	public ListResult<Float> getHoudu(@ModelAttribute("params") XingcaiKuandu params) {
		List<Float> data = service.getXingcaiHoudu(params);
		if(CollectionUtils.isEmpty(data)) {
			return new ListResult<>(false);
		}
		return new ListResult<>(data);
	}
	
	@RequestMapping("/app/product/getKuandu.jo")
	public ListResult<Float> getKuandu(@ModelAttribute("params") XingcaiHoudu params) {
		List<Float> data = service.getXingcaiKuandu(params);
		if(CollectionUtils.isEmpty(data)) {
			return new ListResult<>(false);
		}
		return new ListResult<>(data);
	}
	
	@RequestMapping("/app/product/getNeijing.jo")
	public ListResult<Float> getKuandu(@ModelAttribute("params") GuancaiWaijing params) {
		List<Float> data = service.getGuancaiNeijing(params);
		if(CollectionUtils.isEmpty(data)) {
			return new ListResult<>(false);
		}
		return new ListResult<>(data);
	}
	
	@RequestMapping("/app/product/getWaijing.jo")
	public ListResult<Float> getKuandu(@ModelAttribute("params") GuancaiNeijing params) {
		List<Float> data = service.getGuancaiWaijing(params);
		if(CollectionUtils.isEmpty(data)) {
			return new ListResult<>(false);
		}
		return new ListResult<>(data);
	}
	
	@RequestMapping("/app/product/getZhengzhi.jo")
	public ListResult<Float> getKuandu(@ModelAttribute("params") Zhengzhi params) {
		List<Float> data = service.getZhengzhi(params);
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
	
}
