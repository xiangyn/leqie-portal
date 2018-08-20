package com.leqie.portal.model.response;

import java.util.List;

import com.leqie.portal.model.ProductZheng;

public class ProductZhengsResponse extends Response {

	private List<ProductZheng> result;

	public List<ProductZheng> getResult() {
		return result;
	}

	public void setResult(List<ProductZheng> result) {
		this.result = result;
	}
	
}
