<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>퀴즈</title>
</head>
<body>

	<h3>#Quiz</h3>

	<ul>
		<li>이 페이지에 접속할 때 광고창이 하나 뜨게 만들기</li>
		<li>광고창에는 적당한 이미지 하나와 체크박스 버튼이 있습니다</li>
		<li>체크박스를 체크하고 창을 닫으면 30초 동안 이 페이지에 접속하더라도 광고창이 뜨지 않아야 합니다.</li>
	</ul>
	
	<script>
	open('/chap09/quiz/adPopup.jsp','_blank','width=400,height=600,top=100,right=100');
	
	</script>
</body>
</html>