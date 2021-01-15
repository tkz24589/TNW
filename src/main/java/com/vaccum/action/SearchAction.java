package com.vaccum.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.vaccum.entity.Product;
import com.vaccum.service.UserService;

@Controller
@Scope("prototype")
public class SearchAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
    private UserService userService;
	
	private List<Product> productList;
	
	private List<Object> productListall = new ArrayList<Object>();

	@Override
	public String execute() throws Exception {
		
		productList = userService.findAllProduct();
		
		String[] pic= {};
		
		for(Product p :productList) {
			
			pic = p.getPicUrl().split(",");
			
			p.setPicUrl(pic[0]);
			
			productListall.add(pic);
			
		}
		
		return SUCCESS;
	}

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}
	
	public List<Object> getProductListall() {
		return productListall;
	}

	public void setProductListall(List<Object> productListall) {
		this.productListall = productListall;
	}
	
	

}
