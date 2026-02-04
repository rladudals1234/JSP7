<%@page import="javax.sql.DataSource" %>
<%@page import="javax.naming.Context" %>
<%@page import="javax.naming.InitialContext" %>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
	<h2>메인페이지</h2>
	<%-- jsp주석 : jsp 5가지 태그 --%>
	<%--
		<% %> : 스크립트릿
		<%= %> : 표현식
		<%! %> : 선언식
		<%@ %> : 지시자
		jsp태그
	--%>
	<%
		Connection conn = null;				//db연결
		PreparedStatement pstmt = null;		//sql구문 실행
		ResultSet rs = null;				//결과값
		int bno=0, bgroup=0, bstep=0, bindent=0,bhit=0;
		String btitle="", bcontent="", id="", bfile="";
		Timestamp bdate = null;
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/Oracle21");
			conn = ds.getConnection();
			String query = "select * from board";
			//sql구문 실행
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bno = rs.getInt("bno");
				btitle = rs.getString("btitle");
				bcontent = rs.getString("bcontent");
				id = rs.getString("id");
				bgroup = rs.getInt("bgroup");
				bstep = rs.getInt("bstep");
				bindent = rs.getInt("bindent");
				bhit = rs.getInt("bhit");
				bfile = rs.getString("bfile");
				bdate = rs.getTimestamp("bdate");
				out.println(bno+","+btitle+","+bcontent+","+id+","+bgroup+","+bstep+","+bindent+","+bhit+","+bfile+","+bdate+"<br>");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		for(int i=1; i<=10;i++) {
			out.println(i+"<br>");
		}
	%>
</body>
</html>