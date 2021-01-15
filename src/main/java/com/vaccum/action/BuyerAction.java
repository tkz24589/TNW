package com.vaccum.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.vaccum.entity.ProductRequest;
import com.vaccum.service.UserService;

@Controller
@Scope("prototype")
public class BuyerAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
    private UserService userService;
	
	@Autowired
	private ProductRequest productRequest;
	
	private Integer buyerId;
	
	private Integer sellerId;
	
	private Integer sproductId;
	
	private Integer bproductId;
	
	private String message;
	


	@Override
	public String execute() throws Exception {
		
		System.out.println("惺惺惜惺惺"+buyerId);
		
		productRequest.setBproductId(bproductId);
		
		productRequest.setBuyerId(buyerId);
		
		productRequest.setSellerId(sellerId);
		
		productRequest.setSproductId(sproductId);
		
		userService.save(productRequest);
		
		message="发送请求成功！";
		
		return SUCCESS;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public ProductRequest getProductRequest() {
		return productRequest;
	}

	public void setProductRequest(ProductRequest productRequest) {
		this.productRequest = productRequest;
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
