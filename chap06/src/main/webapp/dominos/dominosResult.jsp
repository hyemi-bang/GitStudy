<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̳� �ֹ� ���</title>
</head>
<body>

	<h3>�ֹ� ���</h3>

	<p>�ֹ� ����:</p>

	<ul>
		<%
		// ���� �� ��Ʈ����Ʈ�� �����´�
		List<String> userChoices = (List<String>) request.getAttribute("userChoice");

		// �ֹ����� ���
		for (String choice : userChoices) {
			out.print("<li>" + choice + "</li>");
		}
		%>
	</ul>
	<p><%=// �Ѱ��� ���
		// int totalPrice = menuPrice * amount;			 
		request.getAttribute("totalPrice")%></p>
	<p>�ֹ��� �Ϸ�Ǿ����ϴ�. �����մϴ�!</p>

</body>
</html>