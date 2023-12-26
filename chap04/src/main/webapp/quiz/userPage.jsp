<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>userPage.jsp</title>
</head>
<body>
	<!-- 로그인한 사람은 이전에 해당 아이디로 작성한(등록해둔) 메모를 볼 수 있어야 한다 -->
	<!-- 추가 버튼 -> 메모장 열리고 -> 메모 입력 후 저장 버튼 누르면 저장됨 -->
	<!-- 서버를 재시작 했을때 모든 회원정보 및 메모가 사라져도 상관없다 -->

	<h2>
		Hello!
		<%=session.getAttribute("userId")%>!
	</h2>

	<form action="/chap04/quiz/saveMemo" method="POST" id="memoForm"
		onsubmit="return saveMemo()">
		<textarea id="memoInput" name="memo"></textarea>
		<button type="submit">저장</button>
	</form>

	<button type="button" onclick="getSavedMemo()">메모 불러오기</button>

	<button onclick="location.href='/chap04/quiz/logout'">로그아웃</button>


    <p id="savedMemoText"></p>
  <script>
        function saveMemo() {
            return true;
        }

        function getSavedMemo() {
            document.getElementById("memoForm").submit();
        }
    </script>
</body>
</html>













