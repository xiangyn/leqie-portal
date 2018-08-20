package com.leqie.portal.service;

import java.util.Date;
import java.util.List;

import com.leqie.portal.model.ChartPriceData;

public interface PriceService {

	List<ChartPriceData> chartData(Date startDate, Date endDate);
	
	List<ChartPriceData> priceTopPageList(int size);
	
}
