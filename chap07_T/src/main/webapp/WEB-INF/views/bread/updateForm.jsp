<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Update Page</title>
</head>
<body>

	<h3># 빵 수정하기</h3>
		 <form action="./update" method="POST">
			이름: <input name="bread_name" type="text"><br>
			가격: <input name="bread_price" type="number" min="0" step="100"><br>
        <input type="submit" value="Update Bread">
    </form>
</body>
</html>