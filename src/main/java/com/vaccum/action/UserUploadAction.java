package com.vaccum.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.vaccum.entity.User;
import com.vaccum.service.UserService;
import com.vaccum.util.FileUtil;

@Controller
@Scope("prototype")
public class UserUploadAction extends ActionSupport implements ModelDriven<User>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L; 
	
	@Autowired
    private UserService userService;
	
	@Autowired
	private User user;

	private List<File> myFile = new ArrayList<File>();    

	private List<String> imageFileName = new ArrayList<String>();  
	
	private String message;
	
	private String nowpassWord;

	@Override
	public String execute() throws Exception {
		
		//查询密码省略。。。。。。。
		System.out.println(user);
		
		user = userService.findUserByPhone(user).get(0);
		
		System.out.println(user);
		
		String file="";
		
		if (myFile != null)  {
		
        for (int i = 0; i < myFile.size(); i++) {  

            imageFileName.add(new Date().getTime()+ getExtention(this.getMyFile().get(i).toString())) ;  
            
          //得到图片保存的位置(根据root来得到图片保存的路径在tomcat下的该工程里)
            
            File imageFile = new File(ServletActionContext.getServletContext()  

                    .getRealPath("userImage")     

                    + "/" + imageFileName.get(i)+".jpg");  
            
            System.out.println(imageFile);

            FileUtil.copy(myFile.get(i), imageFile);  //把图片写入到上面设置的路径里  
            
            //存入多张图片路径
            file += "userImage/" + imageFileName.get(i).toString() + ".jpg";

        }  
        //更新User对象
        this.getModel().setUserPhoto(file);
		}
        
        if(!nowpassWord.equals("")) {
        	
        	user.setPassWord(nowpassWord);
        	
        }
        
        userService.update(user);
        
        message = "修改个人信息成功";
        
        System.out.println(message);
        
        

        return SUCCESS;
	}
	
	private static String getExtention(String fileName) {  

        int pos = fileName.lastIndexOf(".");  

        return fileName.substring(pos);  

    } 

	public List<File> getMyFile() {
		return myFile;
	}

	public void setMyFile(List<File> myFile) {
		this.myFile = myFile;
	}

	public List<String> getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(List<String> imageFileName) {
		this.imageFileName = imageFileName;
	}

	@Override
	public User getModel() {
		return user;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getNowpassWord() {
		return nowpassWord;
	}

	public void setNowpassWord(String nowpassWord) {
		this.nowpassWord = nowpassWord;
	}
	
	

}
