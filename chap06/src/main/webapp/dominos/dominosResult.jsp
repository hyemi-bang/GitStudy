<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>도미노 주문 결과</title>
</head>
<body>

	<h3>주문 결과</h3>

	<p>주문 내역:</p>

	<ul>
		<%
		// 서블릿 상 어트리뷰트를 가져온다
		List<String> userChoices = (List<String>) request.getAttribute("userChoice");

		// 주문내역 출력
		for (String choice : userChoices) {
			out.print("<li>" + choice + "</li>");
		}
		%>
	</ul>
	<p><%=// 총가격 출력
		// int totalPrice = menuPrice * amount;			 
		request.getAttribute("totalPrice")%></p>
	<p>주문이 완료되었습니다. 감사합니다!</p>

</body>
</html>