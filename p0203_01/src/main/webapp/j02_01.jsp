<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쿠키설정하기</title>
</head>
<body>
	<%
	Cookie cook = new Cookie(request.getParameter("cookie_key"),request.getParameter("cookie_value"));
	cook.setMaxAge(60*60);
	out.println("쿠키 추가 : "+cook.getName()+","+cook.getValue());
	response.addCookie(cook);
	%>
	<h2>form데이터 확인</h2>
	<form action="./j02_01.jsp" method="post" name="frm">
		<input type="text" name="cookie_key"><br>
		<input type="text" name="cookie_value"><br>
		<input type="submit" value="쿠키 추가하기">
	</form>
	<a href="./j02_02.jsp"><button>쿠키확인</button></a>
</body>
</html>