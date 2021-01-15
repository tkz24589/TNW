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
<div style="width:1200px;margin:0 auto;padding-top:100px;">
    <div style="width:200px;margin:0 auto;padding-top:100px;">${message}<s:debug></s:debug></div>
    <button class="btn btn-success " type="button" style="display:block;width:60px;margin:100px auto;" onclick="backto()"><i class="icon icon-circle-arrow-left"></i>返回</button>
</div>
</body>
<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/lib/jquery/jquery.js"></script>
<script src="${pageContext.servletContext.contextPath}/zui-1.9.1-dist/dist/js/zui.min.js" type="text/javascript"></script>
<script type="text/javascript">
    function backto(){
    	window.history.go(-1);
    }
</script>
</html>