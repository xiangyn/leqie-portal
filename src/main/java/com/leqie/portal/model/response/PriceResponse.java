package com.leqie.portal.model.response;

import java.util.List;

import com.leqie.portal.model.ChartPriceData;

public class PriceResponse extends Response {

	private List<ChartPriceData> result;

	public List<ChartPriceData> getResult() {
		return result;
	}

	public void setResult(List<ChartPriceData> result) {
		this.result = result;
	}
	
}
