<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String scope = request.getParameter("scope");

	if(scope.equals("application")){
		application.setAttribute("food", request.getParameter("food"));
	} else if (scope.equals("session")){
		session.setAttribute("food", request.getParameter("food"));
	} else if (scope.equals("request")) {
		request.setAttribute("food", request.getParameter("food"));
	} else if (scope.equals("pageContext")) {
		pageContext.setAttribute("food", request.getParameter("food"));
	}
	request.getRequestDispatcher("/attribute/index.jsp").forward(request, response);
%>