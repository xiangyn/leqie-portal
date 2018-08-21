package com.leqie.portal.model.response;

import java.util.List;

import com.leqie.portal.controller.ShopCarInfo;

public class ShopCarInfoResponse extends Response {

	private List<ShopCarInfo> result;

	public List<ShopCarInfo> getResult() {
		return result;
	}

	public void setResult(List<ShopCarInfo> result) {
		this.result = result;
	}
	
}
