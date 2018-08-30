package com.leqie.portal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.leqie.portal.constants.ResponseStatus;
import com.leqie.portal.model.InvoiceInfo;
import com.leqie.portal.model.Order2;
import com.leqie.portal.model.request.InvoiceOrder;
import com.leqie.portal.model.response.ListResponse;
import com.leqie.portal.model.response.Response;
import com.leqie.portal.model.response.ResultResponse;
import com.leqie.portal.service.InvoiceService;

@Service
public class InvoiceServceImpl extends AbstarctService implements InvoiceService {

	public static class InvoiceInfosResp extends ResultResponse<List<InvoiceInfo>> {}
	@Override
	public List<InvoiceInfo> getByUserId(String userId) {
		InvoiceInfosResp resp = postOneParam(API.INVOICE_INFO, "userId", userId, InvoiceInfosResp.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp.getResult();
		}
		return new ArrayList<>();
	}

	@Override
	public boolean saveInvoiceInfo(InvoiceInfo info) {
		Response resp = post(API.INVOICE_NEW, info, Response.class);
		return resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus());
	}

	@Override
	public boolean updateInvoiceInfo(InvoiceInfo info) {
		Response resp = post(API.INVOICE_EDIT, info, Response.class);
		return resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus());
	}

	@Override
	public boolean deleteInvoiceInfo(InvoiceInfo model) {
		Response resp = post(API.INVOICE_DELETE, model, Response.class);
		return resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus());
	}
	
	public static class OrdersPesponse extends ListResponse<Order2> {}

	@Override
	public List<Order2> findOrderCanInvoice(InvoiceOrder search) {
		OrdersPesponse resp = post(API.ORDER_LIST, search, OrdersPesponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp.getResult();
		}
		return new ArrayList<>();
	}

}
