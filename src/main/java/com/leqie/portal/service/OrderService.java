package com.leqie.portal.service;

import com.leqie.portal.model.Order;
import com.leqie.portal.model.Order2;
import com.leqie.portal.model.Page;
import com.leqie.portal.model.request.order.OrderMoney;
import com.leqie.portal.model.request.order.OrderPage;
import com.leqie.portal.model.request.order.OrderSave;
import com.leqie.portal.model.response.OrderMoneyResponse;
import com.leqie.portal.web.model.Result;

public interface OrderService {

	public Page<Order2> findOrder(OrderPage request);
	
	public Order getDetail(String no);
	
	public Result<Void> saveOrder(OrderSave order);
	
	public OrderMoneyResponse getOrderMoney(OrderMoney request);
	
	public boolean cancelOrder(String no);
	
	public boolean finishOrder(String no);
	
}
