<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h3>글 수정하기</h3>
	<%-- ${oldData} --%>
	
	글 제목 : <input type="text" name="board_title" value="${oldData.board_title}" form="modiForm" />
	<br /> 
	글쓴사람 : ${oldData.board_writer} <br /> 
	조회수 : ${oldData.view_count} 작성일 : ${oldData.write_date}
	<br />
	<textarea rows="10" cols="30" name="board_content" form="modiForm">${oldData.board_content}</textarea>
	
	<button id="modiConfirmBtn">수정</button>
	<button id="listBtn">목록</button>
	
	<!-- POST방식은 ?id=10 방식으로 파라미터 보낼 수 없어서 hidden type input을 사용해야한다 -->
	<form id="modiForm" action="./modify" method="POST"></form>
	<input type="hidden" name ="board_id" value="${oldData.board_id}" form="modiForm"/> <!-- hidden타입이라 보이지는 않는다 -->
	
	
	<c:url value="/resources/board/js/modi.js" var="modiJS"/>
	<script src="${modiJS}"></script>
</body>
</html>