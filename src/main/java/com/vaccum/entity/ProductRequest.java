package com.vaccum.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class ProductRequest {
	
	private Integer requestId;
	
	private Integer buyerId;
	
	private Integer sellerId;
	
	private Integer sproductId;
	
	private Integer bproductId;
	
	public Integer getRequestId() {
		return requestId;
	}

	public void setRequestId(Integer requestId) {
		this.requestId = requestId;
	}

	public Integer getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(Integer buyerId) {
		this.buyerId = buyerId;
	}

	public Integer getSellerId() {
		return sellerId;
	}

	public void setSellerId(Integer sellerId) {
		this.sellerId = sellerId;
	}

	public Integer getSproductId() {
		return sproductId;
	}

	public void setSproductId(Integer sproductId) {
		this.sproductId = sproductId;
	}

	public Integer getBproductId() {
		return bproductId;
	}

	public void setBproductId(Integer bproductId) {
		this.bproductId = bproductId;
	}
	
	


}
