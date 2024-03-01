<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<c:set var="fruit" value="apple" scope="page" />
	<script>
		const a = 10;
		const b = '${fruit}';
	</script>

</head>
<body>

	<a href="./index.jsp">인덱스</a>
	<a href="./menu.jsp">메뉴</a>
	
