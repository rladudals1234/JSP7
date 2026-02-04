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
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>아이디</th>
			<th>그룹</th>
			<th>스탭</th>
			<th>들여쓰기</th>
			<th>조회수</th>
			<th>파일</th>
			<th>날짜</th>
		</tr>
	<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int bno=0,bgroup=0,bstep=0,bindent=0,bhit=0;		//String으로도 받을 수 있음
	String btitle="",bcontent="",id="",bfile="";
	Timestamp bdate = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/Oracle21");
		conn = ds.getConnection();
		out.println("db connection연결 1개 가져옴\n");
		
		String query = "select * from board order by bno";
		//String query = "select * from board where btitle like '%?%' order by bno";
		pstmt = conn.prepareStatement(query);
		//String search = "t";
		//pstmt.setString(1, "%"+search+"%");
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
			%>
				<tr>
					<td><%=bno %></td>
					<td><%=btitle %></td>
					<td><%=bcontent %></td>
					<td><%=id %></td>
					<td><%=bgroup %></td>
					<td><%=bstep %></td>
					<td><%=bindent %></td>
					<td><%=bhit %></td>
					<td><%=bfile %></td>
					<td><%=bdate %></td>
				</tr>
			<%
			
			//out.println(bno+","+btitle+","+bcontent+","+id+","+bgroup+","+bstep+","+bindent+","+bhit+","+bfile+","+bdate+"<br>");
		}
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
	</table>
</body>
</html>