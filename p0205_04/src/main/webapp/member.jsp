<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<style>
table,th,td{
	border:1px solid black;
	border-collapse:collapse;
}
table{
	width: 1000px;
	margin: 20px auto;
}
th,td{
	width:1000px;
	height:40px;
	text-align:center;
}
h2{
	text-align: center;
}
</style>
</head>
<body>
	<%request.setAttribute("nick", "길동스"); %>
	<h2>회원정보</h2>
	<h3>request 자체 nick : ${nick}</h3>
	<h3>request FController nickName : ${nickName}</h3>
	<ul>
		<li><a href="main.do">메인페이지</a></li>
		<li><a href="member.do">회원정보</a></li>
		<li><a href="board.do">게시판</a></li>
		<li><a href="bwrite.do">글쓰기</a></li>
		<li><a href="membership.do">회원가입</a></li>
	</ul>
	<p>개수 : ${list.size()}</p>
	<%-- ${member.id}
	
	<%
		MemberDto m = new MemberDto();
	%> --%>
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
	<%-- <tr>
		<td>${member.id}</td>
		<td>${member.pw}</td>
		<td>${member.name}</td>
		<td>${member.phone}</td>
		<td>${member.email}</td>
		<td>${member.gender}</td>
		<td>${member.hobby}</td>
	</tr> --%>
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