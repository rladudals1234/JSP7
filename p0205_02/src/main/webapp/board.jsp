<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
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
	<h2>게시판</h2>
	<!-- list:request -->
	<h3>리스트 개수 : ${list.size()}</h3>
	<table>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
		<th>글그룹</th>
		<th>글순서</th>
		<th>들여쓰기</th>
		<th>조회수</th>
		<th>파일</th>
		<th>날짜</th>
	</tr>
	<!-- for문 -->
	<c:forEach var="board" items="${list}">
	<tr>
		<td>${board.bno}</td>
		<td>${board.btitle}</td>
		<td>${board.bcontent}</td>
		<td>${board.id}</td>
		<td>${board.bgroup}</td>
		<td>${board.bstep}</td>
		<td>${board.bindent}</td>
		<td>${board.bhit}</td>
		<td>${board.bfile}</td>
		<td>${board.bdate}</td>
	</tr>
	</c:forEach>
	</table>
</body>
</html>