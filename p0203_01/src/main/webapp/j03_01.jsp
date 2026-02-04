<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션추가</title>
</head>
<body>
<h2>세션추가</h2>
<%
	String id = request.getParameter("session_id");
	String name = request.getParameter("session_name");
	out.println("아이디 : "+id+"<br>");
	out.println("이름 : "+name+"<br>");
	//세션추가
	session.setAttribute("session_id", id);
	session.setAttribute("session_name", name);
%>
<a href="./j03_02.jsp">세션확인</a>
<a href="./j03_03.jsp">세션삭제</a>
</body>
</html>