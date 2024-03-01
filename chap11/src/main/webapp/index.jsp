<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>File Include</title>
</head>
<body>

	<h3> #include 기능을 사용해 뷰 파일 분할하기 </h3>
	
	<ol>
		<li>JSP include :<br> 포워드처럼 request, response를 다른 jsp로
		 그대로 전달하여 처리를 진행한 후 처리결과를 가지고 다시 돌아오는 기능<br>
		 다른 페이지로 잠깐 갔다 다시 돌아오는 기능이기에 include하는 페이지에서 pageScope 값 사용할 수 없다
		 </li>
		<li>File include :<br> 해당 파일을 컴파일 하기 전에 현재 페이지에 포함해버리는 방식<br>
		다른 파일과 하나로 합쳐진 후 컴파일이 되어 pageScope가 유효하다
		</li>
	</ol>
	
	<a href="./include1/index.jsp">JSP include</a>
	<a href="./include2/index.jsp">File include</a>
</body>
</html>