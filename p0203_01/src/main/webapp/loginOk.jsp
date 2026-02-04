<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인확인</title>
</head>
<body>
	<h2>로그인확인</h2>
	<h3>아이디 : <%= request.getParameter("id") %></h3>
	<h3>비밀번호 : <%= request.getParameter("pw") %></h3>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		//id=null;
		//if(id.equals("aaa") && pw.equals("1111")){
		if("aaa".equals(id) && "1111".equals(pw)){	//변수를 equals뒤에 둬서 null 경우 에러발생 없애기
			session.setAttribute("session_id", request.getParameter("id"));
			session.setAttribute("session_pw", request.getParameter("pw"));
			response.sendRedirect("j03.jsp");
		}else{
			response.sendRedirect("login.jsp");
		}
	%>
	<!-- aaa,1111이면 세션추가 : session_id redirect -> j03.jsp -->
	<!-- aaa,1111 아니면 : redirect -> login.jsp -->
</body>
</html>