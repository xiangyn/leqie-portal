package com.leqie.portal.model.response;

public class ResultResponse<T> extends Response {

	private T result;

	public T getResult() {
		return result;
	}

	public void setResult(T result) {
		this.result = result;
	}

}
