<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Add New Bread Page!</title>
</head>
<body>
	<h3>#�� �߰��ϱ�</h3>
		<form action="./add" method="POST">
			�̸�: <input name="bread_name" type="text"><br> 
			<!-- �̸� �ߺ� üũ�� �ϰ� ���� �� 
			1> ������ ��û�� ������ �˻��Ѵ� �ߺ��̸� �����̷�Ʈ
			2> �������� BreadAddForm���� �Ѿ�ö� �̹� ��� ������ �̸��� ������ ���� ���
			3> ���߿� ���� �Ͻ� ����
			-->
			����: <input name="bread_price" type="number" min="0" step="100"><br>
			<input type="submit" value="�߰��ϱ�">
		</form>

</body>
</html>