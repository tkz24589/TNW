package com.vaccum.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.vaccum.dao.UserDao;
import com.vaccum.entity.Order;
import com.vaccum.entity.Product;
import com.vaccum.entity.ProductRequest;
import com.vaccum.entity.User;
import com.vaccum.service.UserService;

@Service
@Scope("prototype")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Override
	public List<Order> findOrder(Order order) {
		
		return userDao.findOrder(order);
		
	}

	@Override
	public void save(User user) {
		
		userDao.save(user);
		
	}

	@Override
	public List<User> findUserByPhone(User user) {
		
		return userDao.findUserByPhone(user);
	}

	@Override
	public List<Product> findAllProduct() {
		
		return userDao.findAllProduct();
		
	}

	@Override
	public List<ProductRequest> findNumberOfRequest(ProductRequest productRequest) {
		
		return userDao.findNumberOfRequest(productRequest);
		
	}

	@Override
	public List<Product> findProductByUserId(Product product) {

		return userDao.findProductByUserId(product);
	}

	@Override
	public List<Product> findProduct(Product product) {

		return userDao.findProduct(product);
	}

	@Override
	public void update(User user) {
		
		userDao.update(user);
		
	}

	@Override
	public void save(Product product) {
		
		userDao.save(product);
		
	}

	@Override
	public void delete(ProductRequest productRequest) {
		
		userDao.delete(productRequest);
		
	}

	@Override
	public void save(ProductRequest productRequest) {
		
		userDao.save(productRequest);
		
	}

	@Override
	public void save(Order order) {
		
		userDao.save(order);
		
	}

	@Override
	public List<Product> findByProductId(Integer productId) {
		
		return userDao.findByProductId(productId);
	}

	@Override
	public void delete(Product product) {
		
		userDao.delete(product);
		
	}

	@Override
	public List<User> findUserById(User user) {
		
		return userDao.findUserById(user);
	}

}
