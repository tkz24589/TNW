<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/css/zui.min.css">
</head>
<body>
<div style="width:320px;margin:0 auto;margin-top:15%;">
<form action="rigister_do">
  <div class="input-group">
      <span class="input-group-addon"><i class="icon icon-user"></i></span>
      <input type="text" class="form-control" placeholder="用户名" name="userName">
   </div>
   <br/>
   <div class="input-group">
      <span class="input-group-addon"><i class="icon icon-key"></i></span>
      <input type="password" class="form-control" placeholder="密码" name="passWord"><br />
   </div>
   <br/>
   <div class="input-group">
      <span class="input-group-addon"><i class="icon icon-key"></i></span>
      <input type="password" class="form-control" placeholder="重复密码"><br />
   </div>
   <br/>
   <div class="input-group">
      <span class="input-group-addon"><i class="icon icon-map-marker"></i></span>
      <input type="text" class="form-control" placeholder="地址" name="address"><br />
   </div>
   <br/>
   <div class="input-group">
      <span class="input-group-addon"><i class="icon icon-mobile"></i></span>
      <input type="text" class="form-control" placeholder="电话" name="userPhone"><br />
   </div>
   <br/>
   <div class="input-group">
      <span class="input-group-addon">
          <input type="radio" value="用户" name="type">
      </span>
      <span class="input-group-addon">
                         用户
      </span>
      <span class="input-group-addon">
          <input type="radio" value="管理员" name="type">
      </span>
      <span class="input-group-addon">
                         管理员
      </span>
      <span class="input-group-addon">
          <input type="radio" value="物流公司" name="type">
      </span>
      <span class="input-group-addon">
                         物流公司
      </span>
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
</html>