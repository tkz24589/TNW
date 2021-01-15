<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        <li><a href="your/nice/url">注销</a></li>
        <li class="dropdown">
          <a href="your/nice/url" class="dropdown-toggle" data-toggle="dropdown">更多 <b class="caret"></b></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="${pageContext.servletContext.contextPath}/page/login.jsp">切换登录</a></li>
            <li><a href="#">了解我们</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- END .navbar-collapse -->
  </div>
</nav>
<div style="width:200px;float:left;margin-top:20px;">
<img src="../${user.userPhoto}" width="130px" height="130px" class="img-circle" alt="" style="border:2px solid;border-radius:65px;margin:0 auto;display:block;">
<ul class="nav nav-secondary nav-stacked" style="margin-top:20px;">
  <li class="active" style="border:0;"><a href="your/noce/url" style="display:block;text-align:center;"><i class="icon icon-user"></i><s:property value="user.getUserName" /></a></li>
  <li><a href="#" onclick="userInfo('${user.userPhone}')">个人主页</a></li>
</ul>
</div>
<div style="width:1000px;float:right;">
<s:iterator value="productList" status="pl" var="thisproduct">
<div class="panel" style="width:227px;height:250px;margin:20px 10px 20px 10px;display:inline-block;">
  <div class="panel-heading">
  <s:property value="productName"/>
  </div>
  <img src="../${thisproduct.picUrl}" width="200px" height="200px" class="img-rounded" alt="圆角图片" style="margin:0 auto;display:block;">
  <div class="panel-body">
  <span style="display:inline-block;float:left;">价格</span><span style="display:inline-block;float:right;"><s:property value="price"/></span>
  </div>
  <div>
     <!-- 对话框触发按钮 -->
     <button class="btn btn-info btn-lg btn-primary" type="button" data-toggle="modal" data-target="#myModal${thisproduct.productId}" style="margin:0 auto;display:block;" >想要交换</button>
     <!-- 对话框HTML -->
     <div class="modal fade" id="myModal${thisproduct.productId}">
        <div class="modal-dialog">
           <div class="modal-content">
              <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
                 <h4 class="modal-title">协议</h4>
              </div>
              <div class="modal-body">
                 <ul class="list-group">
                   <li class="list-group-item active">请选择你要交换的产品</li>
                   <s:iterator value="myProductList" status="prl" var="myproduct">
                   <!-- 显示自己的商品，生成单选选项 -->
                      <li class="list-group-item">
                           <div class="radio-primary"><input type="radio" name="primaryRadioGroup1" id="primaryradio${myproduct.productId}" value="${myproduct.productId}"><label for="primaryradio1">
                               <p>${myproduct.productName}</p>
                               <img src="../${myproduct.picUrl}" width="200px" height="200px" class="img-responsive" alt="这个商品没有图片">
                           </label></div>
                        </li>
                   </s:iterator>
                 </ul>
                 <p>交换需要双方同意，你确定发送请求吗？</p>
              </div>
              <div class="modal-footer">
                 <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                 <button type="button" class="btn btn-primary" onclick="changeRequest('${user.userId}','${thisproduct.userId}','${thisproduct.productId}')">确认</button>
              </div>
           </div>
        </div>
     </div>
  </div>
</div>
</s:iterator>
</div>
</div>
</body>
<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/jquery/jquery.js"></script>
<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/js/zui.min.js" type="text/javascript"></script>
<script type="text/javascript">
    function userInfo(userPhone){
    	location.href = "${pageContext.servletContext.contextPath}/user_info?userPhone="+userPhone;
    }
    function changeRequest(buyerId,sellerId,sproductId){
    	var bproductId = $('input:radio[name="primaryRadioGroup1"]:checked').val();
   	    alert(buyerId+" "+sellerId+" "+sproductId+" "+bproductId);
   	    $.post("{pageContext.servletContext.contextPath}/buyer_go",
			  {
   	    	    buyerId:buyerId,
   	   	    	sellerId:sellerId,
   	   	    	sproductId:sproductId,
   	   	    	bproductId:bproductId
			  },
			  function(data,status){
			    alert("Data: " + data + "\nStatus: " + status);
			    location.reload(); 
			  });
    	
    }
</script>
</html>