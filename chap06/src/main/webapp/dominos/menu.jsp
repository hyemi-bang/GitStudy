<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>domino menu</title>
</head>
<body>
	<h3>�ֹ� ������</h3>

	<!-- �޴� ���� & ���� ������
	���⼭ �̹�����, �� �޴� �� ������ �ݾ��� �����ְ� �̿��ڰ� ����� �����ϸ� 
	�� ������ /chap06/dominos/menu�� �Ѿ���ϴ°�
	
	�������� �̿��ؼ� �̹����� �������� ����ڰ� ������ �� �ְ��Ϸ���  ��� �ؾ��ұ�?
	  -->
		
	<form action="/chap06/dominos" method="POST" onsubmit="return calculateTotal();">

	<!-- Menu 1 -->
	<img src="https://cdn.dominos.co.kr/admin/upload/goods/20231214_a0G7WsxF.jpg"alt="Snow Brisket BBQ" width="200">	
	<br>����� �긮��Ŷ �ٺ�Q (<input type="checkbox" id="sizeL1"><label for="sizeL1"> L 35900�� /
	<input type="checkbox" id="sizeM1"><label for="sizeM1"> M 30000��) ���� <input type="number" name="amount" min="1"><br>
	<!-- Menu 2 -->
	<img src="	https://cdn.dominos.co.kr/admin/upload/goods/20231214_B8cGMt1w.jpg"alt="Snow Black Tiger" width="200">	
	<br>����� ��Ÿ�̰� ������ (<input type="checkbox" id="sizeL2"><label for="sizeL2"> L 37900�� /
	<input type="checkbox" id="sizeM2"><label for="sizeM2"> M 31000��) ���� <input type="number" name="amount" min="1"><br>
	<!-- Menu 3 -->
	<img src="https://cdn.dominos.co.kr/admin/upload/goods/20231214_Y3W7J63w.jpg"alt="Wild West Steak" width="200">	
	<br>����� ���ϵ���ϵ� ����Ʈ ������ũ (<input type="checkbox" id="sizeL3"><label for="sizeL3">  L 34900�� /
	<input type="checkbox" id="sizeM3"><label for="sizeM3"> M 29000��) ���� <input type="number" name="amount" min="1"><br>	
	<!-- Menu 4 -->
	<img src="https://cdn.dominos.co.kr/admin/upload/goods/20231215_965Hu68d.jpg"alt="Brisket BBQ" width="200">	
	<br>�긮��Ŷ�ٺ�Q (<input type="checkbox" id="sizeL4"><label for="sizeL4"> L 34900�� /
	<input type="checkbox" id="sizeM4"><label for="sizeM4"> M 29000��) ���� <input type="number" name="amount" min="1"><br>	
	<!-- Menu 5 -->
	<img src="https://cdn.dominos.co.kr/admin/upload/goods/20230619_hybtjkBv.jpg"alt="Snow Brisket BBQ" width="200">	
	<br>�ƺ�ī�� ���� (<input type="checkbox" id="sizeL5"><label for="sizeL5"> L 27900�� /
	<input type="checkbox" id="sizeM5"><label for="sizeM5"> M 20500��) ���� <input type="number" name="amount" min="1"><br>	
	<!-- Menu 6 -->
	<img src="https://cdn.dominos.co.kr/admin/upload/goods/20200508_780B32i8.jpg"alt="Black Tiger" width="200">	
	<br>��Ÿ�̰� ������ (<input type="checkbox" id="sizeL6"><label for="sizeL6"> L 36900�� /
	<input type="checkbox" id="sizeM6"><label for="sizeM6"> M 30000��) ���� <input type="number" name="amount" min="1"><br>
	
	<br><button type="submit">���ÿϷ�</button>
	
	
	</form>
	<script>
	function calculateTotal() {
		// üũ�ڽ� ����
	    let checkboxes = document.querySelectorAll('input[id^="size"]:checked');
	    let amount = document.querySelector('input[name="amount"]').value;
	
	    let totalPrice = 0;
	    checkboxes.forEach(function (checkbox) {
	        let priceString = checkbox.nextSibling.nodeValue.trim();
	        let price = parseInt(priceString.substring(priceString.indexOf('��') + 1));
	        totalPrice += price;
	    });
	    
	    totalPrice *= parseInt(amount) || 0; // ���ڷ� ��ȯ, ���� �� 0���� ����

	    console.log("TotalPrice: " + totalPrice);
	    location.href = "/chap06/dominosResult.jsp?totalPrice=" + totalPrice;
	    return false;
	}

		}
	</script>


</body>
</html>