<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>요청경로 설정하기</title>
</head>
<body>

	<h3># webapp 밑의 자원에 직접 요청보내기</h3>

	<ul>
		<li>/프로젝트이름/폴더명/파일명 (경로대로 요청을 보내면 자원을 받아올 수 있다)</li>
		<li>프로젝트 이름에 해당하는 부분은 ContextPath라고 부른다</li>
		<li>ContextPath는 기본적으로 프로젝트 이름으로 설정되어 있지만 수정도 가능하다</li>
	</ul>
	
	<h3># servlet으로 요청 보내기</h3>
	
	<ul>
		<li>해당 서블릿에 @WebServlet()으로 부여된 URL을 통해 요청</li>
		<li>*를 사용하여 여러 경로를 하나의 서블릿으로 처리하는 것도 가능하다</li>
	</ul>
	
	<h3># forward 경로 설정하기</h3>

	<ul>
		<li>다음으로 처리를 맡은 .jsp로 이어지는 경로를 제공해야 한다</li>
		<li>webapp밑의 실제 파일 위치 경로를 전달해야한다</li>
	</ul>
	
	<h3># Redirect 경로 설정하기</h3>
	
	<ul>
		<li>클라이언트가 다시 요청을 보내야하는 경로를 제공한다</li>
		<li>ContextPath가 포함된 경로를 사용해야한다.</li>
	</ul>
	
	<ul>
		<li>&lt;img src="/프로젝트이름/폴더명/이미지파일명.jpg" alt="이미지 설명"&gt;</li>
		<li>&lt;script src="상대경로/스크립트파일.js"&gt;&lt;/script&gt;</li>
		<li>&lt;a href="/프로젝트이름/폴더명/파일명"&gt;링크 텍스트&lt;/a&gt;</li>
		<li>&lt;a href="http://192.168.0.66:9000/chap05/path/pen2.jpg" width="200"&gt;&lt;/a&gt;</li>
		<li>&lt;a href="상대경로/파일명"&gt;링크 텍스트&lt;/a&gt;</li>
		<li>상대경로를 쓰는 경우 내가 이곳에 접속하는데 사용했던 URL의 상대경로로 요청을 보낸다</li>
	</ul>
	<a href="./test1.html">test.html</a>
			<img href="http://192.168.0.66:9000/chap05/path/pen2.jpg" width="200"/> 
</body>
</html>