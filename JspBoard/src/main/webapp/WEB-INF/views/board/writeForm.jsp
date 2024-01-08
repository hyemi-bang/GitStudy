<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>글쓰기</title>
</head>
<body>
	<h1>글쓰기</h1>

	<form action="./write" method="POST" id="writeForm">
		글 제목 : <input type="text" name="board_title" /><br /> 
		글쓴사람 : <input type="text" name="board_writer" /> <br /> 
		비밀번호 : <input type="password" name="board_password" /><br />
		<textarea name="board_content" rows="" cols=""></textarea>
	</form>
	
	<button type="submit" form="writeForm">글쓰기</button>
	<button>글 목록</button>
</body>
</html>