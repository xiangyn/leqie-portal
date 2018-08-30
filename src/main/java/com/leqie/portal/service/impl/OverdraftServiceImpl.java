package com.leqie.portal.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.leqie.portal.constants.ResponseStatus;
import com.leqie.portal.model.Overdraft;
import com.leqie.portal.model.OverdraftBill;
import com.leqie.portal.model.OverdraftPay;
import com.leqie.portal.model.Page;
import com.leqie.portal.model.request.UserIdPage;
import com.leqie.portal.model.response.EduResponse;
import com.leqie.portal.model.response.ListResponse;
import com.leqie.portal.model.response.Response;
import com.leqie.portal.service.OverdraftService;

@Service
public class OverdraftServiceImpl extends AbstarctService implements OverdraftService {

	public static class OverdraftsResp extends ListResponse<Overdraft> { }
	
	@Override
	public Overdraft getOverdraft(String userId) {
		OverdraftsResp resp = 
				postOneParam(API.OVERDRAFT_INFO, "userId", userId, OverdraftsResp.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			if(!CollectionUtils.isEmpty(resp.getResult())) {
				return resp.getResult().get(0);
			}
		}
		return null;
	}

	@Override
	public boolean applyOverdraft(Overdraft draft) {
		Response resp = post(API.OVERDRAFT_SAVE, draft, Response.class);
		return resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus());
	}

	@Override
	public boolean updateOverdraft(Overdraft draft) {
		Response resp = post(API.OVERDRAFT_UPDATE, draft, Response.class);
		return resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus());
	}

	@Override
	public EduResponse getEdu(String userId) {
		return postOneParam(API.OVERDRAFT_EDU, "userId", userId, EduResponse.class);
	}
	
	public static class OverdraftBillResp extends ListResponse<OverdraftBill> {}

	@Override
	public Page<OverdraftBill> getBill(UserIdPage search) {
		OverdraftBillResp resp =
				post(API.OVERDRAFT_BILL, search, OverdraftBillResp.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return new Page<>(search, resp);
		}
		return new Page<>();
	}
	
	public static class OverdraftPayResp extends ListResponse<OverdraftPay> {}

	@Override
	public Page<OverdraftPay> getPay(UserIdPage search) {
		OverdraftPayResp resp =
				post(API.OVERDRAFT_BILL, search, OverdraftPayResp.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return new Page<>(search, resp);
		}
		return new Page<>();
	}

}
