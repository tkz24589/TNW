<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/dingdan.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/css/zui.min.css">
</head>
<body>
<div style="width:1200px;margin:0 auto;">
<nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <!-- 导航头部 -->
    <div class="navbar-header">
     <i class="icon icon-undo icon-3x"></i>
    </div>
    <!-- 导航项目 -->
    <div class="collapse navbar-collapse navbar-collapse-example">
      <span>CHANGE<s:debug></s:debug></span>
      <!-- 右侧的导航项目 -->
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">注销</a></li>
        <li class="dropdown">
          <a href="your/nice/url" class="dropdown-toggle" data-toggle="dropdown">更多 <b class="caret"></b></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="${pageContext.servletContext.contextPath}/page/login.jsp">切换登录</a></li>
            <li><a href="${pageContext.servletContext.contextPath}/page/user/userInfoAlter.jsp">修改信息</a></li>
            <li><a href="#">了解我们</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- END .navbar-collapse -->
  </div>
</nav>
<div style="width:200px;float:left;margin-top:20px;">
<a href="${pageContext.servletContext.contextPath}/page/user/userInfoAlter.jsp">
<img src="${user.userPhoto}" width="130px" height="130px" class="img-circle" alt="点击修改信息" style="border:2px solid;border-radius:65px;margin:0 auto;display:block;">
</a>
<ul class="nav nav-secondary nav-stacked" style="display:block;margin-top:20px;">
  <li class="active" style="border:0;"><a href="your/noce/url" style="display:block;text-align:center;"><i class="icon icon-user"></i><s:property value="user.getUserName" /></a></li>
  <li>
  <div class="btn-group">
  <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" style="border:0;display:block;width:200px;margin-top:10px;">换物请求 <span class="label label-badge label-success"><s:property value="productRequestList.size" /></span></button>
  <ul class="dropdown-menu" role="menu" style="width:200px;">
    <s:iterator value="productRequestList" status="prl" var="prlist">
    <li style="display:block;margin-top:10px;">
      <span>${bproductId}的交换申请</span>
      <button class="btn btn-info btn-lg btn-primary" type="button" data-toggle="modal" data-target="#myModal${prlist.requestId}1" style="float:right;margin:0;height:20px;line-height:20px;display:inline-block;font-size:10px;padding:0;" 
      onclick="requestInfo('${prlist.bproductId}','${prlist.sproductId}','${prlist.buyerId}','${prlist.sellerId}')">详情
      </button>
    </li>
    </s:iterator>
  </ul>
  </div>  
  </li>
  <li>
  <div class="btn-group">
  <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" style="border:0;display:block;width:200px;margin-top:10px;">订单 <span class="label label-badge label-success"><s:property value="orderList.size" /></span></button>
  <ul class="dropdown-menu" role="menu" style="width:200px;">
    <s:iterator value="orderList" status="olist" var="orlist">
    <li style="display:block;margin-top:10px;">
      <span>${orlist.sellerPhone}的订单</span>
      <button class="btn btn-warning btn-lg btn-primary" type="button" data-toggle="modal" data-target="#myModal${orlist.orderId}" style="float:right;margin:0;height:20px;line-height:20px;display:inline-block;font-size:10px;padding:0;" >详情</button>
    </li>
    </s:iterator>
  </ul>
  </div>  
  </li>
</ul>
<div style="width:30px;margin:20px auto;">
<a href="${pageContext.servletContext.contextPath}/page/product/productIssue.jsp" style="diplay:block;"><button class="btn btn-info btn-lg btn-primary" type="button" style="float:right;margin:0;height:20px;line-height:20px;display:inline-block;font-size:10px;padding:0;" >发布商品</button>
       </a>
</div>
<div style="width:30px;margin-top:100px;">
    <button class="btn btn-success " type="button" style="" onclick="backto()"><i class="icon icon-circle-arrow-left"></i>返回</button>
</div>
</div>
<div style="width:1000px;float:right;">
<s:iterator value="productList" status="pl" var="mmpic">
<div class="panel" style="width:227px;height:250px;margin:20px 10px 20px 10px;display:inline-block;">
  <div class="panel-heading">
  <s:property value="productName"/>
  </div>
  <img src="${mmpic.picUrl}" width="200px" height="200px" class="img-rounded" alt="圆角图片" style="margin:0 auto;display:block;">
  <div class="panel-body">
  <span style="display:inline-block;float:left;">价格</span><span style="display:inline-block;float:right;"><s:property value="price"/></span>
  </div>
  <div>
     <!-- 对话框触发按钮 -->
     <button class="btn btn-danger btn-lg btn-primary" type="button"style="margin:0 auto;margin:20px auto;display:block;" onclick="delete_product('${mmpic.productId}')">删除</button>
     <button class="btn btn-warning btn-lg btn-primary" type="button" data-toggle="modal" data-target="#myModalprl${mmpic.productId}" style="margin:20px auto;display:block;" >修改</button>
     <!-- 对话框HTML -->
     <div class="modal fade" id="myModalprl${mmpic.productId}">
        <div class="modal-dialog">
           <div class="modal-content">
              <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                 <h4 class="modal-title">修改信息</h4>
              </div>
              <form action="alter_product" method="post" enctype="multipart/form-data">
              <div style="width:80%;margin:0 auto;">
                 <div class="input-control has-label-left">
                    <input id="inputAccountExample3" type="hidden" class="form-control" placeholder="" value="${mmpic.productId}" name="productId">
                    <label for="inputAccountExample3" class="input-control-label-left text-right"></label>
                 </div>
                 <br />
                 <div class="input-control has-label-left">
                    <input id="inputAccountExample3" type="hidden" class="form-control" placeholder="" value="${mmpic.userId}" name="userId">
                    <label for="inputAccountExample3" class="input-control-label-left text-right"></label>
                 </div>
                 <br />
                 <div class="input-control has-label-left">
                    <input id="inputAccountExample3" type="text" class="form-control" placeholder="" value="${mmpic.productName}" name="productName">
                    <label for="inputAccountExample3" class="input-control-label-left text-right">商品名称：</label>
                 </div>
                 <br />
                 <div class="input-control has-label-left">
                    <input id="inputAccountExample3" type="text" class="form-control" placeholder="" value="${mmpic.productDescribe}" name="productDescribe">
                    <label for="inputAccountExample3" class="input-control-label-left text-right">商品描述：</label>
                 </div>
                 <br />
                 <div class="input-control has-label-left">
                    <input id="inputAccountExample3" type="text" class="form-control" placeholder="" value="${mmpic.price}" name="price">
                    <label for="inputAccountExample3" class="input-control-label-left text-right">商品估价：</label>
                 </div>
                 <br />
                 <div class="input-control has-label-left">
                    <input id="inputAccountExample3" type="file" class="form-control" placeholder="" multiple="multiple"  name="myFile">
                    <label for="inputAccountExample3" class="input-control-label-left text-right">商品图片（多张）：</label>
                 </div>
                 <div class="input-group" style="width:100px;margin:0 auto;">
                    <input type="submit" class="form-control" value="提交"><br />
                 </div>
              </div>
              </form>
              <div class="modal-footer">
                 <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
              </div>
           </div>
        </div>
     </div>
  </div>
</div>
</s:iterator>
</div>
</div>
<s:iterator value="orderList" status="olist" var="orlist">
     <div class="modal fade" id="myModal${orlist.orderId}">
        <div class="modal-dialog" style="width:40%">
           <div class="modal-content" >
              <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                 <h4 class="modal-title">订单详情</h4>
              </div>
       <div class="lr_order_style ">    
			<div class="lr_mes lr_order_styles">
			<div class="lr_allmes_tabel"><span>订单号:</span>&nbsp;<span>${orlist.orderId}</span><br/></div>
			<div class="lr_seller_mes">
        		<em>买家：</em><span>${orlist.buyerName}</span>
				<em>电话号码：</em><span>${orlist.buyerPhone}</span>
				</br><em>商品名称：</em><span>${orlist.bproductName}</span>
			</div>
			<div class="lr_my_mes ">
				<em>卖家：</em><span>${orlist.sellerName}</span>
				<em>电话号码：</em><span>${orlist.sellerPhone}</span>
				</br><em>商品名称：</em><span>${orlist.sproductName}</span>
			</div>
			</div>
			<div class="lr_ors_pic lr_order_styles">
				<!-- <span class="lr_show_mes_pic"><img src="img/index4.jpg" alt=""></span> -->
			    <span class="lr_show_mes_pic "><img src="${orlist.bproductPic}" alt=""></span>
				 <span class="lr_show_mes_pic_change" ><i class="icon icon-resize-h icon-4x"></i></span>
				  <!-- <span class="lr_show_mes_pic "><img src="img/index4.jpg" alt=""></span> -->
			    <span class="lr_show_mes_pic "><img src="${orlist.sproductPic}" alt=""></span>
				
			</div>
			<div class="lr_ors_choice_button lr_order_styles">
				<button class="btn btn-link btn-default" type="button" style="color:black">删除</button>
			</div>
                      
             
             
              </div>
           </div>
        </div>
     </div>
</s:iterator>
<s:iterator value="productRequestList" status="prl1" var="prlist1">
     <div class="modal fade" id="myModal${prlist1.requestId}1">
        <div class="modal-dialog">
           <div class="modal-content">
              <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                 <h4 class="modal-title">请求详情</h4>
              </div>
              <div id="request" class="page-header" style="width:80%;margin:0 auto;">
              
              </div>
              <div class="modal-footer">
                
              </div>
           </div>
        </div>
     </div>
    </s:iterator>    
</body>
<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/jquery/jquery.js"></script>
<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/js/zui.min.js" type="text/javascript"></script>
<script type="text/javascript">
     function delete_product(productId){
    	 $.post("${pageContext.servletContext.contextPath}/delete_product",
    			  {
    		        productId:productId
    			  },
    			  function(data,status){
    				location.reload();
    			    //alert("Data: " + data + "\nStatus: " + status);
    			    location.reload(); 
    			  });
     }
     function requestInfo(bproductId,sproductId,buyerId,sellerId){
    	 $.post("${pageContext.servletContext.contextPath}/seller_request",
     			  {
       		        sellerId:sellerId,
       		        buyerId:buyerId,
       		        sproductId:sproductId,
       		        bproductId:bproductId
     			  },
     			  function(data,status){
     				//location.reload();
     			   //alert("Data: " + data + "\nStatus: " + status);
     			    $("#request").html(data)
     			  });
    	 
     }
     function backto(){
    	 location.replace(document.referrer)
     }
     function deleterequest(bproductId,sproductId,buyerId,sellerId){
    	 $.post("${pageContext.servletContext.contextPath}/seller_request",
     			  {
       		        sellerId:sellerId,
       		        buyerId:buyerId,
       		        sproductId:sproductId,
       		        bproductId:bproductId,
       		        message:d
     			  },
     			  function(data,status){
     				//location.reload();
     			   //alert("Data: " + data + "\nStatus: " + status);
     			    $("#request").html(data)
     			  });
    	 
     }
</script>
</html>