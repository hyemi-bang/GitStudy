<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	//��Ű�� �� �������� �����ϴ� ���̱� ������ ���ڿ��� ������ �����ϴ�
	Cookie cookie = new Cookie("age","21-50"); // 1. �⺻��Ű
	// ���� ��Ű �ν��Ͻ��� ����������, ���信 ��Ű�� ���Ե��� �ʾҴ� 

	Cookie cookie2 = new Cookie("fav", "drama"); // 2 ����Ⱓ�� ������ ��Ű
					//new Cookie(String name , String value);
	cookie2.setMaxAge(600); // �� �ڿ� �������� ��Ű, MaxAge()�� �������� �ʴ°�� ������ ����ñ����� ������ �ȴ�
	cookie2.setHttpOnly(true); // �ڹٽ�ũ��Ʈ���� �� ��Ű�� ������� ���ϵ��� �����ϴ� ��(���Ȼ� �ʿ��ϴ�)
	cookie2.setPath("/chap09"); // �ش� ��Ű�� ����Ǵ� ������ ���� ����� chap09�������� ����ϱ� ����ϴ� ��
	//cookie2.setDomain("localhost"); "naver... ��"���� �������� ��¥�� ������ �� �������� ũ�� �ҿ��� ���� �ɼ��̴�
	cookie2.setValue("comedy"); // setValue()�� ���� ���� �� �� ������ ��Ű�̸��� ���� �Ұ����ϴ�
	
	response.addCookie(cookie); // response.addCookie()�� ���信 �Ǿ���� Ŭ���̾�Ʈ ���� �ݿ��ȴ�
	response.addCookie(cookie2);
	response.sendRedirect(request.getContextPath() + "/cookie/index.jsp");

%>