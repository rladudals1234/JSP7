<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>db연결</title>
</head>
<body>
	<h2>db연결</h2>
	<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "ora_user";
	String upw = "1111";
	String query = "";
	String id="", pw="", name="", phone="", email="", gender="", hobby="";
	
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url,uid,upw);
		query = "select * from member";
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		while(rs.next()){
			id=rs.getString("id");
			pw=rs.getString("pw");
			name=rs.getString("name");
			phone=rs.getString("phone");
			email=rs.getString("email");
			gender=rs.getString("gender");
			hobby=rs.getString("hobby");
			
			out.println("<div>"+id+","+pw+","+name+","+phone+","+email+","+gender+","+hobby+"<br></div>");
		}
	} catch(Exception e) {
		e.printStackTrace();
	}finally{
		try{
			if(rs!=null){
				rs.close();
			}
			if(pstmt!=null){
				pstmt.close();
			}
			if(conn!=null){
				conn.close();
			}
		}catch(Exception e2){
			e2.printStackTrace();
		}
	}
	%>
</body>
</html>