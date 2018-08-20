package com.leqie.portal.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.leqie.portal.constants.ResponseStatus;
import com.leqie.portal.model.ChartPriceData;
import com.leqie.portal.model.request.ChartPriceRequest;
import com.leqie.portal.model.response.PriceResponse;
import com.leqie.portal.service.PriceService;
import com.leqie.portal.utils.DateUtil;

@Service
public class PriceServiceImpl extends AbstarctService implements PriceService {
	
	private static final String DATE_FORMAT = "yyyy-MM-dd";
	
	@Override
	public List<ChartPriceData> chartData(Date startDate, Date endDate) {
		ChartPriceRequest params = new ChartPriceRequest(DateUtil.format(startDate, DATE_FORMAT), DateUtil.format(endDate, DATE_FORMAT));
		PriceResponse resp = post(API.PRICE_LIST, params, PriceResponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp.getResult();
		}
		return new ArrayList<>();
	}

	@Override
	public List<ChartPriceData> priceTopPageList(int size) {
		PriceResponse resp = postOneParam(API.PRICE_PAGE_LIST, "pageSize", size, PriceResponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp.getResult();
		}
		return new ArrayList<>();
	}

}
