<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改信息</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/css/zui.min.css">
</head>
<body>
<s:debug></s:debug>
<div style="width:320px;margin:0 auto;margin-top:15%;">
<form action="upload_go" method="post" enctype="multipart/form-data">
  <div class="input-group">
      <span class="input-group-addon"><i class="icon icon-user"></i></span>
      <input type="text" class="form-control" name="userId" value="${user.userId}" disabled="disabled">
   </div>
   <br/>
   <div class="input-group">
      <span class="input-group-addon"><i class="icon icon-user"></i></span>
      <input type="text" class="form-control" name="type" value="${user.type}" disabled="disabled">
   </div>
   <br/>
  <div class="input-group">
      <span class="input-group-addon"><i class="icon icon-user"></i></span>
      <input type="text" class="form-control" placeholder="用户名" name="userName" value="${user.userName}">
   </div>
   <br/>
   <div class="input-group">
      <span class="input-group-addon"><i class="icon icon-key"></i></span>
      <input type="password" class="form-control" placeholder="密码（必须填写）"name="passWord"><br />
   </div>
   <br/>
   <div class="input-group">
      <span class="input-group-addon"><i class="icon icon-key"></i></span>
      <input type="password" class="form-control" placeholder="修改密码（可不填写）" name="nowpassWord"><br />
   </div>
   <br/>
   <div class="input-group">
      <span class="input-group-addon"><i class="icon icon-map-marker"></i></span>
      <input type="text" class="form-control" placeholder="地址" name="address" value="${user.address}"><br />
   </div>
   <br/>
   <div class="input-group">
      <span class="input-group-addon"><i class="icon icon-mobile"></i></span>
      <input type="text" class="form-control" placeholder="电话" name="userPhone" value="${user.userPhone}"><br />
   </div>
   <br/>
   <div class="input-group">
      <span class="input-group-addon"><i class="icon icon-key"></i></span>
      <input type="file" class="form-control" placeholder="图片"  name="myFile"><br />
   </div>
   <br/>
   <div class="input-group" style="width:100px;margin:0 auto;">
      <input type="submit" class="form-control" value="提交"><br />
   </div>
</form>
</div>
</body>
<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/jquery/jquery.js"></script>
<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/js/zui.min.js" type="text/javascript"></script>
<script type="text/javascript">
function backto(){
	location.replace(document.referrer);
}
</script>
</html>