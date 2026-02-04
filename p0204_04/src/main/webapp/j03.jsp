<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request</title>
</head>
<body>
	<h2>request객체, response객체 - 내장객체</h2>
	<%
		String s = request.getParameter("");
		String[] str = request.getParameterValues("");
		request.setAttribute("nickName", "hong");
	%>
	
	<%= request.getAttribute("nickName") %>
</body>
</html>