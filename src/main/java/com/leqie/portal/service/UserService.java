package com.leqie.portal.service;

import com.leqie.portal.model.User;
import com.leqie.portal.model.request.LoginUser;
import com.leqie.portal.model.request.RegisterUser;

public interface UserService {

	User login(LoginUser user);
	
	boolean register(RegisterUser user);

	boolean sms(String telephone);

	boolean forget(RegisterUser user);
	
}
