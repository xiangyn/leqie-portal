package com.leqie.portal.web.util;

import com.leqie.portal.web.model.Result;

public class ResultUtil {

	private static final Result<?> ERROR = new Result<Object>(false);
	
	private static final Result<?> SUCCESS = new Result<Object>(true);
	
	@SuppressWarnings("unchecked")
	public static <T> Result<T> error() {
		return (Result<T>) ERROR;
	}
	
	@SuppressWarnings("unchecked")
	public static <T> Result<T> success() {
		return (Result<T>) SUCCESS;
	}
	
}
