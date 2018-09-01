package com.leqie.portal.model.request;

public class PhonePage extends PageHead {

	private String phone;

	public PhonePage() {
		
	}
	
	public PhonePage(String phone) {
		this.phone = phone;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
