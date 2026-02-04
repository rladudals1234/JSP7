<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
<h2>메인페이지</h2>
<h3>세션정보 : ${session_id}</h3>
<c:set var="no" value="100"/>
<h3>no변수값 el태그 : ${no}</h3>
<h3>no변수값 out태그 : <c:out value="${no}" /></h3>
<ul>
<c:choose>
	<c:when test="${session_id == null}">
		<li><a href="./form.jsp">로그인</a></li>
		<li>회원가입</li>
	</c:when>
	<c:otherwise>
		<li><a href="./logout">로그아웃</a></li>
		<li>회원정보</li>
	</c:otherwise>
</c:choose>
<%--
	<c:if test="${session_id == null}">
	<li><a href="./form.jsp">로그인</a></li>
	<li>회원가입</li>
	</c:if>
	<c:if test="${session_id != null}">
	<li><a href="./logout">로그아웃</a></li>
	<li>회원정보</li>
	</c:if>
--%>	
</ul>
</body>
</html>