<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSTL(Core Tag Library)을 사용하기 위한 선언
  JSTL은 JSP 페이지에서 자주 사용되는 표준 태그 라이브러리로, 페이지의 흐름 제어, 반복, 조건문 등을 보다 쉽게 다룰 수 있도록 한다 
  prefix="c"는 JSTL 태그에 사용할 접두어를 지정. 여기서 "c"는 "core"
  uri="http://java.sun.com/jsp/jstl/core"는 사용할 태그 라이브러리의 위치--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 웹 사이트</title>
</head>
<body>

	<h1>board list</h1>


	<table border="2">
		<tr>
			<th>No.</th>
			<th>Title</th>
			<th>Writer</th>
			<th>Timestamp</th>
			<th>View</th>
		</tr>

		<c:forEach items="${boards}" var="board">
			<tr>
				<td>${board.board_id}</td>
				<td><a href="./detail?board_id=${board.board_id}">${board.board_title}</a></td>
				<td>${board.board_writer}</td>
					<%-- ${} 표현 언어(Expression Language, EL)
					JSP 페이지에 직접 표현을 삽입할 수 있는 기능
					board는 참조하려는 객체나 변수입니다.
					board_writer는 board 객체의 속성 또는 속성으로 검색하려는 속성 
					EL 표현식은 JSP에서 JavaBeans, 요청(request), 세션(session),
					또는 애플리케이션(application) 스코프에서 데이터에 접근하고 표시하는 데 자주 사용
					동적 콘텐츠를 웹 페이지에 효과적--%>
				<td>${board.write_date}</td>
				<td>${board.view_count}</td>
			</tr>
		</c:forEach>
	</table>

	<button id="writeBtn">글쓰기</button>

	<c:url value="/resources/board/js/inde.js" var="indexJS"></c:url>
	<c:url value="./write" var="writePageURL"></c:url>

	
	<script>
		const writePageURL = '${writePageURL}';
	</script>
	
	<script src="${indexJS}"></script>
	

</body>
</html>