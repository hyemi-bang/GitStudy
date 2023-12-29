<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,chap07.dto.CoffeeBeansDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>coffeeBeans Table</title>
</head>
<body>

	<h3>#All CoffeeBeans</h3>
	
	<div id="beans-list">
	<%
		List<CoffeeBeansDTO> coffeebeans = (List<CoffeeBeansDTO>)request.getAttribute("coffeebeans");
	
		if(coffeebeans != null && !coffeebeans.isEmpty()){
			for(CoffeeBeansDTO bean : coffeebeans){
	%>	
	  				<div>Beans ID: <%= bean.getBeans_id() %></div>
                    <div>Bean Name: <%= bean.getBean_name() %></div>
                    <div>Country ID: <%= bean.getCountry_id() %></div>
                    <div>Coffee Taste: <%= bean.getCoffee_taste() %></div>
	<%		
			}
		} else {
	%>		
		<p>No CoffeeBeans List</p>
	<%
		}
	%>
	</div>
	
	<h3>#Add NEW CoffeeBeans</h3>

</body>
</html>