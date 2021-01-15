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
<s:debug></s:debug>
<div style="width:320px;margin:0 auto;margin-top:15%;">
<form action="product_do" method="post" enctype="multipart/form-data">
  <div class="input-group">
      <span class="input-group-addon"><i class="icon icon-user"></i></span>
      <input type="text" class="form-control" placeholder="产品名称" name="productName">
   </div>
   <br/>
   <div class="input-group">
      <span class="input-group-addon"><i class="icon icon-user"></i></span>
      <input type="text" class="form-control" placeholder="产品价格" name="price"><br />
   </div>
   <br/>
   <div class="input-group">
      <span class="input-group-addon"><i class="icon icon-key"></i></span>
      <input type="text" class="form-control" placeholder="产品类型" name="type"><br />
   </div>
   <br/>
   <div class="input-group">
      <span class="input-group-addon"><i class="icon icon-key"></i></span>
      <input type="text" class="form-control" placeholder="产品描述" name="productDescribe"><br />
   </div>
   <br/>
   <div class="input-group">
      <span class="input-group-addon"><i class="icon icon-key"></i></span>
      <input type="hidden" class="form-control" placeholder="" name="userId" value="${user.userId}">
   </div>
   <br/>
   <div class="input-group">
      <span class="input-group-addon"><i class="icon icon-key"></i></span>
      <input type="file" class="form-control" placeholder="图片" multiple="multiple"  name="myFile"><br />
   </div>
   <br/>
   <div class="input-group" style="width:100px;margin:0 auto;">
      <input type="submit" class="form-control" value="提交"><br />
   </div>
   <div style="width:100px;margin:0 auto;margin-top:50px;">
    <button class="btn btn-success " type="button" style="" onclick="backto()"><i class="icon icon-circle-arrow-left"></i>返回</button>
   </div>
</form>
</div>
</body>
<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/jquery/jquery.js"></script>
<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/js/zui.min.js" type="text/javascript"></script>
<script type="text/javascript">
    function backto(){
    	history.go(-1);
    }
</script>
</html>