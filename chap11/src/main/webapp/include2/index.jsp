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
	
	<p>���Ϸ� include�ϴ� ��� �ش� ������ ������ ���� .jsp���Ϸ� ��°�� ������ ����Ѵ�</p>
	<p>�����Ϸ��� ������ ������ ���� �ʱ� ������ jsp������ ������ ��Ű�� �ʾƵ� �ȴ�. 
	<br>(taglib prefix�� �ٸ� ���Ͽ��� �ص� ���⼭ �������� �����ϴٴ� ��)</p>
	<p>file include�� �������� �뵵�� ������ ������ ���� �ʴ´ٰ� ǥ���ϱ� ����<br>
	 .jspf(jsp fragment) Ȯ���ڷ� ǥ���ϱ⵵ �Ѵ�</p>
	
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