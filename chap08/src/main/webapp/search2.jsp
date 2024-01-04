<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사원조회2</title>
</head>
<body>
	<h3># Search </h3>
	
	<c:url value="/employee/searchResult.jsp" var="searchURL"  />
	<div>
		<form id="searchForm" action="${searchURL}" method="POST"></form>
		검색:
		<input id="serchQueryField" type="text" name="searchQuery" form="searchForm">
		<select name ="searchType" form="searchForm">
			<option value="first_name">이름</option>
			<option value="last_name">성</option>
			<option value="department_name">부서명</option>
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
            //console.log('엔터키가 눌림');
            // 값들이 제대로 들어가 있는지 검사를 하거나
            // 여기서 요청을 보내는 주소를 변경하거나 
            // 엔터키가 작동되지 않게 막으면(?) 이런저런 등등의 것들을 할 수 있다
            searchForm.submit(); //submit 해야 form에 있는 메소드로 액션하게 된다~
        }
    });
</script>
</body>
</html>