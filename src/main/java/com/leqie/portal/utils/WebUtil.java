package com.leqie.portal.utils;

import javax.servlet.http.HttpServletRequest;

import com.leqie.portal.constants.Session;
import com.leqie.portal.model.User;

public class WebUtil {

	public static User getUser(HttpServletRequest request) {
		return (User) request.getSession().getAttribute(Session.USER);
	}
	
	public static String getUserId(HttpServletRequest request) {
		User user = getUser(request);
		return user == null ? null : Integer.toString(user.getId());
	}
	
	public static String getUserPhone(HttpServletRequest request) {
		User user = getUser(request);
		return user == null ? null : user.getPhone();
	}
	
}
