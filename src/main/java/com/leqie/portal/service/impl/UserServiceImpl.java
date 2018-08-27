package com.leqie.portal.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import com.leqie.portal.constants.ResponseStatus;
import com.leqie.portal.model.ChangePwd;
import com.leqie.portal.model.EnterpriseAuth;
import com.leqie.portal.model.User;
import com.leqie.portal.model.UserInfo;
import com.leqie.portal.model.request.LoginUser;
import com.leqie.portal.model.request.RegisterUser;
import com.leqie.portal.model.response.Response;
import com.leqie.portal.model.response.ResultResponse;
import com.leqie.portal.model.response.UploadResponse;
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
	
	public static class EnterpriseAuthResp extends ResultResponse<List<EnterpriseAuth>> { }
	
	@Override
	public EnterpriseAuth getAuth(String userId) {
		EnterpriseAuthResp resp =
				postOneParam(API.ENTERPRISE_AUTH, "userId", userId, EnterpriseAuthResp.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			if(!CollectionUtils.isEmpty(resp.getResult())) {
				return resp.getResult().get(0);
			}
		}
		return null;
	}
	
	@Override
	public boolean saveAuth(EnterpriseAuth auth) {
		Response resp = post(API.ENTERPRISE_SAVE_AUTH, auth, Response.class);
		return resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus());
	}
	
	@Override
	public boolean updateAuth(EnterpriseAuth auth) {
		Response resp = post(API.ENTERPRISE_UPDATE_AUTH, auth, Response.class);
		return resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus());
	}
	
	@Override
	public boolean updateUserInfo(UserInfo user) {
		Response resp = post(API.UPDATE_INFO, user, Response.class);
		return resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus());
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
	
	@Override
	public boolean changePwd(ChangePwd pwd) {
		Response resp = post(API.CHANGE_PWD, pwd, Response.class);
		return resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus());
	}
	
	@Override
	public String uploadFile(MultipartFile file) {
		File tempFile = null;
		try {
			String fileName = file.getOriginalFilename();
			tempFile = File.createTempFile("leqie", fileName.substring(fileName.lastIndexOf(".")));
			file.transferTo(tempFile);
			UploadResponse resp = 
					server.uploadFile(API.USER_UPLOAD, "file", tempFile, UploadResponse.class);
			if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
				return resp.getPath();
			}
			return null;
		}catch (IOException e) {
			e.printStackTrace();
		}finally {
			if(tempFile != null) {
				tempFile.delete();
			}
		}
		
		return null;
	}
	
}
