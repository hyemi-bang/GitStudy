<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����ȸ2</title>
</head>
<body>
	<h3># Search </h3>
	
	<c:url value="/employee/searchResult.jsp" var="searchURL"  />
	<div>
		<form id="searchForm" action="${searchURL}" method="POST"></form>
		�˻�:
		<input id="serchQueryField" type="text" name="searchQuery" form="searchForm">
		<select name ="searchType" form="searchForm">
			<option value="first_name">�̸�</option>
			<option value="last_name">��</option>
			<option value="department_name">�μ���</option>
		</select>
	
	</div>


	<script>
    const searchQueryField = document.getElementById("serchQueryField");
    //HTML Form
    const searchForm = document.getElementById("searchForm");
    console.log(searchQueryField);
    console.log(searchForm);
    console.dir(searchForm);
    
    searchQueryField.addEventListener('keydown', (e) => {
        // e.preventDefault();    
        // console.log(e);

        if (e.keyCode === 13) {
            //console.log('����Ű�� ����');
            // ������ ����� �� �ִ��� �˻縦 �ϰų�
            // ���⼭ ��û�� ������ �ּҸ� �����ϰų� 
            // ����Ű�� �۵����� �ʰ� ������(?) �̷����� ����� �͵��� �� �� �ִ�
            searchForm.submit(); //submit �ؾ� form�� �ִ� �޼ҵ�� �׼��ϰ� �ȴ�~
        }
    });
</script>
</body>
</html>