<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쿠키삭제</title>
</head>
<body>
	<h2>쿠키삭제</h2>
	<!-- 쿠키삭제 소스 -->
	<%
	//삭제할 쿠키정보
	String key = request.getParameter("cookie_key");
	Cookie[] cookies = request.getCookies();
	int temp=0;
	for(Cookie cook:cookies){
		if(key.equals(cook.getName())){
			temp=1;
			cook.setMaxAge(0);
			response.addCookie(cook);
			out.println(key+"쿠키가 삭제되었습니다.<br>");
		}
	}
	if(temp==0){
		out.println("입력한 쿠키정보가 없습니다. 삭제가 되지 않았습니다.<br>");
	}
	%>
	<a href="j02_02.jsp"><button>쿠키확인</button></a>
</body>
</html>