package com.leqie.portal.service;

import java.util.List;

import com.leqie.portal.model.Invoice;
import com.leqie.portal.model.InvoiceInfo;
import com.leqie.portal.model.Order2;
import com.leqie.portal.model.Page;
import com.leqie.portal.model.request.InvoiceOrder;
import com.leqie.portal.model.request.UserIdPage;

public interface InvoiceService {

	public List<InvoiceInfo> getByUserId(String userId);
	
	public boolean saveInvoiceInfo(InvoiceInfo info);
	
	public boolean updateInvoiceInfo(InvoiceInfo info);
	
	public boolean deleteInvoiceInfo(InvoiceInfo fapiaoId);
	
	public List<Order2> findOrderCanInvoice(InvoiceOrder search);
	
	public Page<Invoice> findInvoice(UserIdPage page);
		
}
