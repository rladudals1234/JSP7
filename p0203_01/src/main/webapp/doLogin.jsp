<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인확인</title>
</head>
<body>
	<h2>로그인결과</h2>
	<p>아이디 : <%=request.getParameter("id") %></p>
	<p>패스워드 : <%=request.getParameter("pw") %></p>
	<p>아이디저장 체크박스 확인 : <%=request.getParameter("cook_save") %></p>
	<!-- 아이디 저장이 체크되어 있으면 쿠키저장 -->
	<!-- cook_id -->
	<%
		String cook_save = request.getParameter("cook_save");
		//if(cook_save!=null || !cook_save.equals("")){
		if("ok".equals(cook_save)){
			Cookie cook_id = new Cookie("cook_id",request.getParameter("id"));
			cook_id.setMaxAge(60*60);
			response.addCookie(cook_id);
		}else{
			Cookie[] cookies = request.getCookies();
			for(Cookie cook:cookies){
				if(cook.getName().equals("cook_id")){
					cook.setMaxAge(0);
					response.addCookie(cook);
				}
			}
		}
	%>
</body>
</html>