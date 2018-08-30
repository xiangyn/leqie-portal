package com.leqie.portal.service;

import java.util.List;

import com.leqie.portal.controller.ShopCarInfo;
import com.leqie.portal.model.ShopSnapshot;
import com.leqie.portal.model.ShopcarSave;
import com.leqie.portal.model.request.PhonePage;
import com.leqie.portal.model.request.order.OrderSave;
import com.leqie.portal.model.response.Response;

public interface ShoppingCarService {
	
	List<ShopSnapshot> getShopCarList(PhonePage search);
	
	ShopCarInfo getShopCarInfo(String userId);
	
	boolean addToShopCar(OrderSave order);
	
	boolean updateToShopCar(OrderSave order);
	
	boolean deleteInShopCar(String gouwucheId);
	
	Response saveToOrder(ShopcarSave shopcar);
	
}
