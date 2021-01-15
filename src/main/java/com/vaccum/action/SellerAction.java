package com.vaccum.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.vaccum.entity.Product;
import com.vaccum.entity.ProductRequest;
import com.vaccum.service.UserService;

@Controller
@Scope("prototype")
public class SellerAction extends ActionSupport implements ModelDriven<ProductRequest>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
    private UserService userService;
	
	@Autowired
	private Product product;
	
	@Autowired
    private ProductRequest productRequest;
    
    private List<String> spicList = new ArrayList<String>();
    
    private List<Product> sproductlist = new ArrayList<Product>();
    
    private List<String> bpicList = new ArrayList<String>();
    
    private List<Product> bproductlist = new ArrayList<Product>();

	@Override
	public ProductRequest getModel() {
		return productRequest;
	}

	@Override
	public String execute() throws Exception {
		
		Integer productId;
		//查询双方交换的产品的具体内容，seller存入list前，buyer存入list后，然后遍历
		productRequest = userService.findNumberOfRequest(productRequest).get(0);
		
		System.out.println("请求id为:"+productRequest.getRequestId()+"\n商品id为："+productRequest.getSproductId()+" "+productRequest.getBproductId());
		
		productId = productRequest.getSproductId();
		
		product.setProductId(productId);
		
		sproductlist = userService.findByProductId(productId);
		
		productId = productRequest.getBproductId();
		
		product.setProductId(productId);
		
		bproductlist = userService.findByProductId(productId);
		
		System.out.println("图片为:"+sproductlist.size());
		
		//处理图片
		String[] picurl = {};
		
		for(Product p1:sproductlist) {
			
			picurl = p1.getPicUrl().split(",");
			
			for(int i=0;i<picurl.length;i++) {
				
				spicList.add(picurl[i]);
				
				System.out.println("图片为:"+picurl[i]);
				
			}
			
		}
		
		
        for(Product p2:bproductlist) {
			
        	picurl = p2.getPicUrl().split(",");
        	
        	for(int i=0;i<picurl.length;i++) {
    			
    			bpicList.add(picurl[i]);
    			
    		}
        	
		}
		
		return SUCCESS;
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

	public List<String> getSpicList() {
		return spicList;
	}

	public void setSpicList(List<String> spicList) {
		this.spicList = spicList;
	}

	public List<Product> getSproductlist() {
		return sproductlist;
	}

	public void setSproductlist(List<Product> sproductlist) {
		this.sproductlist = sproductlist;
	}

	public List<Product> getBproductlist() {
		return bproductlist;
	}

	public void setBproductlist(List<Product> bproductlist) {
		this.bproductlist = bproductlist;
	}

	public List<String> getBpicList() {
		return bpicList;
	}

	public void setBpicList(List<String> bpicList) {
		this.bpicList = bpicList;
	}
	
	
	

}
