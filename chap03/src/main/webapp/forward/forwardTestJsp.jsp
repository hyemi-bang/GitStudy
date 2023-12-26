<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<script>console.log('<%=request.getParameter("firstName")%>');</script>

<%
	// 이렇게 JSP를 사용하면 Servlet과 다를 바가 없다
	
	//request.getRequestDispatcher("/forward/page1.jsp").forward(request, response);
%>
<%-- JSP문법으로 forward하기 위에 주석처리한것과 같은 방법--%>

<jsp:forward page="/forward/page1.jsp"></jsp:forward>