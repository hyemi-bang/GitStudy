<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��û��� �����ϱ�</title>
</head>
<body>

	<h3># webapp ���� �ڿ��� ���� ��û������</h3>

	<ul>
		<li>/������Ʈ�̸�/������/���ϸ� (��δ�� ��û�� ������ �ڿ��� �޾ƿ� �� �ִ�)</li>
		<li>������Ʈ �̸��� �ش��ϴ� �κ��� ContextPath��� �θ���</li>
		<li>ContextPath�� �⺻������ ������Ʈ �̸����� �����Ǿ� ������ ������ �����ϴ�</li>
	</ul>
	
	<h3># servlet���� ��û ������</h3>
	
	<ul>
		<li>�ش� ������ @WebServlet()���� �ο��� URL�� ���� ��û</li>
		<li>*�� ����Ͽ� ���� ��θ� �ϳ��� �������� ó���ϴ� �͵� �����ϴ�</li>
	</ul>
	
	<h3># forward ��� �����ϱ�</h3>

	<ul>
		<li>�������� ó���� ���� .jsp�� �̾����� ��θ� �����ؾ� �Ѵ�</li>
		<li>webapp���� ���� ���� ��ġ ��θ� �����ؾ��Ѵ�</li>
	</ul>
	
	<h3># Redirect ��� �����ϱ�</h3>
	
	<ul>
		<li>Ŭ���̾�Ʈ�� �ٽ� ��û�� �������ϴ� ��θ� �����Ѵ�</li>
		<li>ContextPath�� ���Ե� ��θ� ����ؾ��Ѵ�.</li>
	</ul>
	
	<ul>
		<li>&lt;img src="/������Ʈ�̸�/������/�̹������ϸ�.jpg" alt="�̹��� ����"&gt;</li>
		<li>&lt;script src="�����/��ũ��Ʈ����.js"&gt;&lt;/script&gt;</li>
		<li>&lt;a href="/������Ʈ�̸�/������/���ϸ�"&gt;��ũ �ؽ�Ʈ&lt;/a&gt;</li>
		<li>&lt;a href="http://192.168.0.66:9000/chap05/path/pen2.jpg" width="200"&gt;&lt;/a&gt;</li>
		<li>&lt;a href="�����/���ϸ�"&gt;��ũ �ؽ�Ʈ&lt;/a&gt;</li>
		<li>����θ� ���� ��� ���� �̰��� �����ϴµ� ����ߴ� URL�� ����η� ��û�� ������</li>
	</ul>
	<a href="./test1.html">test.html</a>
			<img href="http://192.168.0.66:9000/chap05/path/pen2.jpg" width="200"/> 
</body>
</html>