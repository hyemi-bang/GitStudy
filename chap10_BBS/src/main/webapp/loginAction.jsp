<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="chap10_BBS.dao.UserDAO, chap10_BBS.dto.UserDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
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
	UserDTO user = new UserDTO();
	//userDAO 클래스를 사용하여 로그인 로직을 구현 
	String userID = request.getParameter("userID");
    String userPassword = request.getParameter("userPassword");
    UserDAO userDAO = new UserDAO();
    
    if(userID != null && userPassword != null &&
    		!userID.isEmpty() && !userPassword.isEmpty()){
    	int result = userDAO.login(userID, userPassword);
    	
    	switch (result){
    	case 1: //로그인성공
    		session.setAttribute("userID", userID);
    		response.sendRedirect("/chap10_BBS/main.jsp");
    		break;
    	case 0: // 비밀번호 다른경우
    		 out.println("<script>");
             out.println("alert('비밀번호가 틀립니다')");
             out.println("history.back()");
             out.println("</script>");
             break;
    	case -1: // 아이디가 존재하지 않는 경우
            out.println("<script>");
            out.println("alert('존재하지 않는 아이디입니다.')");
            out.println("history.back()");
            out.println("</script>");
            break;
        case -2: // 데이터베이스 오류
            out.println("<script>");
            out.println("alert('데이터베이스에 오류가 발생했습니다.')");
            out.println("history.back()");
            out.println("</script>");
            break;
        default:
            break;
    	}
    } else {
        // 아이디 또는 비밀번호가 입력되지 않은 경우
        out.println("<script>");
        out.println("alert('아이디와 비밀번호를 모두 입력하세요.')");
        out.println("history.back()");
        out.println("</script>");
    }
%>
</body>
</html>