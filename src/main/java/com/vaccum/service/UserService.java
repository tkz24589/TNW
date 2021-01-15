package com.vaccum.service;

import java.util.List;

import com.vaccum.entity.Order;
import com.vaccum.entity.Product;
import com.vaccum.entity.ProductRequest;
import com.vaccum.entity.User;

public interface UserService {
	
	public List<Order> findOrder(Order order);

	public void save(User user);
	
	public void save(Product product);

	public List<User> findUserByPhone(User user);

	public List<Product> findAllProduct();

	public List<ProductRequest> findNumberOfRequest(ProductRequest productRequest);

	public List<Product> findProductByUserId(Product product);

	public List<Product> findProduct(Product product);

	public void update(User user);

	public void delete(ProductRequest productRequest);

	public void save(ProductRequest productRequest);

	public void save(Order order);

	public List<Product> findByProductId(Integer productId);

	public void delete(Product product);

	public List<User> findUserById(User user);
	
}