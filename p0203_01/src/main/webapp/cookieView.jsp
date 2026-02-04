<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키확인</title>
</head>
<body>
	<%
		//쿠키전체 가져오기
		Cookie[] cookies = request.getCookies();
		int temp = 0;
		if(cookies != null){
			for(int i=0;i<cookies.length;i++){
				//쿠키 이름, 값 출력
				cookies[i].getName();
				cookies[i].getValue();
				out.println(cookies[i].getName()+","+cookies[i].getValue());
				//cook_id는 존재
				if(cookies[i].getName().equals("cook_id")){
					out.println("cook_id가 존재 : "+cookies[i].getValue()+"<br>");
				}
				//cook_pw는 존재하지 않음
				if(cookies[i].getName().equals("cook_pw")){
					temp=1;
				}
			}
		}
		if(temp==0){
			out.println("cook_pw는 존재하지 않음");
		}
		//배열for문
		for(Cookie cookie:cookies){
			out.println(cookie.getName()+","+cookie.getValue()+"<br>");
		}
	%>
	<br>
	<a href="./cookieDel.jsp"><button>쿠키 모두 삭제하기</button></a>
	<a href="./cookieInsert.jsp"><button>쿠키 추가하기</button></a>
</body>
</html>