<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//�����ΰ� path�� �´� ��쿡 ��Ű�� �׻� ��û�� ���ԵǾ� �����Ѵ�
	//���ϴ� ��Ű �ϳ��� �޴� �޼���� �⺻������ �������� �ʴ´�
	Cookie[] cookies = request.getCookies();

	//��Ű�� �ϳ��� ���� ��츦 ���
	if(cookies != null){
		for(Cookie cookie : cookies){
			String cname = cookie.getName(); // setName�� �ȵǴµ� getName�� ���� 
			
			if(cname.equals("age")){
				cookie.setMaxAge(300); // ����Ⱓ�� ���ǰ��̴� ��Ű�� 300�� �� ����ǰ� ����
				cookie.setValue("3-7");
				System.out.println("age path: "+cookie.getPath());
				
				// ��û���� ���޹��� ��Ű���� path������ ���� (��� ��������)
				//������ ����� path�� �״�� ����ϴ� ���� �Ұ��� �ϴ�
				response.addCookie(cookie); // ���信 �Ǿ�߸� ���������� �ݿ��ȴ�.
				
			} else if (cname.equals("fav")){
				// ��Ȯ�ϰ� ���� ��Ű�� ����ϱ� ���ؼ��� name�� �ƴ϶� path���� �����ϰ� ��ġ���Ѿ� �Ѵ�.
				// path���� �ٸ��� �ٸ� ��Ű�� �ν��Ѵ�.
				cookie.setMaxAge(-1); // maxAge ���� ������ �ٲٸ� �ش� ��Ű�� �������� �����ϴ� ��
				cookie.setPath("/chap09");
				response.addCookie(cookie);
			}
			
		}
	}
	
	response.sendRedirect(request.getContextPath() + "/cookie/index.jsp");
%>