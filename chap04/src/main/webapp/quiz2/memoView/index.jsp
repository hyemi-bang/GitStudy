<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�޸� ����</title>
</head>
<body>

	<h1>Memo Main</h1>
	<!-- �޸�� ������� ���̵� ���� �޶����� ���̾���Ѵ�. -->
	<!-- ����ڰ� ���������� ���� ������ �����־���Ѵ�. ���ǿ� �����صθ� ������� ������ �����ͺ��̽��� ����Ǿ�������� 
		����� ���ø����̼� �������� ����� �� �˱⶧���� �ű⿡ �����ҿ����̴�.
		������ǻ�Ϳ� ������ �����´ٰ� �ٽ� �о���� ����� �ִ� -->
	<!--  �޸� �߰����� / �پ��� �޸���� ���ִ� ������ ������ �� �� ���� -->
	<form action="/chap04/quiz2/logout" method="POST">
	<button>�α׾ƿ�</button>
	</form>
	
	<div>
		<%
		java.util.Map<String, Object> infoMap = (java.util.Map) session.getAttribute("info");

		java.util.List<String> memoList = (java.util.List) infoMap.get("memoList");

		if (memoList == null) {
			out.print("<div>�޸� ���� �����ϴ�.</div>");
		} else {
			for (String memo : memoList) {
				out.print(String.format("<div class=\'memo\'>%s</div>", memo));
			}
		}
		%>
	</div>

	<form action="./add" method="POST">
		<!-- ./add -> MemoServlet���� ���� ���̴�~ -->
		<input name="memo" type="text">
		<button>�߰�</button>
	</form>
</body>
</html>