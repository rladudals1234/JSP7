<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jsp 태그 - 6가지 주석,스크립트릿,표현식,선언식,지시자,액션태그</title>
	</head>
	<body>
		<h2>jsp태그</h2>
		<%-- 1. jsp주석:실행시 코드에 주석이 보이지 않음 --%>
		<!-- html주석:실행시 코드에 주석이 보여짐 -->
		<!-- 2. 스크립트릿 -->
		<%
			int[] num = {1,2,3};
			int a = 10;
			Arrays.toString(num);
			//스크립트릿에서 외부로 출력하는 방법
			System.out.println(Arrays.toString(num));
		%>
		<!-- 3. 표현식 -->
		<%= a %>
		<!-- 선언식은 무조건 외부 출력이 됨. -->
		<!-- 4. 선언식 : 변수,메소드선언 변수: 전역변수같은 개념으로 사용가능 -->
		<%! int b = 10; %>
		<!-- 5. 지시자:import,최초선언 -->
		<%-- <%@ %>  --%>
	</body>
</html>