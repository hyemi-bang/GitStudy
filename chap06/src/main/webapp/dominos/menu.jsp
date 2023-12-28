<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>domino menu</title>
</head>
<body>
	<h3>주문 페이지</h3>

	<!-- 메뉴 설명 & 선택 페이지
	여기서 이미지와, 각 메뉴 와 사이즈 금액을 보여주고 이용자가 사이즈를 선택하면 
	그 내용이 /chap06/dominos/menu로 넘어가야하는것
	
	라벨형식을 이용해서 이미지도 가져오고 사용자가 선택할 수 있게하려면  어떻게 해야할까?
	  -->
		
	<form action="/chap06/dominos" method="POST" onsubmit="return calculateTotal();">

	<!-- Menu 1 -->
	<img src="https://cdn.dominos.co.kr/admin/upload/goods/20231214_a0G7WsxF.jpg"alt="Snow Brisket BBQ" width="200">	
	<br>스노우 브리스킷 바비Q (<input type="checkbox" id="sizeL1"><label for="sizeL1"> L 35900원 /
	<input type="checkbox" id="sizeM1"><label for="sizeM1"> M 30000원) 수량 <input type="number" name="amount" min="1"><br>
	<!-- Menu 2 -->
	<img src="	https://cdn.dominos.co.kr/admin/upload/goods/20231214_B8cGMt1w.jpg"alt="Snow Black Tiger" width="200">	
	<br>스노우 블랙타이거 슈림프 (<input type="checkbox" id="sizeL2"><label for="sizeL2"> L 37900원 /
	<input type="checkbox" id="sizeM2"><label for="sizeM2"> M 31000원) 수량 <input type="number" name="amount" min="1"><br>
	<!-- Menu 3 -->
	<img src="https://cdn.dominos.co.kr/admin/upload/goods/20231214_Y3W7J63w.jpg"alt="Wild West Steak" width="200">	
	<br>스노우 와일드와일드 웨스트 스테이크 (<input type="checkbox" id="sizeL3"><label for="sizeL3">  L 34900원 /
	<input type="checkbox" id="sizeM3"><label for="sizeM3"> M 29000원) 수량 <input type="number" name="amount" min="1"><br>	
	<!-- Menu 4 -->
	<img src="https://cdn.dominos.co.kr/admin/upload/goods/20231215_965Hu68d.jpg"alt="Brisket BBQ" width="200">	
	<br>브리스킷바비Q (<input type="checkbox" id="sizeL4"><label for="sizeL4"> L 34900원 /
	<input type="checkbox" id="sizeM4"><label for="sizeM4"> M 29000원) 수량 <input type="number" name="amount" min="1"><br>	
	<!-- Menu 5 -->
	<img src="https://cdn.dominos.co.kr/admin/upload/goods/20230619_hybtjkBv.jpg"alt="Snow Brisket BBQ" width="200">	
	<br>아보카도 새우 (<input type="checkbox" id="sizeL5"><label for="sizeL5"> L 27900원 /
	<input type="checkbox" id="sizeM5"><label for="sizeM5"> M 20500원) 수량 <input type="number" name="amount" min="1"><br>	
	<!-- Menu 6 -->
	<img src="https://cdn.dominos.co.kr/admin/upload/goods/20200508_780B32i8.jpg"alt="Black Tiger" width="200">	
	<br>블랙타이거 슈림프 (<input type="checkbox" id="sizeL6"><label for="sizeL6"> L 36900원 /
	<input type="checkbox" id="sizeM6"><label for="sizeM6"> M 30000원) 수량 <input type="number" name="amount" min="1"><br>
	
	<br><button type="submit">선택완료</button>
	
	
	</form>
	<script>
	function calculateTotal() {
		// 체크박스 정보
	    let checkboxes = document.querySelectorAll('input[id^="size"]:checked');
	    let amount = document.querySelector('input[name="amount"]').value;
	
	    let totalPrice = 0;
	    checkboxes.forEach(function (checkbox) {
	        let priceString = checkbox.nextSibling.nodeValue.trim();
	        let price = parseInt(priceString.substring(priceString.indexOf('원') + 1));
	        totalPrice += price;
	    });
	    
	    totalPrice *= parseInt(amount) || 0; // 숫자로 변환, 실패 시 0으로 설정

	    console.log("TotalPrice: " + totalPrice);
	    location.href = "/chap06/dominosResult.jsp?totalPrice=" + totalPrice;
	    return false;
	}

		}
	</script>


</body>
</html>