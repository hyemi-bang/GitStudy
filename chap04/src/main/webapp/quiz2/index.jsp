<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���</title>
</head>
<body>

	<button onclick="location.href='/chap04/quiz2/loginForm.jsp';"> �α��� �Ϸ����� </button>
	<button onclick="location.href='/chap04/quiz2/registerForm.jsp';"> ȸ������ </button>

	<h3>#��� ��Ʈ����Ʈ ����</h3>

	<ul>
		<%
		// scope.getArrtibuteNames() : �ش� ������ ��� ��Ʈ����Ʈ �̸����� ���� �� �ִ� ��ü�� ��ȯ
		java.util.Enumeration<String> names = application.getAttributeNames();

		while (names.hasMoreElements()) {
			String name = names.nextElement();

			out.print(String.format("<li>%s=%s</li>", name, application.getAttribute(name)));
		}
		%>
	</ul>
	
	<script>
		
	<%
	
	if (request.getParameter("error") != null) {
		if (request.getParameter("dup") != null) {
		out.print("alert('�̹� ������� ���̵� �Դϴ�!')");
	} else {
		out.print("alert('')");
		}
	}

	%>
		
	</script>
</body>
</html>