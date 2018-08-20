package com.leqie.portal.model.request;

import org.hibernate.validator.constraints.Length;

public class RegisterUser {

	@Length(min=11, max=11)
	private String phone;
	
	@Length(min=6, max=6)
	private String number;
	
	@Length(min=6, max=20)
	private String password1;
	
	@Length(min=6, max=20)
	private String password2;
	
	private String promotePhone;

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getPromotePhone() {
		return promotePhone;
	}

	public void setPromotePhone(String promotePhone) {
		this.promotePhone = promotePhone;
	}
	
}
