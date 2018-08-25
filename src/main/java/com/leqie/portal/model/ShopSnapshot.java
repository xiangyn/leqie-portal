package com.leqie.portal.model;

public class ShopSnapshot {
	
	private int id;

	private String erjimulu;
	
	private String userPhone;
	
	private String length;
	
	private String zhonglei;
	
	private int productNum;;
	
	private String type;
	
	private boolean deleted;
	
	private float money;
	
	private float width;
	
	private float height;
	
	private User user;
	
	private long createDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getErjimulu() {
		return erjimulu;
	}

	public void setErjimulu(String erjimulu) {
		this.erjimulu = erjimulu;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	public String getZhonglei() {
		return zhonglei;
	}

	public void setZhonglei(String zhonglei) {
		this.zhonglei = zhonglei;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public boolean isDeleted() {
		return deleted;
	}

	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}

	public float getMoney() {
		return money;
	}

	public void setMoney(float money) {
		this.money = money;
	}

	public float getWidth() {
		return width;
	}

	public void setWidth(float width) {
		this.width = width;
	}

	public float getHeight() {
		return height;
	}

	public void setHeight(float height) {
		this.height = height;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public long getCreateDate() {
		return createDate;
	}

	public void setCreateDate(long createDate) {
		this.createDate = createDate;
	}

}
