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
		<li>input �±׸� ����� ����ڷκ��� �پ��� �Է��� ���� �� �ִ�</li>
		<li>����ڰ� �Է��� �����ʹ� �ڹٽ�ũ��Ʈ���� Ȱ���� ���� �ְ� ������ ������ ���� �ִ�</li>
		<li>type �Ӽ��� ������ �پ��� ������� �Է� ���� �� �ִ�</li>
		<li>�� ���� input�� ���۸�</li>
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
			<td>�Ϲ����� �ؽ�Ʈ�Է�</td>
		</tr>
		<tr>
			<td>number</td>
			<td><input type="number" min="-10" max="10" step="2" value="8"></td>
			<td>���ڸ� �Է�</td>
		</tr>
		<tr>
			<td>password</td>
			<td><input type="password"></td>
			<td>�� �� ���� �Է�ĭ</td>
		</tr>
		<tr>
			<td>date</td>
			<td><input type="date"></td>
			<td>��¥ ����ĭ (���������� ������� �ٸ�)</td>
		</tr>
		<tr>
			<td>radio</td>
			<td>
				<!-- name �Ӽ��� input �±��� ī�װ��� �ǹ��Ѵ� --> <input type="radio"
				name="genre"> �ڹ̵� <br> <input type="radio" name="genre">
				������ <br> <input type="radio" name="genre"> �׼� <br>
				<input type="radio" name="genre"> ���͸�<br>
			</td>
			<td>name�Ӽ��� ���� ���� �ɼ� �� �� 1�ϴ� ���ö�</td>
		</tr>
		<tr>
			<td>checkbox</td>
			<td><input type="checkbox" name="lunch"> ������<br> <input
				type="checkbox" name="lunch"> ��� <br> <input
				type="checkbox" name="lunch"> Ƣ�� <br> <input
				type="checkbox" name="lunch"> ����<br></td>
			<td>�ϳ��� ī�װ����� ���� ������ �� �� �ִ� ���ö�</td>
		</tr>
		<tr>
			<td>radio + label�±� for�Ӽ�</td>
			<td><input type="radio" name="genre" id="comedy"> <label
				for="comedy"> �ڹ̵�</label> <br> <input type="radio" name="genre"
				id="noir"> <label for="noir">���͸�</label> <br> <input
				type="radio" name="genre" id="action"> <label for="action">�׼�</label><br>
			</td>
			<td>id �Ӽ��� label �±��� for �Ӽ��� �̿��� ���� ������ �� �ִ�</td>
		</tr>

		<tr>
			<td>checkbox + label</td>
			<td><input type="checkbox" name="lunch" id="hotbar"> <label
				for="hotbar">�ֹ�</label> <br> <input type="checkbox"
				name="lunch" id="kimbab"> <label for="kimbab">���</label> <br>
				<input type="checkbox" name="lunch" id="cup-noodle"> <label
				for="cup-noodle">�Ŷ��</label> <br> <input type="checkbox"
				name="lunch" id="hamburger"> <label for="hamburger">�ܹ���</label>
				<br></td>
			<td>id �Ӽ��� label �±��� for �Ӽ��� �̿��� ���� ������ �� �ִ�</td>

		</tr>

		<tr>
			<td>textarea</td>
			<td><textarea name="" id="" cols="30" rows="10"></textarea></td>
			<td>�� ������ �ؽ�Ʈ�� �Է¹޴� �뵵</td>
		</tr>

		<tr>
			<td>select</td>
			<td><select name="" id="">
					<option value="">South Korea</option>
					<option value="">Republic of Korea</option>
					<option value="">���ѹα�</option>
			</select></td>
			<td>���ö�</td>
		</tr>
		<tr>
			<td>color</td>
			<td><input type="color"></td>
			<td>���� ����</td>
		</tr>

	</table>

	<h3># Form</h3>

	<ul>
		<li>����ڰ� form �±� ������ input �±׵鿡�� ������ ���� ������ ������ �� �ִ�</li>
		<li>form �±� ���ο��� submit �߻��ϸ� �� ������ �����Ϳ� �Բ� ������ ��û�� ������</li>
		<li>input �±��� name �Ӽ��� �������� key������ �Ͽ� value�� �Բ� ���۵ȴ�</li>
		<li>�Ǿ�� �����ʹ� �������� request ��ü���� Ȯ���� �� �ִ�</li>
		<li>action �Ӽ� : ��û ���� ���� URL</li>
		<li>method �Ӽ� : ��û ����� ���� (GET, POST)</li>
	</ul>
	
	<h3># GET��� ��û</h3>
	<ul>
		<li>GET ��� ��û�� �����Ͱ� ?key1=value1&key2=value2... ���·� URL�� �� �� �� �پ ���۵�</li>
		<li>��й�ȣ ���� �߿��������� GET������� �����ϸ� �ȵȴ� (������ ��������, ��� �Է��� �˻���� ����)</li>
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
				<td><input type="submit"></td> <!--  ������ �����ϱ� -->
				<td><input type="reset"></td> <!--  �Է��� ����(������) ��� ����ϱ� -->
			</tr>
		</table>
	</form>
	
		<h3># POST��� ��û</h3>
	<ul>
		<li>POST ������� ��û�� ������ URL�� ������ ���� ���� ä�� �Ǿ� ���� �� �ִ�</li>
		<li>�����ʹ� request�� body��� ������ �Ƿ�������</li>
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
				<td><input type="submit"></td> <!--  ������ �����ϱ� -->
				<td><input type="reset"></td> <!--  �Է��� ����(������) ��� ����ϱ� -->
			</tr>
		</table>
	</form>
	
	<h3># ��ũ�� GET��� ��û ������ (�߿�)</h3>
	
	<p>�ּҸ� ���� �����ϴ� �� �����ε� GET��� �Ķ���͸� �Ǿ�� �� �ִ�.
		�ּҰ� ���̿� ������ �ִٰ� �Ѵ�.
		�� ���� �������� �����⿣ ���� ���ѿ� �ɸ� �� �־ ������� �ʴ°� ����.
	</p>
	
	<a href="/chap02/formTest?user-name=kim&user-age=20">��ũ</a>
</body>
</html>