<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	//�̹� �α��ε� ���¶�� �޸����Ϸ� �ٷ� ������ ����
	if (session.getAttribute("info") != null) {
	response.sendRedirect("/chap04/quiz2/memo/main");
	return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ������</title>
</head>
<body>

	<h3>#�α���</h3>

	<!-- input form �� �߰��Ѵ�~ -->
	ID:<input name="id" type="text" form="form1"> <br> 
	PASSWORD:<input name="pwd" type="password" form="form1"><br>
	<button type="submit" form="form1">�α���</button>

	<!-- id, form �Ӽ��� Ȱ���Ͽ� form�±� �ۿ� �ִ� ��ҵ鵵 �ش� ���� �Ҽ����� ������ �� �ִ�.  -->
	<form id="form1" action="/chap04/quiz2/login" method="POST"></form>

</body>
</html>