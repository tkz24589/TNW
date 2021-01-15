package com.vaccum.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.vaccum.dao.LogisticsDao;

@Repository
public class LogisticsDaoImpl extends HibernateDaoSupport implements LogisticsDao {

	@Autowired
	public void setSuperSessionFactory(SessionFactory sessionFactory){
	    super.setSessionFactory(sessionFactory);
	}
	
}
