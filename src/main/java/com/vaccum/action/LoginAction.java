package com.vaccum.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.vaccum.entity.Product;
import com.vaccum.entity.ProductRequest;
import com.vaccum.entity.User;
import com.vaccum.service.UserService;

@Controller
@Scope("prototype")
public class LoginAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
    private UserService userService;
	
	@Autowired
	private User user;
	
	@Autowired
	private ProductRequest productRequest;
	
	private String userPhone;
	
	public String getUserPhone() {
		return userPhone;
	}



	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}



	private String passWord;
	
	private List<Product> productList;
	
	private List<Product> myProductList;
	
	private List<ProductRequest> productRequestList;
	
	private List<String> productPicList;
	
	private List<String> myProductPicList;
	
	private int requestNumber;

	@Override
	public String execute() throws Exception {
		
		//检验登录
//		ValueStack valueStack = ActionContext.getContext().getValueStack();
//		
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		List<User> userList;
		
		user.setUserPhone(userPhone);
		
		user.setPassWord(passWord);
		
		userList = userService.findUserByPhone(user);
		
		if(userList != null) {
			
			user = userList.get(0);
			
			session.setAttribute("user", user);
			
			productRequest.setSellerId(user.getUserId());
			
			//查询作为卖家的请求
			productRequestList = userService.findNumberOfRequest(productRequest);
			
			//保存请求数量
			if(productRequestList!=null) requestNumber = productRequestList.size();
			
			else requestNumber=0;
			
			System.out.println(userList.size());
			
			//查询所有商品保存在ValueStack
			productList = userService.findAllProduct();
			
			String[] pic = {};
			
			productPicList = new ArrayList<String>();
			
			myProductPicList = new ArrayList<String>();
			
			myProductList = new ArrayList<Product>();
			
			for(Product p:productList) {
				
				pic = p.getPicUrl().split(",");
				
				//存放一张显示图片
				System.out.println(pic[0]);
				
				if(pic.length!=0) {
					
					productPicList.add(pic[0]);
					
					p.setPicUrl(pic[0]);
				}
				
				if(p.getUserId() == user.getUserId()) {
					
					myProductList.add(p);
					
					//存放用户自己商品的一张图片
					if(pic.length!=0) {
						
						p.setPicUrl(pic[0]);
						
						myProductPicList.add(pic[0]);
						
					}
					
				}
				
			}
			
			System.out.println(user.getUserPhoto());
			
			return "user";
			
		}else {
			
//			valueStack.set("erro", "请注册！");
			
			return "rigister";
		}
		
	}
	
		

	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}



	public ProductRequest getProductRequest() {
		return productRequest;
	}



	public void setProductRequest(ProductRequest productRequest) {
		this.productRequest = productRequest;
	}



	public int getRequestNumber() {
		return requestNumber;
	}



	public void setRequestNumber(int requestNumber) {
		this.requestNumber = requestNumber;
	}



	public List<ProductRequest> getProductRequestList() {
		return productRequestList;
	}



	public void setProductRequestList(List<ProductRequest> productRequestList) {
		this.productRequestList = productRequestList;
	}



	public List<Product> getMyProductList() {
		return myProductList;
	}



	public void setMyProductList(List<Product> myProductList) {
		this.myProductList = myProductList;
	}



	public List<String> getProductPicList() {
		return productPicList;
	}



	public void setProductPicList(List<String> productPicList) {
		this.productPicList = productPicList;
	}



	public List<String> getMyProductPicList() {
		return myProductPicList;
	}



	public void setMyProductPicList(List<String> myProductPicList) {
		this.myProductPicList = myProductPicList;
	}
	
}
