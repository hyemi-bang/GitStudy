<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>

	<button onclick="location.href='/chap04/quiz2/loginForm.jsp';"> 로그인 하러가기 </button>
	<button onclick="location.href='/chap04/quiz2/registerForm.jsp';"> 회원가입 </button>

	<h3>#모든 어트리뷰트 찍어보기</h3>

	<ul>
		<%
		// scope.getArrtibuteNames() : 해당 영역의 모든 어트리뷰트 이름들을 꺼낼 수 있는 객체를 반환
		java.util.Enumeration<String> names = application.getAttributeNames();

		while (names.hasMoreElements()) {
			String name = names.nextElement();

			out.print(String.format("<li>%s=%s</li>", name, application.getAttribute(name)));
		}
		%>
	</ul>
	
	<script>
		
	<%
	
	if (request.getParameter("error") != null) {
		if (request.getParameter("dup") != null) {
		out.print("alert('이미 사용중인 아이디 입니다!')");
	} else {
		out.print("alert('')");
		}
	}

	%>
		
	</script>
</body>
</html>