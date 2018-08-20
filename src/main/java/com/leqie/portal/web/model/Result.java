package com.leqie.portal.web.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

public class Result<T> {

	private boolean success;
	
	@JsonInclude(Include.NON_NULL)
	private T data;
	
	public Result() { 
		this.success = true;
	}
	
	public Result(boolean success) {
		this.success = success;
	}
	
	public Result(T data) {
		this.success = true;
		this.data = data;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	
}
