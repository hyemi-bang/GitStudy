<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="./taglibs.jspf" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>File include</title>
</head>
<body>
	<h1>Index</h1>
	<h3>#file include</h3>
	
	<p>파일로 include하는 경우 해당 파일의 내용을 현재 .jsp파일로 통째로 가져와 사용한다</p>
	<p>포함하려는 파일은 컴파일 되지 않기 때문에 jsp컴파일 형식을 지키지 않아도 된다. 
	<br>(taglib prefix를 다른 파일에서 해도 여기서 안했지만 가능하다는 것)</p>
	<p>file include로 가져오는 용도의 파일은 컴파일 되지 않는다고 표시하기 위해<br>
	 .jspf(jsp fragment) 확장자로 표현하기도 한다</p>
	
	<h3>for</h3>
	<ul><c:forEach begin="0" end="9">
		<li id="item${i}">list-items${i}</li>
	</c:forEach>
	</ul>
	
	<div id ="gugudan">
	<%@ include file="./gugudan.jspf" %>
	</div>
</body>
</html>