<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%

	//서버측에서 쿠키 추가하기
	Cookie cookie = new Cookie("hideProm", "1");
	cookie.setMaxAge(30);
	cookie.setHttpOnly(true); // HttpOnly 보안상의 이유로 자바스크립트에서 사용할 수 없게 한다
	response.addCookie(cookie);
%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<script>
		window.close();
	</script>


</body>
</html>