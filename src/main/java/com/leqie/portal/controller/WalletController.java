package com.leqie.portal.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.leqie.portal.constants.Session;
import com.leqie.portal.model.User;
import com.leqie.portal.remote.HttpHelper;
import com.leqie.portal.utils.JsonUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.leqie.portal.constants.Template;
import com.leqie.portal.constants.Url;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class WalletController {
	@RequestMapping(Url.WALLET)
	public ModelAndView index(HttpServletRequest request,ModelAndView mv, ModelMap map) {
		mv.setViewName(Template.WALLET_INDEX);

		User user = (User)request.getSession().getAttribute(Session.USER);
		String url = "http://118.31.35.233:8080/leqie/user/getQianBao?userId="+user.getId();
		String json = HttpHelper.httpGet(url);
		JSONObject result = JsonUtils.parse(json, JSONObject.class);
		if(Integer.parseInt(result.get("status").toString()) ==1) {
			map.put("tip", "userMoney");
			map.put("money", result.get("money"));
		}
		return mv;
	}
	
	@RequestMapping(Url.WALLET_RECORD)
	public ModelAndView newRecvAddress(ModelAndView mv) {
		mv.setViewName(Template.WALLET_RECORD);
		return mv;
	}

	@RequestMapping("app/wallet/chargeList")
	public ModelAndView chargeList(@RequestParam(name = "p") String page, HttpServletRequest request, ModelAndView mv, ModelMap map) {
		User user = (User)request.getSession().getAttribute(Session.USER);
		String url = "http://118.31.35.233:8080/leqie/user/qianbaoChongZhiList?userId="+user.getId()+"&pageNum="+page;
		System.out.println("--url--"+url);
		String json = HttpHelper.httpGet(url);
		JSONObject result = JsonUtils.parse(json, JSONObject.class);
		if(Integer.parseInt(result.get("status").toString()) ==1) {
			map.put("tip", "chargeList");
			map.put("chargeList",(List)result.get("result"));
			map.put("page",Integer.parseInt(page));
			map.put("totalRecords", ((List)result.get("result")).size());
		}
		mv.setViewName(Template.WALLET_INDEX);
		return mv;
	}

}
