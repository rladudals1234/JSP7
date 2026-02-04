<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
		int size = 10*1024*1024;	//1kb=1024b, 1mb=1024kb, 10mb=10*1024*1024
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		
		//MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", policy);
		
		//MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
	%>
</body>
</html>