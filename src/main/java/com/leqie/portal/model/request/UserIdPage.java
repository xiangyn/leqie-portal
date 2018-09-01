package com.leqie.portal.model.request;

public class UserIdPage extends PageHead {

	private String userId;
	
	private String kaipiaoStatus;
	
	public UserIdPage() {
	}

	public UserIdPage(String userId) {
		this.userId = userId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getKaipiaoStatus() {
		return kaipiaoStatus;
	}

	public void setKaipiaoStatus(String kaipiaoStatus) {
		this.kaipiaoStatus = kaipiaoStatus;
	}

}