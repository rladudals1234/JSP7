<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드</title>
</head>
<body>
	<h2>파일업로드</h2>
	<form action="./fileOk.jsp" method="post" name="frm" enctype="multipart/form-data">
		<input type="text" name="title" placeholder="제목을 입력하세요.">
		<br>
		<input type="file" name="bfile"><br>
		<input type="submit" value="전송"	>
	</form>
</body>
</html>