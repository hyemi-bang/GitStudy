<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>coffeeBeans Remove</title>
</head>
<body>

<h3>#CoffeeBeans</h3>
<h3>#Remove CoffeeBeans</h3>

<form action="<%=request.getContextPath() %>/dbtest/remove" method="POST">
<br><label for="beanId">Bean Id:</label>
<input type="text" id="beanId" name="bean_id" required>
<br>
<input type="submit" value="RemoveCoffeeBean">		<br> 
</form>

	<script>
    function redirectToCoffeeTable() {
        window.location.href = "<%= request.getContextPath() %>/dbtest/coffeeTable";
    }
	</script>
	
	<button onclick="redirectToCoffeeTable()">Move to Coffee Bean Table</button>



</body>
</html>