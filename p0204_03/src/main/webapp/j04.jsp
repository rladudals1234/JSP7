<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//세션추가 - 서버저장
		session.setAttribute("session_id", "session_aaa");
		//쿠키추가 - 로컬유저컴퓨터
		Cookie cookie = new Cookie("cookie_id","cookie_bbb");
		cookie.setMaxAge(60*60);	//1시간 = 60초*60분
		response.addCookie(cookie);
	%>
	
	<h2>폼</h2>
	<form action="./formOk.jsp" method="post" name="frm">
		<input type="text" name="title" placeholder="제목을 입력하세요.">
		<br>
		<input type="text" name="name" placeholder="이름을 입력하세요.">
		<br>
		<input type="submit" value="전송">
	</form>
</body>
</html>