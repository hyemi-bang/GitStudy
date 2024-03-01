<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Add New Bread Page!</title>
</head>
<body>
	<h3>#빵 추가하기</h3>
		<form action="./add" method="POST">
			이름: <input name="bread_name" type="text"><br> 
			<!-- 이름 중복 체크를 하고 싶을 때 
			1> 서버로 요청을 보내서 검사한다 중복이면 리다이렉트
			2> 서버에서 BreadAddForm으로 넘어올때 이미 모든 빵들의 이름을 가지고 오는 방법
			3> 나중에 하쟈 하심 ㅋㅋ
			-->
			가격: <input name="bread_price" type="number" min="0" step="100"><br>
			<input type="submit" value="추가하기">
		</form>

</body>
</html>