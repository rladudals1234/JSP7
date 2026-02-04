<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취미</title>
</head>
<body>
	<h2>취미 배열 확인</h2>
	<c:forEach var="hobby" items="${paramValues.hobby}">
		<p>취미 : ${hobby}</p>
	</c:forEach>
	<%
		String[] hobby = request.getParameterValues("hobby");
		for(int i=0;i<hobby.length;i++){
			out.println("취미 : "+hobby[i]+"<br>");
		}
		out.println("---------------------------------------------------------------------<br>");
		
		for(String h:hobby){
			out.println(h+"<br>");
		}
	%>
</body>
</html>