<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,chap07_T.dto.EmployeeDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>employees list</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/dbtest/css/empList.css" />
</head>
<body>

	<h3>#All Employees</h3>

	<div class="emp-list">
	<%
		Object employees = request.getAttribute("employees");
	
	if(employees != null){
		for(EmployeeDTO emp : (List<EmployeeDTO>)employees){
			/* out.print(String.format("<div>%d</div>"
					+"<div>%s</div>"
					+"<div>%s</div>", emp.getEmployee_id(), emp.getFirst_name(), emp.getLast_name())); */
				out.print(emp.getDivRow());
		}
	} else {
		out.print("<div>No employess List</div>");
	}
	%>
	</div>
</body>
</html>