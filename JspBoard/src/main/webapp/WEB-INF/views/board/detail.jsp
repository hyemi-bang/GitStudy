<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>detail</title>
</head>
<body>
	<h2>detail</h2>
	<a href="./list">�ڷΰ���</a>
	<br />
	<hr />
		 <!-- <h3>��ȸ �ߵ�</h3>
		  ${detail} -->
	�� ���� : <input type="text" value="${detail.board_title}" readonly />
	<br /> 
	�۾���� : <input type="text" value="${detail.board_writer}" readonly /> 
	��ȸ�� : ${detail.view_count} �ۼ��� : ${detail.write_date}
	<br />
	<textarea rows="10" cols="30" readonly>${detail.board_content}</textarea>

</body>
</html>