<%@page import="javax.sql.DataSource" %>
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.InitialContext" %>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커넥션풀 연결</title>
<style>
table,th,td{
	border:1px solid #ccc;
	border-collapse:collapse;
	text-align:center;
}
table{
	width: 1000px;
	margin:30px auto;
}
th{
	max-width: 1000px;
}
</style>
</head>
<body>
	<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String id="",pw="",name="",phone="",email="",gender="",hobby="";
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/Oracle21");
		conn = ds.getConnection();
		out.println("db connection연결 1개 가져옴\n");
		
		String query = "insert into mem (id, pw, name, phone, email, gender, hobby, nicname) values(?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, "abc");
		pstmt.setString(2, "1111");
		pstmt.setString(3, "홍홍홍");
		pstmt.setString(4, "010-1111-1111");
		pstmt.setString(5, "abc@naver.com");
		pstmt.setString(6, "M");
		pstmt.setString(7, "조깅");
		pstmt.setString(8, "홍홍스");
		//'abc','1111','홍홍홍','홍홍스','010-1111-1111','abc@naver.com','M','조깅'
		pstmt.executeUpdate();
		out.println("insert완료");
	} catch(Exception e) {
		e.printStackTrace();
	}finally{
		try{
			if(rs!=null){rs.close();}
			if(pstmt!=null){pstmt.close();}
			if(conn!=null){conn.close();}
		}catch(Exception e2){
			e2.printStackTrace();
		}
	}
	%>
</body>
</html>