package com.leqie.portal.model;

import java.util.Collections;
import java.util.List;

import com.leqie.portal.model.request.PageHead;
import com.leqie.portal.model.response.ListResponse;

public class Page<T> extends PageHead {

	private int count;
	
	private List<T> data;
	
	public Page() { this.data = Collections.emptyList(); }
	
	public Page(PageHead head, ListResponse<T> resp) {
		this.setPageNum(head.getPageNum());
		this.setPageSize(head.getPageSize());
		if(resp != null) {
			this.setCount(resp.getCount());
			this.setData(resp.getResult());
		}
		if(this.data == null) {
			this.data = Collections.emptyList();
		}
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}
	
	public long getPages() {
		return (this.count % this.getPageSize() == 0) ? this.count / this.getPageSize() : this.count / this.getPageSize() + 1;
	}
	
}
