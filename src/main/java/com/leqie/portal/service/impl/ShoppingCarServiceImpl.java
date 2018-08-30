package com.leqie.portal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.leqie.portal.constants.ResponseStatus;
import com.leqie.portal.controller.ShopCarInfo;
import com.leqie.portal.model.ShopSnapshot;
import com.leqie.portal.model.ShopcarSave;
import com.leqie.portal.model.request.PhonePage;
import com.leqie.portal.model.request.order.OrderSave;
import com.leqie.portal.model.response.Response;
import com.leqie.portal.model.response.ResultResponse;
import com.leqie.portal.model.response.ShopCarInfoResponse;
import com.leqie.portal.service.ShoppingCarService;

@Service
public class ShoppingCarServiceImpl extends AbstarctService implements ShoppingCarService {

	@Override
	public ShopCarInfo getShopCarInfo(String userId) {
		ShopCarInfoResponse resp = 
				postOneParam(API.SHOPCAR_INFO, "userUid", userId, ShopCarInfoResponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			if(!CollectionUtils.isEmpty(resp.getResult())) {
				return resp.getResult().get(0);
			}
		}
		return null;
	}

	public static final class ShopSnapshotResp extends ResultResponse<List<ShopSnapshot>> {}
	
	@Override
	public List<ShopSnapshot> getShopCarList(PhonePage search) {
		ShopSnapshotResp resp =
				post(API.SHOPCAR_LIST, search, ShopSnapshotResp.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			if(!CollectionUtils.isEmpty(resp.getResult())) {
				return resp.getResult();
			}
		}
		return new ArrayList<ShopSnapshot>();
	}

	@Override
	public boolean addToShopCar(OrderSave order) {
		Response resp = 
				post(API.SHOPCAR_ADD, order, Response.class);
		return resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus());
	}

	@Override
	public boolean deleteInShopCar(String gouwucheId) {
		Response resp = 
				postOneParam(API.SHOPCAR_DELETE, "gouwucheId", gouwucheId, Response.class);
		return resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus());
	}

	@Override
	public boolean updateToShopCar(OrderSave order) {
		Response resp = 
				post(API.SHOPCAR_UPDATE, order, Response.class);
		return resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus());
	}

	@Override
	public Response saveToOrder(ShopcarSave shopcar) {
		return post(API.SHOPCAT_ORDER, shopcar, Response.class);
	}
	

}
