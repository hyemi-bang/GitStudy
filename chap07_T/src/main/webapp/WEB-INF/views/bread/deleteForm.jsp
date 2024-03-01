<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Delete Bread page</title>
</head>
<body>

	<h3># 빵 삭제하기</h3>
		  <form action="./delete" method="POST">
			이름: <input name="bread_name" type="text"><br>
        <input type="submit" value="빵 지우기">
    </form>
		

</body>
</html>