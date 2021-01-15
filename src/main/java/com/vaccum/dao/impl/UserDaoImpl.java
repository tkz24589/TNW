package com.vaccum.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.vaccum.dao.UserDao;
import com.vaccum.entity.Order;
import com.vaccum.entity.Product;
import com.vaccum.entity.ProductRequest;
import com.vaccum.entity.User;

@Repository
@Scope("prototype")
public class UserDaoImpl extends HibernateDaoSupport implements UserDao{

	@Autowired
	public void setSuperSessionFactory(SessionFactory sessionFactory){
	    super.setSessionFactory(sessionFactory);
	}

	public void close() {
		this.getSessionFactory().close();
	}
	
	@Override
	public List<Order> findOrder(Order order) {
		
		List<Order>  List = this.getHibernateTemplate().findByExample(order);
		
		//this.getSessionFactory().close();
		
		return List;
	
	}

	@Override
	public void save(User user) {
		
		this.getHibernateTemplate().save(user);
		
		//this.getSessionFactory().close();
	}

	@Override
	public List<User> findUserByPhone(User user) {
	    
		List<User> List = this.getHibernateTemplate().findByExample(user);
		
		//this.getSessionFactory().close();
		
		return List;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> findAllProduct() {
		
		List<Product> productList = null;
		String queryString ="SELECT * FROM product";
		productList = this.getSessionFactory().openSession().createSQLQuery(queryString).addEntity(Product.class).list();
		//this.getSessionFactory().close();
		return productList;

	}

	@Override
	public List<ProductRequest> findNumberOfRequest(ProductRequest productRequest) {
		
		List<ProductRequest> List = this.getHibernateTemplate().findByExample(productRequest);
		
		//this.getSessionFactory().close();
		
		return List;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> findProductByUserId(Product product) {
		
		String queryString ="SELECT * FROM product WHERE user_id="+product.getUserId();
		
		List<Product> List = this.getSessionFactory().openSession().createSQLQuery(queryString).addEntity(Product.class).list();
		
		//this.getSessionFactory().close();
		
		return List;
	}

	@Override
	public List<Product> findProduct(Product product) {
        
		List<Product> List = this.getHibernateTemplate().findByExample(product);
		
		//this.getSessionFactory().close();
		
		return List;
	}

	@Override
	public void update(User user) {
		
		this.getHibernateTemplate().update(user);
		
		//this.getSessionFactory().close();
	}

	@Override
	public void save(Product product) {
		
		this.getHibernateTemplate().saveOrUpdate(product);
		
		//this.getSessionFactory().close();
	}

	@Override
	public void delete(ProductRequest productRequest) {
		
		this.getHibernateTemplate().delete(productRequest);
		
		//this.getSessionFactory().close();
	}

	@Override
	public void save(ProductRequest productRequest) {
		
		this.getHibernateTemplate().save(productRequest);
		
		//this.getSessionFactory().close();
		
	}

	@Override
	public void save(Order order) {
		
		this.getHibernateTemplate().save(order);
		
		//this.getSessionFactory().close();
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> findByProductId(Integer productId) {
		
		String queryString = "SELECT * FROM product WHERE product_id="+productId;
		
		List<Product> List = this.getSessionFactory().openSession().createSQLQuery(queryString).addEntity(Product.class).list();
		
		//this.getSessionFactory().close();
		
		return List;
	}

	@Override
	public void delete(Product product) {

		this.getHibernateTemplate().delete(product);
		
		//this.getSessionFactory().close();
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findUserById(User user) {
	
		String queryString = "SELECT * FROM USER WHERE user_id="+user.getUserId();
		
		List<User> List = this.getSessionFactory().openSession().createSQLQuery(queryString).addEntity(User.class).list();
		
		
        //this.getSessionFactory().close();
        
		return List;
	}	
}
