package com.leqie.portal.model.response;

import java.util.List;

import com.leqie.portal.model.Address;

public class AddressesResponse extends Response {

	private List<Address> result;

	public List<Address> getResult() {
		return result;
	}

	public void setResult(List<Address> result) {
		this.result = result;
	}
	
}
