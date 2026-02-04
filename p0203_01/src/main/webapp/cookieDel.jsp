<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키삭제</title>
</head>
<body>
	<%
		//쿠키 만료시간을 채워서 만료처리
		//쿠키전체 가져오기
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie cookie:cookies){
				//해당쿠키 삭제 1개
				if(cookie.getName().equals("cook_id")){
					out.println("cook_id가 존재");
				}
				//쿠키시간설정
				cookie.setMaxAge(0);
				//쿠키로컬에 저장시켜야 삭제완료됨.
				response.addCookie(cookie);
			}
		}
		out.println("-------------------------------------<br>");
		//쿠키 모두삭제
		for(Cookie cookie:cookies){
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
	%>
	<a href="./cookieView.jsp"><button>쿠키확인</button></a>
</body>
</html>