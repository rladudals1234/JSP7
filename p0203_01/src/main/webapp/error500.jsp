<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!-- 에러가 있는 페이지가 아니라 에러페이지로 작성된 페이지입니다. -->
<% response.setStatus(200); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500에러페이지 - 서버에러</title>
<style>
div{
	width: 80%;
	margin:50px auto;
	border: 1px solid #ccc;
}
img{
	width:100%;
}
</style>
</head>
<body>
	<div>
		<img src="/p0203_01/images/error500.jpg">
	</div>
</body>
</html>