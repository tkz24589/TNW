package com.vaccum.action;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.vaccum.entity.User;
import com.vaccum.service.UserService;

@Controller
@Scope("prototype")
public class RigisterAction extends ActionSupport implements ModelDriven<User>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private User user;
	
    private Logger logger = Logger.getLogger(this.getClass());
	
    @Autowired
    private UserService userService;
	
	@Override
	public User getModel() {
		return user;
	}

	@Override
	public String execute() throws Exception {
		
		userService.save(user);
		
		logger.info("注册成功");
		
		return "user";
	}	

}
