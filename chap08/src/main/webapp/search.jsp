<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, chap08.dto.EmployeeDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사원 검색 serch.jsp</title>
</head>
<body>

	<h3># Search</h3>

	<ul>
		<li>검색을 통해 사원들을 조회할 수 있는 페이지를 만들어보세요</li>
		<li>검색할 수 있는 컬럼 : first_name, last_name, department_name</li>
		<li>검색어를 직접 입력하고 검색 버튼을 누르면 사원들이 조회되도록 만들기</li>
	</ul>

	 <form action="${pageContext.request.contextPath}/search" method="POST">
		<select name="searchField" id="form-control">
			<option value="0">선택</option>
			<option value="first_name">first_name</option>
			<option value="last_name">last_name</option>
			<option value="department_name">department_name</option>
		</select> <input type="text" name="searchQuery">
		<input type="submit" value="검색">
	</form>

	<%
	if("0".equals(request.getParameter("searchField"))){
	%>
	    <p>검색할 필드를 선택하세요</p>
	<%
	}
	%>
	
	
</body>
</html>