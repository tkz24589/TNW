<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/lr_index.css" />
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/css/zui.min.css">
</head>
<body>
<div class="lr_top">

		<div class="lr_top_mes">

		 <div class="lr_top_mes_logal">
		 	<span><i class="fa fa-map-marker"></i>&nbsp;&nbsp;<span class="lr_localIP">长沙</span></span>
		 </div>

		 <ul >
		 	 <li><i class="icon icon-server"></i></li>
		 	 <li><a href="your/url/">首页</a></li>
			 <li><a href="">网站介绍</a></i></li>	 
			 <li><a href="">客服中心</a></li>
			 <li><a href="">我的市场</a></li>
			 <li><a href="${pageContext.servletContext.contextPath}/page/login.jsp">登录</a></li>
		 </ul>
	   </div>


         <div class="lr_top_pic">
			 <img src="${pageContext.servletContext.contextPath}/img/logo2.jpg">
			 <div class="lr_top_pic_search">
			  <div class="input-group">

			   <div class="input-control search-box  has-icon-left has-icon-right search-example " id="searchboxExample">
			     <input id="inputSearchExample3" type="search" class="form-control search-input " style="height:40px"  placeholder="搜索">
			     <label for="inputSearchExample3" class="input-control-icon-left search-icon">
			     <i class="icon icon-search" ></i></label>
			   </div>

			   <span class="input-group-btn">
			     <button class="btn btn-primary" type="button" style="height:40px; width:80px" >搜索</button>
			   </span>

			  </div>	
			 </div>
		 </div>
	</div>





	<div class="lr_mid">
		<div class="lr_mid_top">
           <div class="lr_mid_top_left">
			   <ul type="disc">
			    <li><a href="">家具类型</a></li>
			    <li><a href="">数码类型</a></li>
			    <li><a href="">服装类型</a></li>
			    <li><a href="">书籍类型</a></li>
			    <li><a href="">乐器类型</a></li>
				<li><a href="">乐器类型</a></li>
				<li><a href="">乐器类型</a></li>
				<li><a href="">乐器类型</a></li>
			   </ul>
		   </div>

           <div class="lr_mid_top_right" style="overflow:hidden;">
           	   
			   <!-- 轮播图start -->
			   <div class="lr_mtr_lunbo">
			    <div id="myNiceCarousel" class="carousel slide" data-ride="carousel">
			     <!-- 圆点指示器 -->
			     <ol class="carousel-indicators">
			       <li data-target="#myNiceCarousel" data-slide-to="0" class="active"></li>
			       <li data-target="#myNiceCarousel" data-slide-to="1"></li>
			       <li data-target="#myNiceCarousel" data-slide-to="2"></li>
			     </ol>
			   
			     <!-- 轮播项目 -->
			     <div class="carousel-inner lr_img_des_pic" data-interval="5" >
			       <div class="item active" style="width:100%;height:392px;">
			         <img alt="First slide" src="${pageContext.servletContext.contextPath}/img/index2.jpg">
			       </div>
			       <div class="item" style="width:100%;height:392px;">
			         <img alt="Third slide" src="${pageContext.servletContext.contextPath}/img/index3.jpg">
			       </div>
			       <div class="item" style="width:100%;height:392px;">
			         <img alt="Second slide" src="${pageContext.servletContext.contextPath}/img/index1.jpg">
			       </div>
			     </div>
			   
			     <!-- 项目切换按钮 -->
			     <a class="left carousel-control" href="#myNiceCarousel" data-slide="prev">
			       <span class="icon icon-chevron-left"></span>
			     </a>
			     <a class="right carousel-control" href="#myNiceCarousel" data-slide="next">
			       <span class="icon icon-chevron-right"></span>
			     </a>
			   </div>  
			   </div> 
			   <!-- 轮播图end -->
			   
			    <div class="lr_mtr_pic" style="width: 100%;">
                     <img src="${pageContext.servletContext.contextPath}/img/index01.jpg" style="width: 33%;">
                     <img src="${pageContext.servletContext.contextPath}/img/index02.jpg" style="width: 33%;" >
                     <img src="${pageContext.servletContext.contextPath}/img/index03.jpg" style="width: 33%;" >
			    </div>
			   
		   </div>

		</div>

		<div class="lr_mid_end">
			<div class="lr_mid_end_type">物换广场</div>
			<hr/>
			<div class="lr_mid_end_mes" id="product">
				
				
				
				
                  <!-- 商品信息展示框 -->
				<div class="lr_mid_end_meso">
                   <div class="lr_mem_pic">
                   	<img src="${pageContext.servletContext.contextPath}/img/index2.jpg" alt="" />
                   </div>
                   <div class="lr_mem_mes">${plist.productName}</div>
                   <div class="lr_mem_mesp_detail">
                        <span class="price">￥:</span><em>${plist.price}</em>
                   </div>
                   <div class="lr_mem_bon">
                     <!-- 是否登陆 -->
                     <button class="btn btn-primary " type="button" data-toggle="modal" data-target="#iflogin">交换</button>
					 <!-- 登陆 -->
                     <div class="modal fade" id="iflogin">
                         <div class="modal-dialog">
                             <div class="modal-content">
                                 <div class="modal-header">
                                 <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                                 <h4 class="modal-title">登陆</h4>
                                 </div>
                                 <div class="modal-body">
                                 <p>是否登陆</p>
                                 </div>
                                 <div class="modal-footer">
                                 <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                 <button type="button" class="btn btn-primary" onclick="login()">登陆</button>
                                 </div>
                             </div>
                         </div>
                    </div>
					 
					 <!-- 对话框触发按钮 -->
					 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal${plist.productID}">详情</button>
					 
					 <!-- 商品详情 -->
					 <div class="modal fade" id="myModal${plist.productID}">
					   <div class="modal-dialog ">
					     <div class="modal-content" >
						  <div class="lr_tankuang">
					      <div class="lr_left">
							  <div class="lr_left_top_img">
								   <a href="${pageContext.servletContext.contextPath}/img/index2.jpg" data-toggle="lightbox" data-group="image-group-1"><img src="${pageContext.servletContext.contextPath}/img/index2.jpg" class="img-rounded" alt=""></a>
							  </div>
							  <div class="lr_left_end_img">
								 <!-- <img src="img/index1.jpg">
								  <img src="img/index1.jpg"> -->
								   <a href="${pageContext.servletContext.contextPath}/img/index4.jpg" data-toggle="lightbox" data-group="image-group-1"><img src="${pageContext.servletContext.contextPath}/img/index4.jpg" class="img-rounded" alt=""></a>
								   <a href="${pageContext.servletContext.contextPath}/img/index1.jpg" data-toggle="lightbox" data-group="image-group-1"><img src="${pageContext.servletContext.contextPath}/img/index1.jpg" class="img-rounded lr_mg_left" alt=""></a>
								   <a href="${pageContext.servletContext.contextPath}/img/index1.jpg" data-toggle="lightbox" data-group="image-group-1"><img src="${pageContext.servletContext.contextPath}/img/index1.jpg" class="img-rounded lr_mg_left" alt=""></a>
								   <a href="${pageContext.servletContext.contextPath}/img/index1.jpg" data-toggle="lightbox" data-group="image-group-1"><img src="${pageContext.servletContext.contextPath}/img/index1.jpg" class="img-rounded lr_mg_left" alt=""></a>
						      </div>
						  </div>
					      <div class="lr_right">
							  <div class="lr_r1"><span>老工匠纯手工蜡线缝制铂金包30/35CM手提包TOGO小牛皮荔枝纹 黑色</span></div>
							  <div class="lr_r2"><em>商品介绍:</em><span>商家详情页（含主图）以图片或文字形式标注的一口价、促销价、优惠价等价格可能是在使用优惠券、满减或特定优惠活动和时段等情形下的价格，具体请以结算页面的标价、优惠条件或活动规则为准。
                                        此说明仅当出现价格比较时有效，具体请参见《淘宝价格发布规范》。若商家单独对划线价格进行说明的，以商家的表述为准。</span></div>
							  <div class="lr_r3"><em>商品价格:</em><span>130.0元</span></div>
							  <div class="lr_r4"><em>用户地址:</em><span>长沙理工大学</span></div>
							  <div class="lr_r5">
								   <div class="modal-footer">
								          <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								          <button type="button" class="btn btn-primary">保存</button>
								    </div>
							  </div>
						  </div>
					     </div>
						 </div>
					   </div>
					 </div>
					 <!-- 对话框end  -->

                   </div>
				</div>				
			</div>
		</div>

	</div>



	<div class="lr_bottom" >
		<br/><p><i class="icon icon-zhifubao icon-3x"></i><i class="icon icon-taobao icon-3x">
		</i><i class="icon icon-renren icon-3x"></i><i class="icon icon-weibo icon-3x"></i>
		<i class="icon icon-ie icon-3x"></i><i class="icon icon-firefox icon-3x"></i>
		<i class="icon icon-chrome icon-3x"></i></p>
    <p>长沙市雨花区暮云街道246号</p>
    <p>物爱换公司，联系电话：15049441312  邮箱：2722545499@qq.com</p>
    
	</div>
</body>
<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/jquery/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	 $.post("search_go",
			  {},
			  function(data,status){
				var json=eval ("(" + data + ")");
			    for(var x in json['productList']){
			    		$("#product").append('<div class="lr_mid_end_meso"><div class="lr_mem_pic"><img src="../'+
			    				json['productList'][x].picUrl+
			    				'" alt="" /></div><div class="lr_mem_mes">'+
			    				json['productList'][x].productName+
			    				'</div><div class="lr_mem_mesp_detail"><span class="price">￥:</span><em>'+
			    				json['productList'][x].price+
			    				'</em></div><div class="lr_mem_bon"><!-- 是否登陆 --><button class="btn btn-primary " type="button" data-toggle="modal" data-target="#iflogin">交换</button><!-- 登陆 --><div class="modal fade" id="iflogin"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button><h4 class="modal-title">登陆</h4></div><div class="modal-body"><p>是否登陆</p></div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">取消</button><button type="button" class="btn btn-primary" onclick="login()">登陆</button></div></div></div></div><!-- 对话框触发按钮 --><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal'+
			    				json['productList'][x].productId+
			    				'">详情</button><!-- 商品详情 --><div class="modal fade" id="myModal'+
			    				json['productList'][x].productId+
			    				'"></div></div></div>');
			    		var id="#myModal"+json['productList'][x].productId+"";
			    		var html='<div class="modal-dialog "><div class="modal-content" ><div class="lr_tankuang"><div class="lr_left"><div class="lr_left_top_img"><a href="../'+
			    		json['productList'][x].picUrl+
			    		'" data-toggle="lightbox" data-group="image-group-1"><img src="../'+
			    		json['productList'][x].picUrl+
			    		'" class="img-rounded" alt=""></a></div><div class="lr_left_end_img">';
			    		for(var c in json['productListall'][x]){
			    			if(c=='0'){
			    				html += '<a href="../'+
			    				json['productListall'][x][c]+
				    			'" data-toggle="lightbox" data-group="image-group-1"><img src="../'+
				    			json['productListall'][x][c]+
				    			'" class="img-rounded" alt=""></a>';
			    			}else{
			    				html += '<a href="../'+
				    			json['productListall'][x][c]+
				    			'" data-toggle="lightbox" data-group="image-group-1"><img src="../'+
				    			json['productListall'][x][c]+
				    			'" class="img-rounded lr_mg_left" alt=""></a>';
			    			}
			
			    		}
			    		html += '</div></div><div class="lr_right"><div class="lr_r1"><span>'+
			    		json['productList'][x].productName+
			    		'</span></div><div class="lr_r2"><em>商品介绍:</em><span>'+
			    		json['productList'][x].productDescribe+
			    		'</span></div><div class="lr_r3"><em>商品价格:</em><span>'+
			    		json['productList'][x].price+
			    		'元</span></div><div class="lr_r5"><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">关闭</button><button type="button" class="btn btn-primary">保存</button></div></div></div></div></div></div>'
			    		$(id).append(html);
			    }	    
			  });
	});
	function login(){
		location.href = "${pageContext.servletContext.contextPath}/page/login.jsp";
	}
</script>
<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/js/zui.min.js" type="text/javascript"></script>
</html>