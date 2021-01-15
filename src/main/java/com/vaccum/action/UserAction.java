package com.vaccum.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
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
public class UserAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String userPhone;
	
	@Autowired
	private User user;
	
	private Logger logger = Logger.getLogger(this.getClass());
	
    @Autowired
    private UserService userService;
    
    @Autowired
    private Order order;
    
    @Autowired
    private Product product;
    
    @Autowired
    private ProductRequest productRequest;
    
    private List<Order> orderList;
    
    private List<Product> productList;
    
    private List<String> productPicList;
    
    private List<ProductRequest> productRequestList;

	@Override
	public String execute() throws Exception {
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		//查询本用户的信息
		user.setUserPhone(userPhone);
		
		user = userService.findUserByPhone(user).get(0);
		
		System.out.println("电话:"+userPhone);
		
		//查找该用户所有的订单
		order.setBuyerPhone(userPhone);
		
		orderList = userService.findOrder(order);
		
		System.out.println("订单数:"+orderList.size());
		
		//查找该用户收到的请求,时间排序
		productRequest.setSellerId(user.getUserId());
		
		productRequestList = userService.findNumberOfRequest(productRequest);
		
		//查找本用户发布的商品
		product.setUserId(user.getUserId());
		
		productList = userService.findProductByUserId(product);
		
		String[] pic;
		
		productPicList = new ArrayList<String>();
		
		for(Product p:productList) {
			
			pic = p.getPicUrl().split(",");
			
			System.out.println("图片为:"+pic[0]);
	
			//存放一张显示图片
			if(pic.length!=0) {
				p.setPicUrl(pic[0]);
				productPicList.add(pic[0]);
			}
			
			System.out.println("图片为:"+productPicList.get(0));
			
		}
					
		if(productList!=null) {
			System.out.println("product:"+productList);
		}
		
		logger.info("查询成功");
		
		session.setAttribute("productRequestList", productRequestList);
		
		session.setAttribute("orderList", orderList);
		
		session.setAttribute("productList", productList);
		
		session.setAttribute("productPicList", productPicList);
		
		return "userInfo";
		
	}

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}
	
	public List<Order> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}

	public List<ProductRequest> getProductRequestList() {
		return productRequestList;
	}

	public void setProductRequestList(List<ProductRequest> productRequestList) {
		this.productRequestList = productRequestList;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public ProductRequest getProductRequest() {
		return productRequest;
	}

	public void setProductRequest(ProductRequest productRequest) {
		this.productRequest = productRequest;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<String> getProductPicList() {
		return productPicList;
	}

	public void setProductPicList(List<String> productPicList) {
		this.productPicList = productPicList;
	}

}
