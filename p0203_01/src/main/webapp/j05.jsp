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
	int bno=0,bgroup=0,bstep=0,bindent=0,bhit=0;		//String으로도 받을 수 있음
	String btitle="",bcontent="",id="",bfile="";
	Timestamp bdate = null;
	
	try{
		//Data Source Explorer와 다름 -> 디벨로퍼 켤 필요없이 이클립스에서 쿼리확인 가능(Open SQL Scrapbook)
		//db커넥션 하는 부분 속도가 가장 늦음. - 커넥션 풀,
		//DB정보가 jsp에 노출
		Class.forName(driver);
		conn = DriverManager.getConnection(url,uid,upw);
		query = "select * from board order by bno";
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		while(rs.next()){
			bno=rs.getInt("bno");
			btitle=rs.getString("btitle");
			bcontent=rs.getString("bcontent");
			id=rs.getString("id");
			bgroup=rs.getInt("bgroup");
			bstep=rs.getInt("bstep");
			bindent=rs.getInt("bindent");
			bhit=rs.getInt("bhit");
			bfile=rs.getString("bfile");
			bdate=rs.getTimestamp("bdate");
			
			out.println("<div>"+bno+","+btitle+","+bcontent+","+id+","+bgroup+","+bstep+","+bindent+","+bhit+","+bfile+","+bdate+"<br></div>");
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