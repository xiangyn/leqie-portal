package com.leqie.portal.model;

import java.util.List;

public class Order2 {

	private String no;
	
	private String status;
	
	private String totalMoney;
	
	private String wuliufei;
	
	private List<OrderDetail> detail;
	
	private String createDate;

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(String totalMoney) {
		this.totalMoney = totalMoney;
	}

	public String getWuliufei() {
		return wuliufei;
	}

	public void setWuliufei(String wuliufei) {
		this.wuliufei = wuliufei;
	}

	public List<OrderDetail> getDetail() {
		return detail;
	}

	public void setDetail(List<OrderDetail> detail) {
		this.detail = detail;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	
}
