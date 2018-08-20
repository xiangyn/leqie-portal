package com.leqie.portal.service.impl;

import org.springframework.stereotype.Service;

import com.leqie.portal.constants.ResponseStatus;
import com.leqie.portal.model.User;
import com.leqie.portal.model.request.LoginUser;
import com.leqie.portal.model.request.RegisterUser;
import com.leqie.portal.model.response.Response;
import com.leqie.portal.model.response.UserResponse;
import com.leqie.portal.service.UserService;

@Service
public class UserServiceImpl extends AbstarctService implements UserService {

	@Override
	public User login(LoginUser user) {
		UserResponse resp = post(API.LOGIN, user, UserResponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp.getUser();
		}
		return null;
	}

	@Override
	public boolean register(RegisterUser user) {
		Response resp = post(API.REGISTER, user, UserResponse.class);
		return resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus());
	}
	
	@Override
	public boolean forget(RegisterUser user) {
		Response resp = post(API.FORGET_PWD, user, UserResponse.class);
		return resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus());
	}

	@Override
	public boolean sms(String telephone) {
		Response resp = postOneParam(API.SMS, "phone", telephone, UserResponse.class);
		return resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus());
	}
	
}
