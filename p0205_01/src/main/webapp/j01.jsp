<%@page import="java.util.List"%>
<%@page import="dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String query = null;
	String id="",pw="",name="",phone="",email="",gender="",hobby="";
	List<Member> list = new ArrayList<Member>();
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/Oracle21");
		conn = ds.getConnection();
		query = "select * from member";
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		while(rs.next()){
			id = rs.getString("id");
			pw = rs.getString("pw");
			name = rs.getString("name");
			phone = rs.getString("phone");
			email = rs.getString("email");
			gender = rs.getString("gender");
			hobby = rs.getString("hobby");
			list.add(new Member(id,pw,name,phone,email,gender,hobby));
		}
		request.setAttribute("list", list);
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
			if(rs!=null)rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
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