<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, chap08.dto.EmployeeDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>검색된 사원 리스트 - list.jsp</title>
</head>
<body>

    <h3># 검색 결과</h3>

    <%
        // 검색 결과를 가져오기
        List<EmployeeDTO> searchResults = (List<EmployeeDTO>) request.getAttribute("searchResults");

        if (searchResults != null && !searchResults.isEmpty()) {
    %>
            <div style="display: flex; flex-direction: column;">
                <%
                    for (EmployeeDTO employee : searchResults) {
                        out.print(employee.getDivRow());
                    }
                %>
            </div>
    <%
        } else {
    %>
            <p>검색 결과가 없습니다.</p>
    <%
        }
    %>

    <p><a href="${pageContext.request.contextPath}/search.jsp">검색 페이지로 돌아가기</a></p>

</body>
</html>
