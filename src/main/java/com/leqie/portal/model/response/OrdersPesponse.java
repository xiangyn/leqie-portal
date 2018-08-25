package com.leqie.portal.model.response;

import java.util.List;

import com.leqie.portal.model.Order2;

public class OrdersPesponse extends Response {

	private List<Order2> result;

	public List<Order2> getResult() {
		return result;
	}

	public void setResult(List<Order2> result) {
		this.result = result;
	}
	
}
