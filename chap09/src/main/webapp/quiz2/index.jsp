<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����</title>
</head>
<body>

	<h3>#Quiz</h3>

	<ul>
		<li>�� �������� ������ �� ����â�� �ϳ� �߰� �����</li>
		<li>����â���� ������ �̹��� �ϳ��� üũ�ڽ� ��ư�� �ֽ��ϴ�</li>
		<li>üũ�ڽ��� üũ�ϰ� â�� ������ 30�� ���� �� �������� �����ϴ��� ����â�� ���� �ʾƾ� �մϴ�.</li>
	</ul>

	<c:url value="/quiz2/promotion.jsp" var="pmURL"/>
	
	<!-- JSP ������������ EL�� ��Ű���� ���� ���� �� �� �ִ�  -->
<%-- 	<c:if test="${cookie.hideProm.value != '1'}"> --%>
	<c:if test="${cookie.hideProm2.value != '1'}">
		<script>
		//open('/chap09/quiz/adPopup.jsp','_blank','width=400,height=600,top=100,right=100');
		//���� �ÿ� ���� �� ��â�� �ν��Ͻ��� ��ȯ�Ѵ�
		const a = open('${pmURL}', '_blank', 'width=500,height=500');
		</script>
	</c:if>
</body>
</html>