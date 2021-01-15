package com.vaccum.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class LogisticsDocument {
	
	private Integer logisticsId;
	
	private String QRPic;
	
	private Integer orderId;

	public Integer getLogisticsId() {
		return logisticsId;
	}

	public void setLogisticsId(Integer logisticsId) {
		this.logisticsId = logisticsId;
	}

	public String getQRPic() {
		return QRPic;
	}

	public void setQRPic(String qRPic) {
		QRPic = qRPic;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	
	


}
