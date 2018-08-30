package com.leqie.portal.model.response;

import java.util.List;

public class ListResponse<T> extends Response {

	private List<T> result;
	
	private int count;

	public List<T> getResult() {
		return result;
	}

	public void setResult(List<T> result) {
		this.result = result;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
}
