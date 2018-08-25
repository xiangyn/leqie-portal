package com.leqie.portal.model.response;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

public class ProductParamsResponse extends Response {

	@JsonInclude(Include.NON_ABSENT)
	private List<Float> changdus;
	
	@JsonInclude(Include.NON_ABSENT)
	private List<Float> kuangdus;
	
	@JsonInclude(Include.NON_ABSENT)
	private List<Float> houdus;
	
	@JsonInclude(Include.NON_ABSENT)
	private List<Float> neijings;
	
	@JsonInclude(Include.NON_ABSENT)
	private List<Float> waijings;
	
	@JsonInclude(Include.NON_ABSENT)
	private List<Float> zhijings;

	public List<Float> getChangdus() {
		return changdus;
	}

	public void setChangdus(List<Float> changdus) {
		this.changdus = changdus;
	}

	public List<Float> getKuangdus() {
		return kuangdus;
	}

	public void setKuangdus(List<Float> kuangdus) {
		this.kuangdus = kuangdus;
	}

	public List<Float> getHoudus() {
		return houdus;
	}

	public void setHoudus(List<Float> houdus) {
		this.houdus = houdus;
	}

	public List<Float> getNeijings() {
		return neijings;
	}

	public void setNeijings(List<Float> neijings) {
		this.neijings = neijings;
	}

	public List<Float> getWaijings() {
		return waijings;
	}

	public void setWaijings(List<Float> waijings) {
		this.waijings = waijings;
	}

	public List<Float> getZhijings() {
		return zhijings;
	}

	public void setZhijings(List<Float> zhijings) {
		this.zhijings = zhijings;
	}
	
}
