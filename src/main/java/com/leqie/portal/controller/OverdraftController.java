package com.leqie.portal.controller;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.leqie.portal.constants.Session;
import com.leqie.portal.model.User;
import com.leqie.portal.remote.HttpHelper;
import com.leqie.portal.utils.FileUploadUtil;
import com.leqie.portal.utils.JsonUtils;
import org.apache.http.NameValuePair;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.leqie.portal.constants.Template;
import com.leqie.portal.constants.Url;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping(Url.OVERDRAFT)
public class OverdraftController {

	@GetMapping
	public ModelAndView index(HttpServletRequest request, ModelAndView mv,ModelMap map) {
		mv.setViewName(Template.OVERDRAFT_INDEX);
		User user = (User) request.getSession().getAttribute(Session.USER);
		String url = "http://118.31.35.233:8080/leqie/user/getBaitiaoById?userId=" + user.getId();
		String json = HttpHelper.httpGet(url);
		JSONObject result = JsonUtils.parse(json, JSONObject.class);
		if (Integer.parseInt(result.get("status").toString()) == 1) {
			if(result.get("result") != null && ((List) result.get("result")).size() ==0){
				map.put("tip", "applyOverdraft");
			}else {
				map.put("tip", "myOverdraft");
			}
			map.put("result", result.get("result"));
		}
		return mv;
	}

	@PostMapping("upload")
	public Object upload(@RequestParam(required=true,name = "pic") MultipartFile file, HttpServletResponse response) throws IOException {

		// 获取文件名
		String fileName = file.getOriginalFilename();
		// 获取文件后缀
		String prefix=fileName.substring(fileName.lastIndexOf("."));
		// 用uuid作为文件名，防止生成的临时文件重复
		File excelFile = File.createTempFile(System.currentTimeMillis()+"", prefix);
		// MultipartFile to File
		file.transferTo(excelFile);
		String url = "http://118.31.35.233:8080/leqie/user/upload";
		String json = FileUploadUtil.singleSubmitPost(url,excelFile);
		JSONObject result = JsonUtils.parse(json, JSONObject.class);
		System.out.println(result);
		return result;
	}

}
