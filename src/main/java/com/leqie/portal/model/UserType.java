package com.leqie.portal.model;

public class UserType {

	private String secondLevel;
	
	private boolean deleted;
	
	private float money;
	
	private String name;
	
	private int discount;
	
	private String id;
	
	private String pic;
	
	private float firstLevel;

	public String getSecondLevel() {
		return secondLevel;
	}

	public void setSecondLevel(String secondLevel) {
		this.secondLevel = secondLevel;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public float getFirstLevel() {
		return firstLevel;
	}

	public void setFirstLevel(float firstLevel) {
		this.firstLevel = firstLevel;
	}

}
