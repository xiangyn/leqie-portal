package com.leqie.portal.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.leqie.portal.constants.ResponseStatus;
import com.leqie.portal.model.Order;
import com.leqie.portal.model.Order2;
import com.leqie.portal.model.Page;
import com.leqie.portal.model.request.order.OrderMoney;
import com.leqie.portal.model.request.order.OrderPage;
import com.leqie.portal.model.request.order.OrderSave;
import com.leqie.portal.model.response.ListResponse;
import com.leqie.portal.model.response.OrderMoneyResponse;
import com.leqie.portal.model.response.OrderPesponse;
import com.leqie.portal.model.response.Response;
import com.leqie.portal.service.OrderService;
import com.leqie.portal.web.model.Result;

@Service
public class OrderServceiImpl extends AbstarctService implements OrderService {

	public static class OrdersPesponse extends ListResponse<Order2> {}
	
	@Override
	public Page<Order2> findOrder(OrderPage request) {
		OrdersPesponse resp = post(API.ORDER_LIST, request, OrdersPesponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return new Page<Order2>(request, resp);
		}
		return new Page<Order2>();
	}

	@Override
	public Order getDetail(String no) {
		OrderPesponse resp = postOneParam(API.ORDER_DETAIL, "no", no, OrderPesponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp.getResult();
		}
		return null;
	}

	@Override
	public Result<Void> saveOrder(OrderSave order) {
		Response resp = post(API.ORDER_SAVE, order, Response.class);
		if(resp != null) {
			if(ResponseStatus.SUCCESS.equals(resp.getStatus())) {
				return new Result<Void>(true);
			}else {
				return new Result<Void>(false, resp.getMsg());
			}
		}
		return new Result<Void>(false);
	}

	@Override
	public OrderMoneyResponse getOrderMoney(OrderMoney request) {
		return post(API.ORDER_MONEY, request, OrderMoneyResponse.class);
	}

	@Override
	public boolean cancelOrder(String no) {
		Response resp = postOneParam(API.ORDER_CANCEL, "no", no, Response.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return true;
		}
		return false;
	}

	@Override
	public boolean finishOrder(String no) {
		Response resp = postOneParam(API.ORDER_CANCEL, "no", no, Response.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return true;
		}
		return false;
	}

	@Override
	public boolean fastOrder(String userId, String file) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("userId", userId);
		params.put("file", file);
		Response resp = post(API.ORDER_PIC_ORDER, params, Response.class);
		return resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus());
	}
	
}
