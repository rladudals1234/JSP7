<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp</title>
</head>
<body>
	<h2>jsp - 스크립트릿</h2>
	<%!
	int sum(int a, int b){
		return a+b;
	}
	%>
	<%
		int i=0;
		while(i<10){
			out.println("<h3>"+i+"</h3><br>");
			i++;
		}
		
		for(i=0;i<10;i++){
			out.println(i+"<br>");
		}
	%>
	<h3><%= sum(2,100) %></h3>
</body>
</html>