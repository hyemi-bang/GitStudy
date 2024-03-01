<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키</title>
</head>
<body>

	<h3># Cookie</h3>
	
	<ul>
		<li>쿠키는 서버에서 응답을 실어 보내면 웹 브라우저(클라이언트)에서 보관하는 데이터다</li>
		<li>웹 브라우저는 해당 서버로 요청을 보낼 떄마다 해당 서버에서 맡긴 쿠키를 요청에 함께 실어 전달한다</li>
		<li>세션 기능은 쿠기를 활용하는 기능이다. 기본적으로 쿠키에 세션ID(세션ID는 기본적으로 해쉬값이라 위변조해도 맞출 수 없다) 보관</li>
		<li>쿠키에 저장되어 있는 값은 클라이언트 측에서 언제든지 위/변조가 가능하다는 것을 감안하고 사용해야한다(보안이 취약하다)</li>
		<li>값은 name / value 형식으로 추가된다</li>
		<li>웹 브라우저에는 로컬스토리지,세션스토리지 / 쿠키의 3가지의 저장소가 있다.
		로컬,세션은 자바스크립트에서 추가해서 활용하는 값이고 쿠키는 서버에서 활용하는 값이다</li>
	</ul>

	<h3># 쿠키의 설정 옵션들</h3>
	
	<ul>
		<li>maxAge	: 쿠키의 수명을 설정</li>
		<li>path 	: 쿠키가 어떤 URI범위에서 사용될지 설정 </li>
		<li>name	: 해당 쿠키의 이름</li>
		<li>value	: 해당 쿠키의 값</li>
	</ul>
	
	<a href="./add.jsp">새 쿠키 추가하기 </a> <br>
	<a href="./modify.jsp">쿠키 수정하기</a><br>
	<a href="./delete">쿠키 삭제하기</a> <!--  서블릿에서도 가능하다~ -->
</body>
</html>