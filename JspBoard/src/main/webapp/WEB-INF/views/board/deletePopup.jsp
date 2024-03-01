<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>재확인</title>
</head>
<body>
<%-- 	 <form action="./delete" method="POST">
        비밀번호 입력 : <input id="inputPassword" type="password" name="board_password">
        <input type="submit">
    </form>
	
	 <script src="${sha256}"></script>
	 <c:url value="/resources/board/js/del.js" var="delJS"/>
	<script src="${delJS}"></script> --%>
	
	<h3> 삭제하려는 글의 비밀번호 입력</h3>
	
	<h5 id="out"></h5>
	<h5 id="out2"></h5>
		
	<input id="inputPassword" type="password" name ="board_password"/>
	<button id="confirmBtn">확인</button>
	
	<script src="<%= request.getContextPath()%>/resources/board/js/sha256.js"></script>
	<script>
		const out = document.getElementById('out');
		const out2 = document.getElementById('out2');
		const delForm = opener.document.getElementById('delForm');
		const confirmBtn = document.getElementById('confirmBtn');
		const inputPassword = document.getElementById('inputPassword');
		const hiddenPassword = opener.document.getElementById('hiddenPassword');
			
		out.innerText = '삭제하려는 글의 번호: ' + delForm.elements.board_id.value;
		out2.innerText += '삭제하려는 비밀번호 해쉬값: ' + delForm.elements.check_password.value;
		
		const getHashedPassword = password => sha256(password).toUpperCase();
		confirmBtn.addEventListener('click', (e) => {
			
			const hashedPassword = getHashedPassword(inputPassword.value);
			if(hashedPassword === delForm.elements.check_password.value){
				//alert('비밀번호가 같습니다');
				hiddenPassword.value = hashedPassword;
				delForm.submit();
				window.close();
			} else{
				alert('비밀번호 틀렸습니다');
			}
			
		});
	</script>
</body>
</html>