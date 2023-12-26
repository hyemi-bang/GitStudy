<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h3># input</h3>

	<ul>
		<li>input 태그를 사용해 사용자로부터 다양한 입력을 받을 수 있다</li>
		<li>사용자가 입력한 데이터는 자바스크립트에서 활용할 수도 있고 서버로 전송할 수도 있다</li>
		<li>type 속성을 변경해 다양한 방식으로 입력 받을 수 있다</li>
		<li>그 외의 input은 구글링</li>
	</ul>

	<table border="1">
		<tr>
			<th>Type</th>
			<th>Shape</th>
			<th>Description</th>
		</tr>
		<tr>
			<td>text</td>
			<td><input type="text" placeholder="input your name here.."></td>
			<td>일반적인 텍스트입력</td>
		</tr>
		<tr>
			<td>number</td>
			<td><input type="number" min="-10" max="10" step="2" value="8"></td>
			<td>숫자만 입력</td>
		</tr>
		<tr>
			<td>password</td>
			<td><input type="password"></td>
			<td>볼 수 없는 입력칸</td>
		</tr>
		<tr>
			<td>date</td>
			<td><input type="date"></td>
			<td>날짜 선택칸 (브라우저마다 생김새가 다름)</td>
		</tr>
		<tr>
			<td>radio</td>
			<td>
				<!-- name 속성은 input 태그의 카테고리를 의미한다 --> <input type="radio"
				name="genre"> 코미디 <br> <input type="radio" name="genre">
				스릴러 <br> <input type="radio" name="genre"> 액션 <br>
				<input type="radio" name="genre"> 느와르<br>
			</td>
			<td>name속성이 같은 여러 옵션 중 택 1하는 선택란</td>
		</tr>
		<tr>
			<td>checkbox</td>
			<td><input type="checkbox" name="lunch"> 떡볶이<br> <input
				type="checkbox" name="lunch"> 김밥 <br> <input
				type="checkbox" name="lunch"> 튀김 <br> <input
				type="checkbox" name="lunch"> 순대<br></td>
			<td>하나의 카테고리에서 여러 선택을 할 수 있는 선택란</td>
		</tr>
		<tr>
			<td>radio + label태그 for속성</td>
			<td><input type="radio" name="genre" id="comedy"> <label
				for="comedy"> 코미디</label> <br> <input type="radio" name="genre"
				id="noir"> <label for="noir">느와르</label> <br> <input
				type="radio" name="genre" id="action"> <label for="action">액션</label><br>
			</td>
			<td>id 속성과 label 태그의 for 속성을 이용해 라벨을 지정할 수 있다</td>
		</tr>

		<tr>
			<td>checkbox + label</td>
			<td><input type="checkbox" name="lunch" id="hotbar"> <label
				for="hotbar">핫바</label> <br> <input type="checkbox"
				name="lunch" id="kimbab"> <label for="kimbab">김밥</label> <br>
				<input type="checkbox" name="lunch" id="cup-noodle"> <label
				for="cup-noodle">컵라면</label> <br> <input type="checkbox"
				name="lunch" id="hamburger"> <label for="hamburger">햄버거</label>
				<br></td>
			<td>id 속성과 label 태그의 for 속성을 이용해 라벨을 지정할 수 있다</td>

		</tr>

		<tr>
			<td>textarea</td>
			<td><textarea name="" id="" cols="30" rows="10"></textarea></td>
			<td>긴 내용의 텍스트를 입력받는 용도</td>
		</tr>

		<tr>
			<td>select</td>
			<td><select name="" id="">
					<option value="">South Korea</option>
					<option value="">Republic of Korea</option>
					<option value="">대한민국</option>
			</select></td>
			<td>선택란</td>
		</tr>
		<tr>
			<td>color</td>
			<td><input type="color"></td>
			<td>색상 선택</td>
		</tr>

	</table>

	<h3># Form</h3>

	<ul>
		<li>사용자가 form 태그 내부의 input 태그들에서 선택한 값을 서버로 전송할 수 있다</li>
		<li>form 태그 내부에서 submit 발생하면 폼 내부의 데이터와 함께 서버로 요청을 보낸다</li>
		<li>input 태그의 name 속성이 데이터의 key역할을 하여 value와 함께 전송된다</li>
		<li>실어보낸 데이터는 서버측의 request 객체에서 확인할 수 있다</li>
		<li>action 속성 : 요청 보낼 곳의 URL</li>
		<li>method 속성 : 요청 방식을 선택 (GET, POST)</li>
	</ul>
	
	<h3># GET방식 요청</h3>
	<ul>
		<li>GET 방식 요청은 데이터가 ?key1=value1&key2=value2... 형태로 URL의 맨 뒤 에 붙어서 전송됨</li>
		<li>비밀번호 같은 중요한정보는 GET방식으로 전달하면 안된다 (선택한 페이지나, 방금 입력한 검색어는 괜찮)</li>
	</ul>

	<form action="/chap02/formTest" method="GET">
		<table>
			<tr>
				<th>name</th>
				<td><input type="text" name="user-name"></td>
			</tr>
			<tr>
				<th>age</th>
				<td><input type="number" name="user-age"></td>
			</tr>
			<tr>
				<th>password</th>
				<td><input type="password" name="user-password"></td>
			</tr>
			<tr>
				<th>color</th>
				<td><input type="color" name="my-color"></td>
			</tr>
			<tr>
				<td><input type="submit"></td> <!--  데이터 전송하기 -->
				<td><input type="reset"></td> <!--  입력한 내용(데이터) 모두 취소하기 -->
			</tr>
		</table>
	</form>
	
		<h3># POST방식 요청</h3>
	<ul>
		<li>POST 방식으로 요청을 보내면 URL에 노출이 되지 않은 채로 실어 보낼 수 있다</li>
		<li>데이터는 request의 body라는 곳으로 실려보낸다</li>
	</ul>

	<form action="/chap02/formTest" method="POST">
		<table>
			<tr>
				<th>name</th>
				<td><input type="text" name="user-name"></td>
			</tr>
			<tr>
				<th>age</th>
				<td><input type="number" name="user-age"></td>
			</tr>
			<tr>
				<th>password</th>
				<td><input type="password" name="user-password"></td>
			</tr>
			<tr>
				<th>color</th>
				<td><input type="color" name="my-color"></td>
			</tr>
			<tr>
				<td><input type="submit"></td> <!--  데이터 전송하기 -->
				<td><input type="reset"></td> <!--  입력한 내용(데이터) 모두 취소하기 -->
			</tr>
		</table>
	</form>
	
	<h3># 링크로 GET방식 요청 보내기 (중요)</h3>
	
	<p>주소를 직접 수정하는 것 만으로도 GET방식 파라미터를 실어보낼 수 있다.
		주소값 길이에 제한이 있다고 한다.
		글 내용 같은것은 보내기엔 길이 제한에 걸릴 수 있어서 사용하지 않는게 좋다.
	</p>
	
	<a href="/chap02/formTest?user-name=kim&user-age=20">링크</a>
</body>
</html>