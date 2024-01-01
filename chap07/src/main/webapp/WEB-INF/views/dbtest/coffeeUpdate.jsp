<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,chap07.dto.CoffeeBeansDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>coffeeBeans Edit</title>
</head>
<body>

	<h3>#Update CoffeeBeans</h3>
	<form action="<%= request.getContextPath() %>/dbtest/update" method="POST">
		<br>
		<label for="beanId">The standard bean Id:</label>
		<input type="text" id="beanId" name="beanId" required><br>
		<label for="beanName">Bean Name To Change:</label>
		<input type="text" id="beanName" name="beanName" required><br>
		<label for="countryId">Country ID To Change:</label>
		<input type="text" id="countryId" name="countryId" required><br> 
		<label for="coffeeTaste">coffee Taste To Change:</label> 
		<input type="text"id="coffeeTaste" name="coffeeTaste" required><br>
		<br> 
		<input type="submit" value="UpdateCoffeeBean">
	</form>
	

</body>
</html>