<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����</title>
</head>
<body>
	<c:url value="/assets/images/beskinAD1.png" var="AdvertisementImg"/>
	
	<img src ="${AdvertisementImg}" alt="����" width ="180" /> <br>
	
	<div> <!-- input type ���� checkbox ����� -->
		<input id="hide_prom_chk" name="hide_prom" type="checkbox" /> 30�� ���� ������ ����
	</div>
	
	<script>
		const hideProm = document.querySelector('#hide_prom_chk');
		
		hideProm.addEventListener('click', (e) => {
			//console.log(e);
			
			//üũ�ڽ��� checked��� �Ӽ��� ���� üũ ���� �Ǵ� ����
			console.log(hideProm.checked);
			
			/* if(hideProm.checked === true){
				console.log('üũ�� �Ǿ����ϴ�');
			} else {
				console.log('üũ�� �����Ǿ����ϴ�')
			} */
			
			if(hideProm.checked){
				console.log('üũ�� �Ǿ����ϴ�');
				// üũ�Ǹ� ��Ű ������ �������� ��û�� ������ (����������)
				// location.href ='hide.jsp';
				
				// Ŭ���̾�Ʈ(�ڹٽ�ũ��Ʈ)������ ��Ű ��� ����� ����ϱ�
				document.cookie = "hideProm2=1; max-age=30; path=/chap09/quiz2;";
				window.close();
			}
		});
		
	</script>
	
</body>
</html>