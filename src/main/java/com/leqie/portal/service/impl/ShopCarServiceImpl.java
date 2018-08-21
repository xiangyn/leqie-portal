package com.leqie.portal.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.leqie.portal.constants.ResponseStatus;
import com.leqie.portal.controller.ShopCarInfo;
import com.leqie.portal.model.response.ShopCarInfoResponse;
import com.leqie.portal.service.ShopCarService;

@Service
public class ShopCarServiceImpl extends AbstarctService implements ShopCarService {

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

}
