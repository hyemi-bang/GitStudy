<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, chap08.dto.EmployeeDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��� �˻� serch.jsp</title>
</head>
<body>

	<h3># Search</h3>

	<ul>
		<li>�˻��� ���� ������� ��ȸ�� �� �ִ� �������� ��������</li>
		<li>�˻��� �� �ִ� �÷� : first_name, last_name, department_name</li>
		<li>�˻�� ���� �Է��ϰ� �˻� ��ư�� ������ ������� ��ȸ�ǵ��� �����</li>
	</ul>

	 <form action="${pageContext.request.contextPath}/search" method="POST">
		<select name="searchField" id="form-control">
			<option value="0">����</option>
			<option value="first_name">first_name</option>
			<option value="last_name">last_name</option>
			<option value="department_name">department_name</option>
		</select> <input type="text" name="searchQuery">
		<input type="submit" value="�˻�">
	</form>

	<%
	if("0".equals(request.getParameter("searchField"))){
	%>
	    <p>�˻��� �ʵ带 �����ϼ���</p>
	<%
	}
	%>
	
	
</body>
</html>