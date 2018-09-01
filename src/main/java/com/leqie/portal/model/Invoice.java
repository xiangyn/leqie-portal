package com.leqie.portal.model;

public class Invoice {

	private long id;
	
	private long createDate;
	
	private String orderIds;
	
	private String kaipiaoStatus;
	
	private String kaipiaotaitou;
	
	private float money;
	
	private String userId;
	
	private String fapiaoId;
	
	private String remark;
	
	private String wuliuStatus;
	
	private float wuliufei;
	
	private long kaipiaoTime;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getCreateDate() {
		return createDate;
	}

	public void setCreateDate(long createDate) {
		this.createDate = createDate;
	}

	public String getOrderIds() {
		return orderIds;
	}

	public void setOrderIds(String orderIds) {
		this.orderIds = orderIds;
	}

	public String getKaipiaoStatus() {
		return kaipiaoStatus;
	}

	public void setKaipiaoStatus(String kaipiaoStatus) {
		this.kaipiaoStatus = kaipiaoStatus;
	}

	public String getKaipiaotaitou() {
		return kaipiaotaitou;
	}

	public void setKaipiaotaitou(String kaipiaotaitou) {
		this.kaipiaotaitou = kaipiaotaitou;
	}

	public float getMoney() {
		return money;
	}

	public void setMoney(float money) {
		this.money = money;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFapiaoId() {
		return fapiaoId;
	}

	public void setFapiaoId(String fapiaoId) {
		this.fapiaoId = fapiaoId;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getWuliuStatus() {
		return wuliuStatus;
	}

	public void setWuliuStatus(String wuliuStatus) {
		this.wuliuStatus = wuliuStatus;
	}

	public float getWuliufei() {
		return wuliufei;
	}

	public void setWuliufei(float wuliufei) {
		this.wuliufei = wuliufei;
	}

	public long getKaipiaoTime() {
		return kaipiaoTime;
	}

	public void setKaipiaoTime(long kaipiaoTime) {
		this.kaipiaoTime = kaipiaoTime;
	}

}
