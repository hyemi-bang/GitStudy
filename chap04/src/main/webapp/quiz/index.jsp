<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>loginQuiz.jsp</title>
</head>
<body>

	<h3># 요구사항</h3>

	<ul>
		<li>아이디와 비밀번호를 입력하고 로그인 버튼을 누럴 로그인 할 수 있다</li>
		<li>회원가입은 아이디와 비밀번호만 입력하면 완료된다 (아이디 중복은 체크해야하고, 가입된 정보는
			application Attribute영역에 등록한다)</li>
		<li>로그인에 성공한 사람은 세션이 유지되는 동안 로그인이 계속 유지되어야한다</li>
		<li>로그인한 사람은 새로운 메모를 등록할 수 있고, 이전에 작성한(등록해둔) 메모를 볼 수 있어야 한다</li>
		<li>서버를 재시작 했을때 모든 회원정보 및 메모가 사라져도 상관없다</li>
		<li>페이지 개수에 제한은 없으며 모든 내용은 quiz 폴더 밑에 만들 것 (서블릿을 사용하고 싶다면 URL을
			quiz로 맞출 것)</li>
	</ul>
	
	<h3>Login</h3>

	<form action="/chap04/login" method="POST" id="loginForm" onsubmit="return login()">
 	   Id: <input id="userId" type="text" name="user-id"> <br />
 	   Password: <input id="userPassword" type="password" name="user-password">
 	   <button type="submit">로그인</button><br /><br />    
	</form>
	
	<button onclick="location.href='/chap04/joinMember';">회원가입</button>

	<script>
    function login() {
    	const userId = document.getElementById("userId").value;
    	const userPassword = document.getElementById("userPassword").value;
    	       
        return true;
    }
  
  
	</script>
</body>
</html>