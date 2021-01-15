package com.vaccum.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.vaccum.entity.Order;
import com.vaccum.entity.Product;
import com.vaccum.entity.ProductRequest;
import com.vaccum.entity.User;
import com.vaccum.service.UserService;

@Controller
@Scope("prototype")
public class OrderAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
    private UserService userService;
	
	@Autowired
    private Product product;
	
	@Autowired
    private Order order;
	
	@Autowired
    private User user;
	
	@Autowired
    private ProductRequest productRequest;
	
	List<ProductRequest> plist;
	
	private Integer requestId;
	
	private Integer sellerId;
	
	private Integer buyerId;
	
	private Integer sproductId;
	
	private Integer bproductId;
	
	private String message;
	
	
	@Override
	public String execute() throws Exception {
		
		if(message==null) {

		//发布订单
		//我方
		System.out.println("卖家买家id："+sproductId+"  "+bproductId);
		
		order_in(sellerId,buyerId);
		
		order_in(buyerId,sellerId);
		
		message = "等待物流接货";
		
		//删除请求
		
		delete_request(sproductId);
		
		delete_request(bproductId);
		
		//删除相关商品
		
		delete_product(sproductId);
		
		delete_product(bproductId);
		
		}else {
			
			productRequest.setBproductId(bproductId);
			
			productRequest.setBuyerId(buyerId);
			
			productRequest.setSellerId(sellerId);
			
			productRequest.setSproductId(sproductId);
			
			productRequest = userService.findNumberOfRequest(productRequest).get(0);
			
			userService.delete(productRequest);
			
		}
		
		
		return SUCCESS;
	}

	private void order_in(Integer s, Integer b) {
		
        user.setUserId(s);
		
		user = userService.findUserById(user).get(0);
		
		product = userService.findByProductId(sproductId).get(0);
		
		order.setSproductId(sproductId);
		
		order.setSproductName(product.getProductName());
		
		order.setSproductPic(product.getPicUrl().split(",")[0]);
		
		order.setSellerName(user.getUserName());
		
		order.setSellerPhone(user.getUserPhone());
		
		user.setUserId(b);
		
		user = userService.findUserById(user).get(0);
		
		product = userService.findByProductId(bproductId).get(0);
		
        order.setBproductId(sproductId);
		
		order.setBproductName(product.getProductName());
		
		order.setBproductPic(product.getPicUrl().split(",")[0]);
		
		order.setBuyerName(user.getUserName());
		
		order.setBuyerPhone(user.getUserPhone());
		
		order.setAddress(user.getAddress());
		
		order.setStatus(0);
		
		userService.save(order);
		
	}

	private void delete_product(Integer productId) {
		
		product.setProductId(productId);
		
		userService.delete(product);
		
	}

	private void delete_request(Integer productId) {
		
        productRequest.setSproductId(productId);
		
		plist = userService.findNumberOfRequest(productRequest);
		
		for(ProductRequest p:plist) {
			
			userService.delete(p);
			
		}
		
        productRequest.setBproductId(productId);
		
		plist = userService.findNumberOfRequest(productRequest);
		
		for(ProductRequest p:plist) {
			
			userService.delete(p);
			
		}
		
	}

	public Integer getSellerId() {
		return sellerId;
	}

	public void setSellerId(Integer sellerId) {
		this.sellerId = sellerId;
	}

	public Integer getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(Integer buyerId) {
		this.buyerId = buyerId;
	}

	public Integer getSproductId() {
		return sproductId;
	}

	public void setSproductId(Integer sproductId) {
		this.sproductId = sproductId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getBproductId() {
		return bproductId;
	}

	public void setBproductId(Integer bproductId) {
		this.bproductId = bproductId;
	}

	public ProductRequest getProductRequest() {
		return productRequest;
	}

	public void setProductRequest(ProductRequest productRequest) {
		this.productRequest = productRequest;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Integer getRequestId() {
		return requestId;
	}

	public void setRequestId(Integer requestId) {
		this.requestId = requestId;
	}

}
