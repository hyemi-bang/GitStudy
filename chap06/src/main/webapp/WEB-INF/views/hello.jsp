<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.Set" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>hello�� view page</title>
</head>
<body>

	<h3># �� �������� WEB-INF �ؿ� ������ ��θ� ���� ���� ���������� �Ұ���������</h3>
	<p>������ �����带 ���ؼ��� ������ �� �ִ�</p>
	<%
	for (String emp : (Set<String>) request.getAttribute("result")) {
		out.print(String.format("<div>%s</div>", emp));
	}
	%>
</body>
</html>