<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,chap07.dto.CoffeeBeansDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Coffee Add Table</title>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/resources/dbtest/css/coffeeBeans.css" />

</head>
<body>

	<h3>#CoffeeBeans</h3>

	<div id="variety">
		<h4>Country ID 종류:</h4>

		<p id="country-codes">
			Argentina - AR | Australia - AU | Belgium - BE<br> Brazil - BR |
			Canada - CA | Switzerland - CH<br> China - CN | Germany - DE |
			Denmark - DK<br> Egypt - EG | France - FR | Israel - IL | Italy
			- IT<br> Japan - JP | Kuwait - KW | Malaysia - ML<br>
			Mexico - MX | Nigeria - NG | Netherlands - NL<br> Singapore - SG
			| United Kingdom - UK | United States of America - US<br> Zambia
			- ZM | Zimbabwe - ZW | Republic of Korea - KR<br> Nicaragua - NC
			| Colombia - CB | Costa Rica - CR<br> Kenya - KN | Bolivia - BL
			| El Salvador - ES<br> Indonesia - ID | Ethiopia - ET | Uganda -
			UG<br> Papua New Guinea - PN
		</p>
	</div>

	<div id="variety">
		<h4>Coffee Taste 종류:</h4>
		<p id="taste">
			고소 : NUTTY <br>산미 : ACIDITY<br>묵직 : HEAVY
		</p>
	</div>

	<h3>#Add NEW CoffeeBeans</h3>
	<form action="<%= request.getContextPath() %>/dbtest/add" method="POST">
		<br>
		<label for="beanName">Bean Name:</label>
		<input type="text" id="beanName" name="beanName" required><br>
		<!-- required: 양식 제출할때 입력 반드시 하게 하는 값 -->
		<label for="countryId">Country ID:</label>
		<input type="text" id="countryId" name="countryId" required><br> 
		<labelfor="coffeeTaste">coffee Taste:</label> 
		<input type="text"id="coffeeTaste" name="coffeeTaste" required><br>
		<br> 
		<input type="submit" value="AddCoffeeBean">
	</form>

	<h3>#Added CoffeeBeans</h3>

	<ul>
		<%
	Object addBeans = session.getAttribute("addBeans");

		if(addBeans == null || !(addBeans instanceof List)){
			out.print("<li>추가된 내용이 없습니다</li>");
		} else {
			for(CoffeeBeansDTO add : (List<CoffeeBeansDTO>)addBeans){
	%>
		<li>
			<p> Bean Id : <%=add.getBean_id() %></p>
			<p> Bean Name: <%= add.getBean_name() %></p>
			<p> Country ID: <%= add.getCountry_id()%></p>
			<p> Coffee Taste: <%= add.getCoffee_taste() %></p>
		</li>
		<%
			}
		}
	%>
	</ul>
	

</body>
</html>