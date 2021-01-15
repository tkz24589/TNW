<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/lr_change.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/css/zui.min.css">
		        <div class="modal-content" style="width:100%; height: 100%;">
		                 <div class="modal-header" style="width:100%; heihgt:20%;">
		                    <h4 class="modal-title">商品交换</h4>
		                  </div>
		                  <div class="modal-body"  style="width:100%; height:76%;">
							  <div class="lr_change_demo">
		                    <span class="lr_mb_pic">
								
								<!-- 轮播图start -->
				   <div class="lr_mtr_lunbo">
				    <div id="myNiceCarousel1" class="carousel slide" data-ride="carousel">
				   
				     <!-- 轮播项目 -->
				     <div class="carousel-inner " data-interval="5" >
				     <div class="item active lr_img_des_pic" >
				         <img alt="${spicList[0]} slide" src="${spicList[0]}">
				     </div>
				     <s:iterator value="spicList" status="pic2" var="p2">
				     <s:if test="!#pic2.first">
				       <div class="item lr_img_des_pic">
				         <img alt="${p2} slide" src="${p2}">
				       </div>
				     </s:if>
				     </s:iterator>
				     </div>
				   
				     <!-- 项目切换按钮 -->
				     <a class="left carousel-control lr_anniu_style" href="#myNiceCarousel1" data-slide="prev">
				       <span class="icon icon-chevron-left"></span>
				     </a>
				     <a class="right carousel-control" href="#myNiceCarousel1" data-slide="next">
				       <span class="icon icon-chevron-right"></span>
				     </a>
				   </div>  
				   </div> 
				   <!-- 轮播图end -->
				   
				   <p>
					<div class="lr_show_detail"><span style="font-weight: bold;">${sproductlist[0].productName}</span></div>
			        <div class="lr_show_detail"><em>商品介绍:</em>&nbsp;&nbsp;<span>${sproductlist[0].productDescribe}</span></div>
			        <div class="lr_show_detail"><em>商品价格:</em>&nbsp;&nbsp;<span style="color:red;">${sproductlist[0].price}元</span></div> 
					</p>		
						</p>	</span>
							
							
							
							<span style="font-size:24px; font-weight:bold;margin:0 10px 0 10px;">交换</span>
							
							
							
		                    <span class="lr_mb_pic">
								
								<!-- 轮播图start -->
								<div class="lr_mtr_lunbo">
								 <div id="myNiceCarousel2" class="carousel slide" data-ride="carousel">
								
								  <!-- 轮播项目 -->
								  <div class="carousel-inner " data-interval="5" >
								    <div class="item active lr_img_des_pic" >
								      <img alt="${bpicList[0]} slide" src="${bpicList[0]}">
								    </div>
								    <s:iterator value="bpicList" status="pic3" var="p3">
								    <s:if test="!#pic3.first">
								    <div class="item lr_img_des_pic">
								      <img alt="${p3} slide" src="${p3}">
								    </div>
								    </s:if>
								    </s:iterator>
								  </div>
								
								  <!-- 项目切换按钮 -->
								  <a class="left carousel-control lr_anniu_style" href="#myNiceCarousel2" data-slide="prev">
								    <span class="icon icon-chevron-left"></span>
								  </a>
								  <a class="right carousel-control" href="#myNiceCarousel2" data-slide="next">
								    <span class="icon icon-chevron-right"></span>
								  </a>
								</div>  
								</div> 
								<!-- 轮播图end -->
		                         
								 <p>
								 
															<div class="lr_show_detail"><span style="font-weight: bold;">${bproductlist[0].productName}</span></div>
															<div class="lr_show_detail"><em>商品介绍:</em>&nbsp;&nbsp;<span>${bproductlist[0].productDescribe}</span></div>
															<div class="lr_show_detail"><em>商品价格:</em>&nbsp;&nbsp;<span style="color:red;">${bproductlist[0].price}元</span></div> 
								 </p>
								 </span>						  
					<div class="lr_mid_mes_end"><p>交换同意后，不可更改，你确定发送请求吗？</p></div>
		                     </div>
					
					
							<br/>
		                  </div>
		                  <div class="modal-footer">
		                   
		                  </div>
		        </div>
<div style="margin:0 auto;width:200px;">
<div style="width:110px;margin:auto;display:inline-block"><button class="btn btn-success " type="button" onclick="toOrder('${sproductlist[0].productId}','${bproductlist[0].productId}','${sproductlist[0].userId}','${bproductlist[0].userId}','${productRequest.requestId}')">成交</button>
</div>
<div style="width:52px;margin:30px auto; display:inline-block">
<button class="btn btn-danger " type="button" onclick="deleterequest('${sproductlist[0].productId}','${bproductlist[0].productId}','${sproductlist[0].userId}','${bproductlist[0].userId}','${productRequest.requestId}')">拒绝</button>
</div>
</div>
<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/jquery/jquery.js"></script>
<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/js/zui.min.js" type="text/javascript"></script>
<script type="text/javascript">
    function userInfo(userPhone){
    	location.href = "${pageContext.servletContext.contextPath}/user_info?userPhone="+userPhone;
    }
    function toOrder(sproductId,bproductId,sellerId,buyerId,requestId){
    	$.post("${pageContext.servletContext.contextPath}/order_go",
  			  {
    		    sellerId:sellerId,
    		    buyerId:buyerId,
    		    sproductId:sproductId,
    		    bproductId:bproductId,
    		    requestId:requestId
  			  },
  			  function(data,status){
  			    //alert("Data: " + data + "\nStatus: " + status);
  			    location.reload();
  			  });
    }
    function backto(){
    	location.replace(document.referrer);
    }
    function deleterequest(sproductId,bproductId,sellerId,buyerId,requestId){
    	$.post("${pageContext.servletContext.contextPath}/order_go",
    			  {
      		    sellerId:sellerId,
      		    buyerId:buyerId,
      		    sproductId:sproductId,
      		    bproductId:bproductId,
      		    requestId:requestId,
      		    message:'d'
    			  },
    			  function(data,status){
    			    //alert("Data: " + data + "\nStatus: " + status);
    			    location.reload();
    			  });
    }
</script>