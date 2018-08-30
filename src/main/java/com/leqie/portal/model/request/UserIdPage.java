package com.leqie.portal.model.request;

public class UserIdPage extends PageHead {

	private String userId;

	public UserIdPage(String userId) {
		this.userId = userId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}