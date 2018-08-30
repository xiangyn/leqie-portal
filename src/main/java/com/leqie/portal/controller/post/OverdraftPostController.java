package com.leqie.portal.controller.post;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.leqie.portal.model.Overdraft;
import com.leqie.portal.model.OverdraftBill;
import com.leqie.portal.model.OverdraftPay;
import com.leqie.portal.model.Page;
import com.leqie.portal.model.request.UserIdPage;
import com.leqie.portal.service.OverdraftService;
import com.leqie.portal.utils.WebUtil;
import com.leqie.portal.web.model.Result;

@RestController
@RequestMapping(method=RequestMethod.POST)
public class OverdraftPostController {

	@Autowired
	private OverdraftService service;
	
	@RequestMapping("/app/overdraft/apply.jo")
	public Result<Void> apply(@ModelAttribute("model")Overdraft model, HttpServletRequest request) {
		String userId = WebUtil.getUserId(request);
		model.setUserId(userId);
		if(model.getBaitiaoId() != 0) {
			return new Result<Void>(service.updateOverdraft(model));
		}
		return new Result<Void>(service.applyOverdraft(model));
	}
	
	@RequestMapping("/app/overdraft/bill.jo")
	public Result<Page<OverdraftBill>> bill(@ModelAttribute("search")UserIdPage search, HttpServletRequest request) {
		search.setUserId(WebUtil.getUserId(request));
		Page<OverdraftBill> page = service.getBill(search);
		return new Result<Page<OverdraftBill>>(page);
	}
	
	@RequestMapping("/app/overdraft/payRecord.jo")
	public Result<Page<OverdraftPay>> payRecord(@ModelAttribute("search")UserIdPage search, HttpServletRequest request) {
		search.setUserId(WebUtil.getUserId(request));
		Page<OverdraftPay> page = service.getPay(search);
		return new Result<Page<OverdraftPay>>(page);
	}
	
}
