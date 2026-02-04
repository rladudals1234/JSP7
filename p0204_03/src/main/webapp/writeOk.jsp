<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일업로드완료</h2>
	<%
		//request.getParameter("title");
		//String uploadPath = "C:/Users/KOSMO/git/JSP7/p0204_01/src/main/webapp/upload/";
		//String uploadPath = request.getSession().getServletContext().getRealPath("/upload");		//톰캣서버에 있는 건 중단하거나 하면 파일 날아감 C:\tomcat9\wtpwebapps\p0204_03\ upload 해당경로
		String uploadPath = "C:/upload/";
		int size = 10*1024*1024;	//1kb=1024b, 1mb=1024kb, 10mb=10*1024*1024
		
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
		String id = multi.getParameter("id");
		String btitle = multi.getParameter("btitle");
		String bcontent = multi.getParameter("bcontent");
		String bfile = multi.getFilesystemName("bfile");
		out.println("작성자 : "+id+"<br>");
		out.println("제목 : "+btitle+"<br>");
		out.println("내용 : "+bcontent+"<br>");
		out.println("파일명 : "+bfile+"<br>");
	%>
</body>
</html>