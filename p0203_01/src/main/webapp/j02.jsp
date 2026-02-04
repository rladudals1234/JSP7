<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쿠키추가</title>
</head>
<body>
	<h2>쿠키추가하기</h2>
	<form action="./j02_01.jsp" method="post" name="frm">
		<input type="text" name="cookie_key" placeholder="쿠키의 key값을 입력하세요."><br>
		<input type="text" name="cookie_value" placeholder="쿠키의 value값을 입력하세요."><br>
		<input type="submit" value="쿠키 추가하기">
	</form>
	<a href="./j02_02.jsp"><button>쿠키확인</button></a>
</body>
</html>