package com.leqie.portal.model.request.order;

import com.leqie.portal.model.request.PageHead;

public class OrderPage extends PageHead {

	private String phone;
	
	private String type;  // 0:待付款；1：待收货；2:已完成；不传查找全部

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
		
}
