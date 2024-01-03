<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, chap08.dto.EmployeeDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>�˻��� ��� ����Ʈ - list.jsp</title>
</head>
<body>

    <h3># �˻� ���</h3>

    <%
        // �˻� ����� ��������
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
            <p>�˻� ����� �����ϴ�.</p>
    <%
        }
    %>

    <p><a href="${pageContext.request.contextPath}/search.jsp">�˻� �������� ���ư���</a></p>

</body>
</html>
