<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쿠키삭제</title>
</head>
<body>
	<h2>쿠키삭제</h2>
	<!-- 쿠키삭제 소스 -->
	<%
	Cookie[] cookies = request.getCookies();
	for(Cookie cook:cookies){
		cook.setMaxAge(0);
		response.addCookie(cook);
	}
	%>
	<a href="j02_02.jsp"><button>쿠키확인</button></a>
</body>
</html>