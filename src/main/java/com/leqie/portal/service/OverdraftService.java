package com.leqie.portal.service;

import com.leqie.portal.model.Overdraft;
import com.leqie.portal.model.OverdraftBill;
import com.leqie.portal.model.OverdraftPay;
import com.leqie.portal.model.Page;
import com.leqie.portal.model.request.UserIdPage;
import com.leqie.portal.model.response.EduResponse;

public interface OverdraftService {

	Overdraft getOverdraft(String userId);
	
	boolean applyOverdraft(Overdraft draft);
	
	boolean updateOverdraft(Overdraft draft);
	
	EduResponse getEdu(String userId);
	
	Page<OverdraftBill> getBill(UserIdPage search);
	
	Page<OverdraftPay> getPay(UserIdPage search);
	
}
