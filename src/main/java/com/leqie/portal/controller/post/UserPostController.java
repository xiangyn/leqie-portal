package com.leqie.portal.controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.leqie.portal.model.ChangePwd;
import com.leqie.portal.model.User;
import com.leqie.portal.model.UserInfo;
import com.leqie.portal.service.UserService;
import com.leqie.portal.utils.WebUtil;
import com.leqie.portal.web.model.Result;
import com.leqie.portal.web.util.ResultUtil;

@RestController
@RequestMapping(method=RequestMethod.POST)
public class UserPostController {

	@Autowired
	private UserService service;
	
	@RequestMapping("/app/user/update.jo")
	public Result<Void> register(HttpServletRequest request,
			@Valid @ModelAttribute("model")UserInfo userInfo,BindingResult errors) {
		if(errors.hasErrors()) {
			return ResultUtil.error();
		}
		User user = WebUtil.getUser(request);
		userInfo.setUserId(WebUtil.getUserId(request));
		boolean success = service.updateUserInfo(userInfo);
		if(success) {
			user.setName(userInfo.getName());
			user.setCompany(userInfo.getCompany());
			user.setZhiwei(userInfo.getZhiwei());
		}
		return new Result<Void>(success);
	}
	
	@RequestMapping("/app/user/updatePwd.jo")
	public Result<Void> register(HttpServletRequest request,
			@Valid @ModelAttribute("model")ChangePwd pwd, BindingResult errors) {
		if(errors.hasErrors()) {
			return ResultUtil.error();
		}
		pwd.setUserId(WebUtil.getUserId(request));
		return new Result<Void>(service.changePwd(pwd));
	}
	
	@RequestMapping("/app/user/upload.jo")
	public Result<String> upload(
			@RequestParam("file")MultipartFile file) {
		String path = service.uploadFile(file);
		if(StringUtils.isEmpty(path)) {
			return ResultUtil.error();
		}
		return new Result<String>(path);
	}
	
}
