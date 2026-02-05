<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table,th,td{
	border:1px solid black;
	border-collapse:collapse;
}
table{
	width: 500px;
	margin: 20px auto;
}
th,td{
	width:100px;
	height:40px;
	text-align:center;
}
h2{
	text-align: center;
}
</style>
</head>
<body>
<%
	
%>
<h2>메인페이지</h2>
<table>
<tr>
	<th>아이디</th>
	<th>비밀번호</th>
	<th>이름</th>
	<th>전화번호</th>
	<th>이메일</th>
	<th>성별</th>
	<th>취미</th>
</tr>
<!-- for문 -->
<c:forEach var="member" items="${list}">
<tr>
	<td>${member.id}</td>
	<td>${member.pw}</td>
	<td>${member.name}</td>
	<td>${member.phone}</td>
	<td>${member.email}</td>
	<td>${member.gender}</td>
	<td>${member.hobby}</td>
</tr>
</c:forEach>
</table>
</body>
</html>