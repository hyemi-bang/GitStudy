<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%

	//���������� ��Ű �߰��ϱ�
	Cookie cookie = new Cookie("hideProm", "1");
	cookie.setMaxAge(30);
	cookie.setHttpOnly(true); // HttpOnly ���Ȼ��� ������ �ڹٽ�ũ��Ʈ���� ����� �� ���� �Ѵ�
	response.addCookie(cookie);
%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<script>
		window.close();
	</script>


</body>
</html>