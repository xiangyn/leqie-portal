package com.leqie.portal.service;

import org.springframework.web.multipart.MultipartFile;

import com.leqie.portal.model.ChangePwd;
import com.leqie.portal.model.EnterpriseAuth;
import com.leqie.portal.model.User;
import com.leqie.portal.model.UserInfo;
import com.leqie.portal.model.request.LoginUser;
import com.leqie.portal.model.request.RegisterUser;

public interface UserService {

	User login(LoginUser user);
	
	EnterpriseAuth getAuth(String userId);
	
	boolean saveAuth(EnterpriseAuth auth);
	
	boolean updateAuth(EnterpriseAuth auth);
	
	boolean updateUserInfo(UserInfo user);
	
	boolean register(RegisterUser user);

	boolean sms(String telephone);

	boolean forget(RegisterUser user);
	
	boolean changePwd(ChangePwd pwd);

	String uploadFile(MultipartFile file);
	
}
