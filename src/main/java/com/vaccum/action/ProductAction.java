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
import com.vaccum.entity.Product;
import com.vaccum.service.UserService;
import com.vaccum.util.FileUtil;

@Controller
@Scope("prototype")
public class ProductAction extends ActionSupport implements ModelDriven<Product>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
    private UserService userService;
	
	@Autowired
	private Product product;
	
	private String message;
	
	private List<File> myFile = new ArrayList<File>();    

	private List<String> imageFileName = new ArrayList<String>();  

	@Override
	public Product getModel() {
		
		return product;
	}

	@Override
	public String execute() throws Exception {
		
		if(product.getUserId()==null) {
			
			message="请重新登陆";
			
			return "erro";
			
		}
		
		//处理上传的图片
        String file="";
        
        System.out.println("图片数量"+myFile.size());
		
		if (myFile != null)  {
		
        for (int i = 0; i < myFile.size(); i++) {  

            imageFileName.add(new Date().
            		getTime()+ 
            		getExtention(this.getMyFile().
            				get(i).
            				toString())) ;  
            
          //得到图片保存的位置(根据root来得到图片保存的路径在tomcat下的该工程里)
            
            File imageFile = new File(ServletActionContext.getServletContext()  

                    .getRealPath("userImage")     

                    + "/" + imageFileName.get(i)+".jpg");  
            
            System.out.println(imageFile);

            FileUtil.copy(myFile.get(i), imageFile);  //把图片写入到上面设置的路径里  
            
            //存入多张图片路径
            file += "userImage/" + imageFileName.get(i).toString() + ".jpg";
            
            if(i == myFile.size()) {
            	
            }else {
            	file += ",";
            }

        }
		}
        
        product.setPicUrl(file);
        
        userService.save(product);
        
        message = "发布商品成功";
        
		return SUCCESS;
	}
	
	public String delete() throws Exception{
		
		userService.delete(product);
		
		return SUCCESS;
		
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
	
	private static String getExtention(String fileName) {  

        int pos = fileName.lastIndexOf(".");  

        return fileName.substring(pos);  

    }

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	} 

}
