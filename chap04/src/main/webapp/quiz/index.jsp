<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>loginQuiz.jsp</title>
</head>
<body>

	<h3># �䱸����</h3>

	<ul>
		<li>���̵�� ��й�ȣ�� �Է��ϰ� �α��� ��ư�� ���� �α��� �� �� �ִ�</li>
		<li>ȸ�������� ���̵�� ��й�ȣ�� �Է��ϸ� �Ϸ�ȴ� (���̵� �ߺ��� üũ�ؾ��ϰ�, ���Ե� ������
			application Attribute������ ����Ѵ�)</li>
		<li>�α��ο� ������ ����� ������ �����Ǵ� ���� �α����� ��� �����Ǿ���Ѵ�</li>
		<li>�α����� ����� ���ο� �޸� ����� �� �ְ�, ������ �ۼ���(����ص�) �޸� �� �� �־�� �Ѵ�</li>
		<li>������ ����� ������ ��� ȸ������ �� �޸� ������� �������</li>
		<li>������ ������ ������ ������ ��� ������ quiz ���� �ؿ� ���� �� (������ ����ϰ� �ʹٸ� URL��
			quiz�� ���� ��)</li>
	</ul>
	
	<h3>Login</h3>

	<form action="/chap04/login" method="POST" id="loginForm" onsubmit="return login()">
 	   Id: <input id="userId" type="text" name="user-id"> <br />
 	   Password: <input id="userPassword" type="password" name="user-password">
 	   <button type="submit">�α���</button><br /><br />    
	</form>
	
	<button onclick="location.href='/chap04/joinMember';">ȸ������</button>

	<script>
    function login() {
    	const userId = document.getElementById("userId").value;
    	const userPassword = document.getElementById("userPassword").value;
    	       
        return true;
    }
  
  
	</script>
</body>
</html>