<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h3># JSP</h3>
	
	<ul>
		<li>Java Server Pages(JSP)</li>
		<li>���� ���������� �����ϱ� ���� JAVA API</li>
		<li>HTML �ȿ� �ڹ� �ڵ带 Ȱ���Ͽ� ��Ȳ�� ���� ���ϴ� �� �������� ���� �� �ִ�</li>
	</ul>
	
	<h3># Web Server(Apache)</h3>
	
	<ul>
		<li>��û�� ���� URI�� �ش��ϴ� �˸��� �ڿ��� �����ϴ� ���α׷�</li>
		<li>.html ������ ��û -> .html ������ ����</li>
		<li>�׸������� ��û -> �׸������� ����</li>
		<li>���� ������ ó��</li>
	</ul>
	
	<h3># Web Application Server(Apache-Tomcat)</h3>
	
	<ul>
		<li>.jsp������ ��û -> Java �ؼ� �� ���� -> .html ���� ���� -> ����</li>
		<li>�ܼ� ������ �ƴ� ��Ȳ�� ���� ��ȭ�ϴ� ���� ������ ó���� ����Ѵ�</li>
		<li>Apache=Tomcat���� Tomcat�� JSP�� �ؼ��� ����ϴ� ���α׷��̴�</li>
	</ul>
	
	<%-- JSP�ּ� --%>
	
	<%-- JSP Script--%>
	
	<%--
		<%  %> : �ش� ���� ���ο��� �ڹ� �ڵ带 ����� �� �ִ� (�޼��� ������ ����)
		<%= %> : �ڹٿ� �ִ� ���� HTML�� ����� �� �ִ� (out.print�� �����)
		<%! %> : �޼��带 ������ �� �ִ� (Ŭ���� ������ �ν��Ͻ� ����)
		<%@ %> : ���� �������� ������ �� �ִ�
		
	 --%>
	 
	 <%
	 	String str = "Hello, JSP!\n";
	 	String firstName ="Smith";
	 
	 	for(int i = 0; i < 10; i++){
	 	System.out.println(str + i);
	 	}
	 	
		// java.sql.DriverManager.getConnection(); 
		// �ڹٿ��� �� �������� ���� ������ �� �ִ� -> DB���� ���� ���� �� �������� ������ �� �ִ�
			
	 	out.print("<div>"+str+"</div>"); // �ڹٿ��� ���������� ���� ������ �� �ִ�
	 	out.print(rabbit());
	 %>
	 
	 <%!
	 //<pre> : �� ������������ �ؽ�Ʈ�� ����� �״�� ������ �� �ִ� �±�
	 // \n \t ���� ������~
	 	private String rabbit(){
		 return "<pre>"
			+  " /)/)\n"
			+  "(  ..)\n"
			+  "(   >$</pre>";
	 }
	 %>
	 
	 <%
		out.print("<div id=\"" + firstName + "\">"+firstName+"</div>");
	 %>
	 
	 <div id="<%=firstName%>"><%=firstName%></div>
	 
	 <h3># .jsp������ ó�� ����</h3>
	 <ol>
	 	<li>.jsp ������ �켱 .java���Ϸ� ��ȯ�ȴ�(1�� ������)</li>
	 	<li>��ȯ�� .java ������ �������Ѵ� (2�� ������)</li>
	 	<li>�����ϵ� ������� �� ���ؽ�Ʈ(Tomcat)�� ��ϵǾ� ������� ��û�� ��ٸ��� </li>
	 	<li>����ڰ� ��û�ϸ� �� ���ؽ�Ʈ�� ��ϵ� ������� �����Ͽ� �����Ѵ�</li>
	 </ol>
</body>
</html>