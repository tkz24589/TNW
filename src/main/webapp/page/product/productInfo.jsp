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
            <li><a href="your/nice/url">切换登录</a></li>
            <li><a href="your/nice/url">了解我们</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- END .navbar-collapse -->
  </div>
</nav>
</div>
<div style="width:1000px;margin:0 auto;">
<div style="width:490px;float:left;">
  <s:iterator value="spicList" status="pic1" var="p1">
    <img data-toggle="lightbox" src="${p1}" data-image="${p1}" data-caption="" class="img-thumbnail" alt="" width="300" style="display:block;margin:0 auto;">
  </s:iterator>
</div>
<div style="width:490px;float:right;">
  <s:iterator value="bpicList" status="pico2" var="p2">
    <img data-toggle="lightbox" src="${p2}" data-image="${p2}" data-caption="" class="img-thumbnail" alt="" width="300" style="display:block;margin:0 auto;">
  </s:iterator>
</div>
</div>
<div style="width:100px;margin: auto;display:inline-block;">
<button class="btn btn-success " type="button" onclick="toOrder('${sproductlist[0].productId}','${bproductlist[0].productId}','${sproductlist[0].userId}','${bproductlist[0].userId}','${productRequest.requestId}')">成交</button>
<button class="btn btn-danger " type="button">拒绝</button>
</div>
<div style="width:52px;margin:30px auto;display:inline-block;">
</div>

</body>
<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/jquery/jquery.js"></script>
<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/js/zui.min.js" type="text/javascript"></script>
<script type="text/javascript">
    function userInfo(userPhone){
    	location.href = "${pageContext.servletContext.contextPath}/user_info?userPhone="+userPhone;
    }
    function toOrder(sproductId,bproductId,sellerId,buyerId,requestId){
    	location.href = "${pageContext.servletContext.contextPath}/order_go?sellerId="+sellerId+"&buyerId="+buyerId+"&sproductId="+sproductId+"&bproductId="+bproductId+"&requestId="+requestId;
    }
    function backto(){
    	location.replace(document.referrer);
    }
</script>
</html>