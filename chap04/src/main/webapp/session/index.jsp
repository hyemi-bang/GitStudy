<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3># Http의 비연결성</h3>
	
	<ul>
		<li>HTTP는 응답을 하고 나면 클라이언트와의 연결을 끊어버린다</li>
		<li>별도의 조치가 없다면 해당 클라이언트가 이전에 접속한 클라이언트와 동일한 클라이언트인지 구분할 수 없다</li>
	</ul>
	

	<h3># Http Session 발급순서</h3>
	
	<ol>
		<li>클라이언트가 최초로 웹 서버에 접속하면 서버는 해당 클라이언트에게 세션ID를 발급</li>
		<li>발급받은 세션ID는 클라이언트측의 웹 브라우저에 저장된다. (같은 IP 다른 웹 브라우저로 접속하면 세로운 세션ID를 발급받는다)</li>
		<li>이후 해당 클라이언트는 해당 서버로 요청을 보낼때마다 세션ID를 요청에 실어 함께 전달하게 된다</li>
		<li>서버는 실려온 세션ID로 클라이언트를 구분할 수 있다</li>
		<li>세션ID는 개인 사물함 열쇠 같은 역할을 하기도 한다 <br /> 세션 어트리뷰트에 접근할 떄 해당 세션Id를 열쇠로 사용한다</li>
		<li>세션 객체에 너무 많은 양의 데이터를 추가하는 것은 서버의 성능을 저하시킬 수 있으므로 주의해야 한다</li>
		<li>세션ID는 기본적으로 사용자의 웹 브라우저가 종료될 때 함께 사자리도록 설정되어 있다</li>
		<li>세션 어트리뷰트는 일정시간 동안 요청을 받지 않으면 사라지도록 설정되어 있다</li>
	</ol>
</body>
</html>