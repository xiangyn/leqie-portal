package com.leqie.portal.model.request;

import org.hibernate.validator.constraints.NotBlank;

public class LoginUser {

	@NotBlank
	private String phone;
	
	@NotBlank
	private String password;

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
