<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, chap08.dto.EmployeeDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      <label for="searchField">검색 필드:</label> 
      <select name="searchField" id="searchField">
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