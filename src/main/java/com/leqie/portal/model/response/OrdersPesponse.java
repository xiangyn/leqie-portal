package com.leqie.portal.model.response;

import java.util.List;

import com.leqie.portal.model.Order;

public class OrdersPesponse extends Response {

	private List<Order> result;

	public List<Order> getResult() {
		return result;
	}

	public void setResult(List<Order> result) {
		this.result = result;
	}
	
}
