<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>

	<h3>#회원가입</h3>

	<form action="/chap04/quiz2/register" method="POST">
		ID <input name="id" type="name"/> <br>
		PASSWORD <input name="pwd" type="password"/><br>
		<input type="submit" value="가입하기">
	</form>
</body>
</html>