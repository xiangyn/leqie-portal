package com.leqie.portal.service;

import java.util.List;

import com.leqie.portal.model.Order;
import com.leqie.portal.model.request.order.OrderMoney;
import com.leqie.portal.model.request.order.OrderPage;
import com.leqie.portal.model.request.order.OrderSave;
import com.leqie.portal.model.response.OrderMoneyResponse;

public interface OrderService {

	public List<Order> findOrder(OrderPage request);
	
	public Order getDetail(String no);
	
	public boolean saveOrder(OrderSave order);
	
	public OrderMoneyResponse getOrderMoney(OrderMoney request);
	
}
