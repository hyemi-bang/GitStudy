<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메모 메인</title>
</head>
<body>

	<h1>Memo Main</h1>
	<!-- 메모는 사용자의 아이디에 따라 달라지는 값이어야한다. -->
	<!-- 사용자가 웹브라우저를 껏다 켰을대 남아있어야한다. 세션에 저장해두면 사라지게 됨으로 데이터베이스에 저장되어야하지만 
		현재는 어플리케이션 영역만을 사용할 줄 알기때문에 거기에 저장할예정이다.
		서버컴퓨터에 파일을 내보냈다가 다시 읽어오는 방법도 있다 -->
	<!--  메모 추가영역 / 다양한 메모들이 들어가있는 영역이 있으면 될 것 같다 -->
	<form action="/chap04/quiz2/logout" method="POST">
	<button>로그아웃</button>
	</form>
	
	<div>
		<%
		java.util.Map<String, Object> infoMap = (java.util.Map) session.getAttribute("info");

		java.util.List<String> memoList = (java.util.List) infoMap.get("memoList");

		if (memoList == null) {
			out.print("<div>메모가 아직 없습니다.</div>");
		} else {
			for (String memo : memoList) {
				out.print(String.format("<div class=\'memo\'>%s</div>", memo));
			}
		}
		%>
	</div>

	<form action="./add" method="POST">
		<!-- ./add -> MemoServlet으로 가는 것이다~ -->
		<input name="memo" type="text">
		<button>추가</button>
	</form>
</body>
</html>