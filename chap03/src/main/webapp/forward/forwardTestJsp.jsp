<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<script>console.log('<%=request.getParameter("firstName")%>');</script>

<%
	// �̷��� JSP�� ����ϸ� Servlet�� �ٸ� �ٰ� ����
	
	//request.getRequestDispatcher("/forward/page1.jsp").forward(request, response);
%>
<%-- JSP�������� forward�ϱ� ���� �ּ�ó���ѰͰ� ���� ���--%>

<jsp:forward page="/forward/page1.jsp"></jsp:forward>