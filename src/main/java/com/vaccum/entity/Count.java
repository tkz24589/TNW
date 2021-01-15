package com.vaccum.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class Count {
	
	private Integer countId;
	
	private float fund;
	
	private Integer userId;
	
	

	public Integer getCountId() {
		return countId;
	}

	public void setCountId(Integer countId) {
		this.countId = countId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public float getFund() {
		return fund;
	}

	public void setFund(float fund) {
		this.fund = fund;
	}
	
	

}
