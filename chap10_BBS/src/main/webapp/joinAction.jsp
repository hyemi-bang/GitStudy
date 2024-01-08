<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="chap10_BBS.dao.UserDAO, chap10_BBS.dto.UserDTO"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
	<%
	String loggedInUserID = (String) session.getAttribute("userID");
    // 이미 로그인된 상태라면 게시판 페이지로 바로 이동
  	if (loggedInUserID != null) {
        response.sendRedirect("/chap10_BBS/main.jsp");
        return;
    }

	%>

	<%
	// UserDTO 객체를 생성하여 사용자 입력 값을 저장
	UserDTO user = new UserDTO();
	user.setUserID(request.getParameter("userID"));
	user.setUserPassword(request.getParameter("userPassword"));
	user.setUserName(request.getParameter("userName"));
	user.setUserEmail(request.getParameter("userEmail"));

	// 사용자가 입력한 값 중 하나라도 비어있다면 회원가입 실패
	if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
			|| user.getUserEmail() == null || user.getUserID().isEmpty() || user.getUserPassword().isEmpty()
			|| user.getUserName().isEmpty() || user.getUserEmail().isEmpty()) {
		out.println("<script>");
		out.println("alert('입력되지 않은 사항이 있습니다.')");
		out.println("history.back()");
		out.println("</script>");
	} else if (user.getUserPassword().length() < 8) { // 비밀번호가 8자리 미만일 때
		out.println("<script>");
		out.println("alert('비밀번호는 8자리 이상이어야 합니다.')");
		out.println("history.back()");
		out.println("</script>");
	} else {
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);

		if (result == -1) { // 해당 아이디가 존재할때
			out.println("<script>");
			out.println("alert('이미 존재하는 아이디입니다')");
			out.println("history.back()");
			out.println("</script>");
		} else if (result == 0) { // 회원가입이 되었을때
			session.setAttribute("userID", user.getUserID());
	%>
	<h2>회원가입이 완료되었습니다.</h2>
	<script>
		location.href = "main.jsp";
	</script>
	<%
	}
	}
	%>
</body>
</html>