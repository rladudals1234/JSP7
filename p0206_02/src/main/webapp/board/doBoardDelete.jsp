<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	if(${flag==1}) {
		alert("게시글이 삭제되었습니다.");
		location.href="./board.do";
	}else{
		alert("게시글 삭제에 실패하였습니다.");
		location.href="./boardView.do?bno=${bno}";
	}
</script>
</body>
</html>