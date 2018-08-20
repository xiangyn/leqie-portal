package com.leqie.portal.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class ChartPriceData {
	
	private String priceChange;
	
	private String unit;
	
	@JsonIgnore
	private boolean deleted;
	
	private String name;
	
	private long riqi;
	
	private String averagePrice;
	
	@JsonIgnore
	private int id;
	
	private String source;
	
	private String priceRange;
	
	@JsonIgnore
	private long createDate;

	public String getPriceChange() {
		return priceChange;
	}

	public void setPriceChange(String priceChange) {
		this.priceChange = priceChange;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public boolean isDeleted() {
		return deleted;
	}

	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getRiqi() {
		return riqi;
	}

	public void setRiqi(long riqi) {
		this.riqi = riqi;
	}

	public String getAveragePrice() {
		return averagePrice;
	}

	public void setAveragePrice(String averagePrice) {
		this.averagePrice = averagePrice;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getPriceRange() {
		return priceRange;
	}

	public void setPriceRange(String priceRange) {
		this.priceRange = priceRange;
	}

	public long getCreateDate() {
		return createDate;
	}

	public void setCreateDate(long createDate) {
		this.createDate = createDate;
	}
	
}
