package com.leqie.portal.controller.post;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.leqie.portal.constants.Session;
import com.leqie.portal.constants.Url;
import com.leqie.portal.model.ChartPriceData;
import com.leqie.portal.model.User;
import com.leqie.portal.model.request.LoginUser;
import com.leqie.portal.model.request.RegisterUser;
import com.leqie.portal.service.PriceService;
import com.leqie.portal.service.UserService;
import com.leqie.portal.utils.CommonUtil;
import com.leqie.portal.web.model.Result;
import com.leqie.portal.web.util.ResultUtil;

@RestController
@RequestMapping(method=RequestMethod.POST)
public class IndexPostController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private PriceService priceService;
	
	@RequestMapping(value=Url.LOGIN_DO)
	public Result<Void> login(
			HttpServletRequest request, 
			@Valid @ModelAttribute("model")LoginUser loginUser, 
			BindingResult errors) {
		if(errors.hasErrors()) {
			return ResultUtil.error();
		}
		User user = userService.login(loginUser);
		if(user != null) {
			request.getSession().setAttribute(Session.USER, user);
			return ResultUtil.success();
		}else {
			return ResultUtil.error();
		}
	}
	
	@RequestMapping(value=Url.REGISTER_DO)
	@ResponseBody
	public Result<Void> register(@Valid @ModelAttribute("model")RegisterUser user, BindingResult errors) {
		if(errors.hasErrors()) {
			return ResultUtil.error();
		}
		return new Result<Void>(userService.register(user));
	}
	
	@RequestMapping(value=Url.FORGET_DO, method=RequestMethod.POST)
	@ResponseBody
	public Result<Void> forget(@Valid @ModelAttribute("model")RegisterUser user, BindingResult errors) {
		if(errors.hasErrors()) {
			return ResultUtil.error();
		}
		return new Result<Void>(userService.forget(user));
	}
	
	@RequestMapping(value=Url.SMS_DO)
	@ResponseBody
	public Result<Void> sms(@RequestParam("phone")String phone) {
		if(!CommonUtil.isPhone(phone)) {
			return ResultUtil.error();
		}
		return new Result<Void>(userService.sms(phone));
	}
	
	@RequestMapping(value=Url.CHART_DATA_DO)
	@ResponseBody
	public Result<List<ChartPriceData>> chartData() {
		Date endDate = new Date();
		Date startDate = new Date(endDate.getTime() - (30L * 24 * 3600 * 1000));
		List<ChartPriceData> data = priceService.chartData(startDate, endDate);
		if(CollectionUtils.isEmpty(data)) {
			return ResultUtil.error();
		}
		return new Result<List<ChartPriceData>>(data);
	}
	
}
