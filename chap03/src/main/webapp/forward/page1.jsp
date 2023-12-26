<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>page1</title>
</head>
<body>
	<h3>Page1.jsp</h3>

	<p>
		<%= request.getParameter("firstName") %> <br>
		<% out.print(request.getParameter("lastName")); %>
		<!-- 위에 두개 같은 것 -->
	</p>
</body>
</html>