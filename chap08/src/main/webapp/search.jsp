<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, chap08.dto.EmployeeDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      <label for="searchField">�˻� �ʵ�:</label> 
      <select name="searchField" id="searchField">
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

   <h3># Search Results</h3>

   <c:if test="${not empty searchResults }">
      <table border="1">
         <tr>
            <th>Employee ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Salary</th>
            <th>Commission Pct</th>
            <th>Hire Date</th>
            <th>Job ID</th>
            <th>Manager ID</th>
            <th>Department ID</th>
            <th>Department Name</th>
         </tr>
         <c:forEach var="employee" items="${searchResults}">
	    <tr>
	        <td>${employee.getEmployee_id()}</td>
	        <td>${employee.getFirst_name()}</td>
	        <td>${employee.getLast_name()}</td>
	        <td>${employee.getSalary()}</td>
	        <td>${employee.getCommission_pct()}</td>
	        <td>${employee.getHire_date()}</td>
	        <td>${employee.getJob_id()}</td>
	        <td>${employee.getManager_id()}</td>
	        <td>${employee.getDepartment_id()}</td>
	        <td>${employee.getDepartment_name()}</td>
	    </tr>
		</c:forEach>
	      </table>
	   </c:if>
	
	   <c:if test="${empty searchResults}">
	      <p>No Search Results</p>
	   </c:if>

</body>
</html>