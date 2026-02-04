<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>db연결</title>
	</head>
	<body>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "ora_user";
		String upw = "1111";
		String query = "";
		String id="",pw="",name="",phone="",email="",gender="",hobby="";
	%>
	<%
		 try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ora_user","1111");
			//query = "select * from member where id like '%?%'";
			query = "select * from member where id=? and pw=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,"aaa");
			pstmt.setString(2,"1111");
			rs = pstmt.executeQuery();
			while(rs.next()){
				id = rs.getString("id");
				pw = rs.getString("pw");
				name = rs.getString("name");
				phone = rs.getString("phone");
				email = rs.getString("email");
				gender = rs.getString("gender");
				hobby = rs.getString("hobby");
				
				out.println(id+","+pw+","+name+","+phone+","+email+","+gender+","+hobby+"<br>");
			}
			
			 
			 
			 
			 
			 
		 } catch (Exception e) { e.printStackTrace(); //에러발생형태,위치
		 } finally {
			try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
			} catch (Exception e2) {e2.printStackTrace();}
		 }
	%>
	
	</body>
</html>