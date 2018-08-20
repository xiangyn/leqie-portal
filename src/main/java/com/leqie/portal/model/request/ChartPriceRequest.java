package com.leqie.portal.model.request;

public class ChartPriceRequest {

	private String beginDate;
	
	private String endDate;

	public ChartPriceRequest(String beginDate, String endDate) {
		super();
		this.beginDate = beginDate;
		this.endDate = endDate;
	}

	public String getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
}
