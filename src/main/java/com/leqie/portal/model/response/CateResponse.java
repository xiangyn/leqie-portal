package com.leqie.portal.model.response;

import java.util.List;

import com.leqie.portal.model.Cate;

public class CateResponse extends Response {

	private List<Cate> list;
	
	private String isNextPage;

	public List<Cate> getList() {
		return list;
	}

	public void setList(List<Cate> list) {
		this.list = list;
	}

	public String getIsNextPage() {
		return isNextPage;
	}

	public void setIsNextPage(String isNextPage) {
		this.isNextPage = isNextPage;
	}

	
}
