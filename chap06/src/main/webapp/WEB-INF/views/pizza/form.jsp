<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,chap06.model.PizzaOrder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Pizza form</title>
</head>
<body>

	<div>
		<div>
			<span>����1</span> <br>
			M 30,000��<input type="radio" name="price1">
			L 35,900��<input type="radio" name="price1"><br>
			<input type="number" name="qty1" ><br>
			<button>�߰��ϱ�</button>

		</div>
		<div>
			<span>����2</span> <br>
			M 31,000��<input type="radio" name="size2" form="form2" value="mideum">
			<!-- radio�� value ���� �־���ϰ�, �ش� ���� �������� -->
			L 37,900��<input type="radio" name="size2" form="form2" value="large"><br>
			<input type="number" name="qty2" form="form2"><br>
			<button type="submit" form="form2">�߰��ϱ�</button>
			<form action="<%=request.getContextPath() %>/pizza/cart/add"
				method="POST" id="form2"></form>
		</div>
		<div>
			<span>����3</span> <br>
			M 29,000��<input type="radio" name="price3">
			L 34,900��<input type="radio" name="price3"><br>
			<input type="number" name="qty3"><br>
			<button>�߰��ϱ�</button>
		</div>
		<div>
			<span>����4</span> <br>
			M 29,000��<input type="radio" name="price4">
			L 34,900��<input type="radio" name="price4"><br>
			<input type="number" name="qty4"><br>
			<button>�߰��ϱ�</button>
		</div>
	</div>
	
	<h4>���� ��ٱ��� ���</h4>
	<ul>
	<%
		Object cart = session.getAttribute("cart");
	
		if(cart == null){
			out.print("<li>��ٱ��ϰ� ����ֽ��ϴ�</li>");
		}else {
			for(PizzaOrder order: (List<PizzaOrder>) cart){
				out.print(order);
			}
		}
	%>
	</ul>

</body>
</html>