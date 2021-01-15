package com.vaccum.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class Order {
	
	private Integer orderId;
	
	private String bproductPic;
	
	private String bproductName;
	
	private String buyerName; 
	
	private String address;
	
	private String buyerPhone;
	
	private String sproductPic;
	
	private String sproductName;
	
	private String sellerName;
	
	private String sellerPhone;
	
	private Integer status;
	
	private Integer bproductId;
	
	private Integer sproductId;

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBuyerPhone() {
		return buyerPhone;
	}

	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone = buyerPhone;
	}

	public String getSellerPhone() {
		return sellerPhone;
	}

	public void setSellerPhone(String sellerPhone) {
		this.sellerPhone = sellerPhone;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public String getBproductName() {
		return bproductName;
	}

	public void setBproductName(String bproductName) {
		this.bproductName = bproductName;
	}

	public String getSproductName() {
		return sproductName;
	}

	public void setSproductName(String sproductName) {
		this.sproductName = sproductName;
	}

	public String getBproductPic() {
		return bproductPic;
	}

	public void setBproductPic(String bproductPic) {
		this.bproductPic = bproductPic;
	}

	public String getSproductPic() {
		return sproductPic;
	}

	public void setSproductPic(String sproductPic) {
		this.sproductPic = sproductPic;
	}

	public Integer getBproductId() {
		return bproductId;
	}

	public void setBproductId(Integer bproductId) {
		this.bproductId = bproductId;
	}

	public Integer getSproductId() {
		return sproductId;
	}

	public void setSproductId(Integer sproductId) {
		this.sproductId = sproductId;
	}

}
