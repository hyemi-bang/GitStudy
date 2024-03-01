<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="chap08.dao.EmployeeDAO2" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String searchQuery = request.getParameter("searchQuery");
	String searchType = request.getParameter("searchType");
	
	/* �Ķ���� �̻������ üũ�ϰ�, ��üũ�� �ϰ� */
	System.out.println(searchQuery);
	System.out.println(searchType);
	
	/* �Ķ���͸� ������� DB���� �����͸� �����´�  */
	EmployeeDAO2 dao = new EmployeeDAO2();
	
	//dao.search(searchType,searchQuery);
	request.setAttribute("emps", dao.search(searchType,searchQuery));
	
%>
<!-- forward()  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h3>#SearchResult</h3>
	
	
	<c:forEach items="${emps}" var="emp">
   		<div>${emp }</div>
	</c:forEach>


</body>
</html>