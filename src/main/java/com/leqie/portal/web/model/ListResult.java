package com.leqie.portal.web.model;

import java.util.List;

public class ListResult<T> extends Result<List<T>> {

	public ListResult() {
		super();
	}

	public ListResult(boolean success) {
		super(success);
	}

	public ListResult(List<T> data) {
		super(data);
	}

	
}
