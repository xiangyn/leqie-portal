package com.leqie.portal.model.response;

import com.leqie.portal.model.User;

public class UserResponse extends Response {

	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
