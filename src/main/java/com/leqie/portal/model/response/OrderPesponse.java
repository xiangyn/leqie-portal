package com.leqie.portal.model.response;

import com.leqie.portal.model.Order;

public class OrderPesponse extends Response {

	private Order result;

	public Order getResult() {
		return result;
	}

	public void setResult(Order result) {
		this.result = result;
	}

}
