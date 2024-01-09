<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��Ȯ��</title>
</head>
<body>
<%-- 	 <form action="./delete" method="POST">
        ��й�ȣ �Է� : <input id="inputPassword" type="password" name="board_password">
        <input type="submit">
    </form>
	
	 <script src="${sha256}"></script>
	 <c:url value="/resources/board/js/del.js" var="delJS"/>
	<script src="${delJS}"></script> --%>
	
	<h3> �����Ϸ��� ���� ��й�ȣ �Է�</h3>
	
	<h5 id="out"></h5>
	<h5 id="out2"></h5>
		
	<input id="inputPassword" type="password" name ="board_password"/>
	<button id="confirmBtn">Ȯ��</button>
	
	<script src="<%= request.getContextPath()%>/resources/board/js/sha256.js"></script>
	<script>
		const out = document.getElementById('out');
		const out2 = document.getElementById('out2');
		const delForm = opener.document.getElementById('delForm');
		const confirmBtn = document.getElementById('confirmBtn');
		const inputPassword = document.getElementById('inputPassword');
		const hiddenPassword = opener.document.getElementById('hiddenPassword');
			
		out.innerText = '�����Ϸ��� ���� ��ȣ: ' + delForm.elements.board_id.value;
		out2.innerText += '�����Ϸ��� ��й�ȣ �ؽ���: ' + delForm.elements.check_password.value;
		
		const getHashedPassword = password => sha256(password).toUpperCase();
		confirmBtn.addEventListener('click', (e) => {
			
			const hashedPassword = getHashedPassword(inputPassword.value);
			if(hashedPassword === delForm.elements.check_password.value){
				//alert('��й�ȣ�� �����ϴ�');
				hiddenPassword.value = hashedPassword;
				delForm.submit();
				window.close();
			} else{
				alert('��й�ȣ Ʋ�Ƚ��ϴ�');
			}
			
		});
	</script>
</body>
</html>