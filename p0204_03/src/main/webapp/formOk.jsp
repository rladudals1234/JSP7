<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>결과</h2>
	<%
		//post방식 = setCharacterEncoding() 한글처리
		request.setCharacterEncoding("utf-8");
		int i = 10;
		out.println(i+100+"<br>");
	%>
	<!-- jsp태그랑 함께 사용할 수 없음. jstl태그를 사용하게 됨. -->
	<p>el태그 사용 : ${param.title}</p>
	<p>el태그 사용 : ${param.name}</p>
	<p>el태그 세션 : ${sessionScope.session_id}</p>
	<p>el태그 세션 : ${session_id}</p>
	<p>el태그 세션 : ${cookie.cookie_id.value}</p>
	
	<p>변수선언 i : ${i}</p>
	<p>jsp request : <%=request.getParameter("title") %></p>
	<p>jsp request : <%=request.getParameter("name") %></p>
	<p>jsp 세션 : <%=session.getAttribute("session_id") %></p>
	<p>jsp 쿠키 : <%
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie:cookies){
			out.println("쿠키 : "+cookie.getValue()+"<br>");
		}
	%></p>
	<%-- <%
		int i = 10;
		out.println(i+100+"<br>");
	%> --%>
	<p><%= i+100 %></p>
</body>
</html>