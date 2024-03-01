<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	session.invalidate(); // 세션 즉시 만료시키기
	
	//리다이렉트 = 외부 주소 사용
	response.sendRedirect("/chap04/attribute/index.jsp");
%>