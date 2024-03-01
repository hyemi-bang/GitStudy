<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="chap10_BBS.dao.BbsDAO, chap10_BBS.dto.BbsDTO"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 결과</title>
</head>
<body>
	<%
	String loggedInUserID = (String) session.getAttribute("userID");
		// BbsDTO 객체를 생성하여 사용자 입력 값을 저장
		BbsDTO bbs = new BbsDTO();
		bbs.setBbsTitle(request.getParameter("bbsTitle"));
		bbs.setUserID(loggedInUserID);
		bbs.setBbsContent(request.getParameter("bbsContent"));

	if (loggedInUserID == null) {
		out.print("<script>alert('로그인하세요.')</script>");
		response.sendRedirect("/chap10_BBS/login.jsp");
		return;
	} else {


		// 사용자가 입력한 값 중 하나라도 비어있다면 게시글 작성 실패
		if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
			out.println("<script>");
			out.println("alert('입력되지 않은 사항이 있습니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.write(bbs.getBbsTitle(), bbs.getUserID(), bbs.getBbsContent());

			if (result == -1) {
				out.println("<script>");
				out.println("alert('게시글 작성에 실패했습니다.')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				response.sendRedirect("/chap10_BBS/bbs.jsp");
			}
		}
	}
	%>
</body>
</html>
