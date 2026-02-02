<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼페이지</title>
</head>
<body>
	<h2>회원가입</h2>
	<form action="/p0202_01/Pro4" method="post">
		<input type="text" name="id" placeholder="아이디를 입력하세요."/>
		<br>
		<input type="password" name="password" placeholder="패스워드를 입력하세요."/>
		<br>
		<input type="text" name="name" placeholder="이름을 입력하세요."/>
		<br>
		<input type="checkbox" id="game" name="hobby" value="게임"/>
		<label for="game">게임</label>
		<input type="checkbox" id="golf" name="hobby" value="골프"/>
		<label for="golf">골프</label>
		<input type="checkbox" id="swim" name="hobby" value="수영"/>
		<label for="swim">수영</label>
		<input type="checkbox" id="run" name="hobby" value="조깅"/>
		<label for="run">조깅</label>
		<input type="checkbox" id="book" name="hobby" value="독서"/>
		<label for="book">독서</label>
		<input type="submit" value="전송"/>
	</form>
</body>
</html>