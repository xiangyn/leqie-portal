package com.leqie.portal.controller;

import com.alibaba.fastjson.JSONArray;
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

import static com.leqie.portal.constants.Url.SERVER_URL;

@RestController
@RequestMapping(Url.OVERDRAFT)
public class OverdraftController {

	/**
	 * 查看用户白条情况
	 * @param request
	 * @param mv
	 * @param map
	 * @return
	 */
	@GetMapping
	public ModelAndView index(HttpServletRequest request, ModelAndView mv,ModelMap map) {
		mv.setViewName(Template.OVERDRAFT_INDEX);
		User user = (User) request.getSession().getAttribute(Session.USER);
		String url = SERVER_URL+"/leqie/user/getBaitiaoById?userId=" + user.getId();
		String json = HttpHelper.httpGet(url);
		JSONObject result = JsonUtils.parse(json, JSONObject.class);
		if (Integer.parseInt(result.get("status").toString()) == 1) {
			if(result.get("result") != null && ((List) result.get("result")).size() ==0){
				map.put("tip", "applyOverdraft");
			}else {
				JSONObject list = (JSONObject)(((JSONArray) JSONArray.parse(JsonUtils.stringify(result.get("result")))).get(0));
				if(list.get("status").equals("待审核")) {
					map.put("tip", "editOverdraft");
				}else if(list.get("status").equals("审核通过")){
					map.put("tip", "showOverdraft");
				}else if(list.get("status").equals("审核拒绝")){
					map.put("tip", "refuseOverdraft");
				}
			}
			map.put("result", result.get("result"));
		}
		return mv;
	}

	/**
	 * 白条申请图片上传
	 * @param file
	 * @param response
	 * @return
	 * @throws IOException
	 */
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
		String url = SERVER_URL+"/leqie/user/upload";
		String json = FileUploadUtil.singleSubmitPost(url,excelFile);
		JSONObject result = JsonUtils.parse(json, JSONObject.class);
		System.out.println(result);
		return result;
	}

	/**
	 * 保存白条申请信息
	 * @param request
	 * @param map
	 * @return
	 */
	@PostMapping
	public Object save(HttpServletRequest request, ModelMap map) {
		User user = (User) request.getSession().getAttribute(Session.USER);
		String imgUrl1 = request.getParameter("imgUrl1");
		String imgUrl2 = request.getParameter("imgUrl2");
		String imgUrl3 = request.getParameter("imgUrl3");
		String imgUrl4 = request.getParameter("imgUrl4");

		NameValuePair[] params = new NameValuePair[5];
		params[0] = new BasicNameValuePair("userId", user.getId() + "");
		params[1] = new BasicNameValuePair("yingyezhizhao", imgUrl1);
		params[2] = new BasicNameValuePair("farenshenfenzheng", imgUrl2);
		params[3] = new BasicNameValuePair("yinhangliushui", imgUrl3);
		params[4] = new BasicNameValuePair("zulinhetong", imgUrl4);
		String url = SERVER_URL+"/leqie/user/saveBaitiao";
		String json = HttpHelper.httpPost(url, params, null, "application/json");
		JSONObject result = JsonUtils.parse(json, JSONObject.class);
		System.out.println(result);
		return result;
	}

	/**
	 * 编辑白条信息
	 * @param request
	 * @param map
	 * @return
	 */
	@PutMapping
	public Object update(HttpServletRequest request, ModelMap map) {
		String baitiaoId = request.getParameter("baitiaoId");
		String imgUrl1 = request.getParameter("imgUrl1");
		String imgUrl2 = request.getParameter("imgUrl2");
		String imgUrl3 = request.getParameter("imgUrl3");
		String imgUrl4 = request.getParameter("imgUrl4");

		NameValuePair[] params = new NameValuePair[5];
		params[0] = new BasicNameValuePair("baitiaoId", baitiaoId);
		params[1] = new BasicNameValuePair("yingyezhizhao", imgUrl1);
		params[2] = new BasicNameValuePair("farenshenfenzheng", imgUrl2);
		params[3] = new BasicNameValuePair("yinhangliushui", imgUrl3);
		params[4] = new BasicNameValuePair("zulinhetong", imgUrl4);
		String url = SERVER_URL+"/leqie/user/updateBaitiao";
		String json = HttpHelper.httpPost(url, params, null, "application/json");
		JSONObject result = JsonUtils.parse(json, JSONObject.class);
		System.out.println(result);
		return result;
	}

	/**
	 * 查询白条消费列表
	 * @param page
	 * @param request
	 * @param mv
	 * @param map
	 * @return
	 */
	@GetMapping("/billList")
	public ModelAndView billList(@RequestParam(name = "p") String page, HttpServletRequest request, ModelAndView mv, ModelMap map) {
		User user = (User) request.getSession().getAttribute(Session.USER);
		String url = SERVER_URL+"/leqie/user/baitiaoBillList?userId=" + user.getId() + "&pageNum=" + page+"&pageSize=10";
		System.out.println("--url--" + url);
		String json = HttpHelper.httpGet(url);
		JSONObject result = JsonUtils.parse(json, JSONObject.class);
		if (Integer.parseInt(result.get("status").toString()) == 1) {
			map.put("tip", "billList");
			map.put("billList", (List) result.get("result"));
			map.put("page", Integer.parseInt(page));
			map.put("totalRecords", ((List) result.get("result")).size());
		}
		mv.setViewName(Template.OVERDRAFT_INDEX);
		return mv;
	}

	/**
	 * 查询白条还款账单
	 * @param page
	 * @param request
	 * @param mv
	 * @param map
	 * @return
	 */
	@GetMapping("/repaymentList")
	public ModelAndView repaymentList(@RequestParam(name = "p") String page, HttpServletRequest request, ModelAndView mv, ModelMap map) {
		User user = (User) request.getSession().getAttribute(Session.USER);
		String url = SERVER_URL+"/leqie/user/baitiaoHuanKuanList?userId=" + user.getId() + "&pageNum=" + page+"&pageSize=10";
		System.out.println("--url--" + url);
		String json = HttpHelper.httpGet(url);
		JSONObject result = JsonUtils.parse(json, JSONObject.class);
		if (Integer.parseInt(result.get("status").toString()) == 1) {
			map.put("tip", "repaymentList");
			map.put("repaymentList", (List) result.get("result"));
			map.put("page", Integer.parseInt(page));
			map.put("totalRecords", ((List) result.get("result")).size());
		}
		mv.setViewName(Template.OVERDRAFT_INDEX);
		return mv;
	}

	/**
	 * 查询白条额度
	 * @param request
	 * @return
	 */
	@GetMapping("/money")
	public Object repaymentList(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(Session.USER);
		String url = SERVER_URL+"/leqie/user/getBaitiaoEDuById?userId=" + user.getId();
		System.out.println("--url--" + url);
		String json = HttpHelper.httpGet(url);
		JSONObject result = JsonUtils.parse(json, JSONObject.class);
		return result;
	}
}
