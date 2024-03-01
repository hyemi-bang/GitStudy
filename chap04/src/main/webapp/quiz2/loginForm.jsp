<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//이미 로그인된 상태라면 메모파일로 바로 가도록 설정
	if (session.getAttribute("info") != null) {
	response.sendRedirect("/chap04/quiz2/memo/main");
	return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>

	<h3>#로그인</h3>

	<!-- input form 을 추가한다~ -->
	ID:<input name="id" type="text" form="form1"> <br> 
	PASSWORD:<input name="pwd" type="password" form="form1"><br>
	<button type="submit" form="form1">로그인</button>

	<!-- id, form 속성을 활용하여 form태그 밖에 있는 요소들도 해당 폼의 소속으로 설정할 수 있다.  -->
	<form id="form1" action="/chap04/quiz2/login" method="POST"></form>

</body>
</html>