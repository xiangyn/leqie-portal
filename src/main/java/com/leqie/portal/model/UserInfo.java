package com.leqie.portal.model;

import org.hibernate.validator.constraints.NotBlank;

public class UserInfo {

	private String userId;
	
	@NotBlank
	private String name;
	
	private String headImgUrl;
	
	@NotBlank
	private String company;
	
	@NotBlank
	private String zhiwei;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHeadImgUrl() {
		return headImgUrl;
	}

	public void setHeadImgUrl(String headImgUrl) {
		this.headImgUrl = headImgUrl;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getZhiwei() {
		return zhiwei;
	}

	public void setZhiwei(String zhiwei) {
		this.zhiwei = zhiwei;
	}

}
