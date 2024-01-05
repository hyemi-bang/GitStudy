<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>퀴즈</title>
</head>
<body>

	<h3>#Quiz</h3>

	<ul>
		<li>이 페이지에 접속할 때 광고창이 하나 뜨게 만들기</li>
		<li>광고창에는 적당한 이미지 하나와 체크박스 버튼이 있습니다</li>
		<li>체크박스를 체크하고 창을 닫으면 30초 동안 이 페이지에 접속하더라도 광고창이 뜨지 않아야 합니다.</li>
	</ul>

	<c:url value="/quiz2/promotion.jsp" var="pmURL"/>
	
	<!-- JSP 페이지에서는 EL로 쿠키값을 쉽게 꺼내 쓸 수 있다  -->
<%-- 	<c:if test="${cookie.hideProm.value != '1'}"> --%>
	<c:if test="${cookie.hideProm2.value != '1'}">
		<script>
		//open('/chap09/quiz/adPopup.jsp','_blank','width=400,height=600,top=100,right=100');
		//오픈 시에 내가 연 새창의 인스턴스를 반환한다
		const a = open('${pmURL}', '_blank', 'width=500,height=500');
		</script>
	</c:if>
</body>
</html>