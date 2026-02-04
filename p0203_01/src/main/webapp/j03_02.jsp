<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션확인</title>
</head>
<body>
<h2>세션확인</h2>
<%
	String id = session.getAttribute("session_id").toString();
	String name = session.getAttribute("session_name").toString();
	out.println("아이디 : "+id+"<br>");
	out.println("이름 : "+name+"<br>");
%>
<h3>세션에서 가져온 아이디 : <%= session.getAttribute("session_id") %></h3>
<h3>세션에서 가져온 이름 : <%= session.getAttribute("session_name") %></h3>
<ul>
	<% if(session.getAttribute("session_id") != null){ %>
	<li><a href="./j03.jsp">처음으로</a></li>
	<li>회원가입</li>
	<li><a href="./Logout">로그아웃</a></li>
	<li><a href="./j03_02.jsp">회원정보</a></li>
	<%} %>
</ul>
<form action="./j03_04.jsp" method="post" name="frm">
	<p>세션삭제</p>
	키값 : <input type="text" name="session_id"><br>
	<input type="submit" value="해당세션만 삭제하기">
</form>
<a href="./j03_03.jsp">세션삭제</a>
<a href="./j03.jsp">세션추가</a>
</body>
</html>