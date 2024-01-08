<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>광고</title>
</head>
<body>
	<c:url value="/assets/images/beskinAD1.png" var="AdvertisementImg"/>
	
	<img src ="${AdvertisementImg}" alt="광고" width ="180" /> <br>
	
	<div> <!-- input type 으로 checkbox 만들기 -->
		<input id="hide_prom_chk" name="hide_prom" type="checkbox" /> 30초 동안 보이지 않음
	</div>
	
	<script>
		const hideProm = document.querySelector('#hide_prom_chk');
		
		hideProm.addEventListener('click', (e) => {
			//console.log(e);
			
			//체크박스는 checked라는 속성을 통해 체크 여부 판단 가능
			console.log(hideProm.checked);
			
			/* if(hideProm.checked === true){
				console.log('체크가 되었습니다');
			} else {
				console.log('체크가 해제되었습니다')
			} */
			
			if(hideProm.checked){
				console.log('체크가 되었습니다');
				// 체크되면 쿠키 보내는 페이지로 요청을 보내기 (서버측으로)
				// location.href ='hide.jsp';
				
				// 클라이언트(자바스크립트)측에서 쿠키 양식 만들어 사용하기
				document.cookie = "hideProm2=1; max-age=30; path=/chap09/quiz2;";
				window.close();
			}
		});
		
	</script>
	
</body>
</html>