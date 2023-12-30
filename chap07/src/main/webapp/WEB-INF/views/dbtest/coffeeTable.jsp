<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,chap07.dto.CoffeeBeansDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>coffeeBeans Table</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/dbtest/css/coffeeBeans.css"/>
</head>
<body>

	<h3>#All CoffeeBeans</h3>
	
	<div id="beans-list">
	<%
		List<CoffeeBeansDTO> coffeebeans = (List<CoffeeBeansDTO>)request.getAttribute("coffeebeans");
	
		if(coffeebeans != null && !coffeebeans.isEmpty()){
			for(CoffeeBeansDTO bean : coffeebeans){
	%>	
				<div class="coffee-beans">
	  				<div id="beansId">Beans ID: <%= bean.getBean_id() %></div>
                    <div>Bean Name: <%= bean.getBean_name() %></div>
                    <div>Country ID: <%= bean.getCountry_id() %></div>
                    <div>Coffee Taste: <%= bean.getCoffee_taste() %></div>
                 </div>
	<%		
			}
		} else {
	%>		
		<p>No CoffeeBeans List</p>
	<%
		}
	%>
	</div>

</body>
</html>