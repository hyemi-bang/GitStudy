<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>userPage.jsp</title>
</head>
<body>
	<!-- �α����� ����� ������ �ش� ���̵�� �ۼ���(����ص�) �޸� �� �� �־�� �Ѵ� -->
	<!-- �߰� ��ư -> �޸��� ������ -> �޸� �Է� �� ���� ��ư ������ ����� -->
	<!-- ������ ����� ������ ��� ȸ������ �� �޸� ������� ������� -->

	<h2>
		Hello!
		<%=session.getAttribute("userId")%>!
	</h2>

	<form action="/chap04/quiz/saveMemo" method="POST" id="memoForm"
		onsubmit="return saveMemo()">
		<textarea id="memoInput" name="memo"></textarea>
		<button type="submit">����</button>
	</form>

	<button type="button" onclick="getSavedMemo()">�޸� �ҷ�����</button>

	<button onclick="location.href='/chap04/quiz/logout'">�α׾ƿ�</button>


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













