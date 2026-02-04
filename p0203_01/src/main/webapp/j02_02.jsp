<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키확인</title>
</head>
<body>
<h2>쿠키확인</h2>
<!-- 쿠키출력 -->
<%
Cookie[] cookies = request.getCookies();
for(Cookie cook:cookies){
	out.println("<p>"+cook.getName()+","+cook.getValue()+"</p><br>");
}
%>
<form action="./j02_04.jsp" method="post" name="frm">
	<p>쿠키삭제</p>
	키값 : <input type="text" name="cookie_key"><br>
	<input type="submit" value="해당쿠키만 삭제하기">
</form>
<a href="j02_03.jsp">쿠키삭제</a>
<a href="j02.jsp">쿠키추가</a>
</body>
</html>