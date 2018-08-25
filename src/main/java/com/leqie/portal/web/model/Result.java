package com.leqie.portal.web.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

public class Result<T> {

	private boolean success;
	
	private String msg;
	
	@JsonInclude(Include.NON_NULL)
	private T data;
	
	public Result() { 
		this.success = true;
	}
	
	public Result(boolean success) {
		this.success = success;
	}
	
	public Result(boolean success, String msg) {
		this.success = success;
		this.msg = msg;
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

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public T getData() {
		return data;
	}

	public Result<T> setData(T data) {
		this.data = data;
		return this;
	}
	
}
