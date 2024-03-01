<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="chap10_BBS.dao.BbsDAO, chap10_BBS.dto.BbsDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="/views/css/bbs.css">
<title>게시판</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int bbsID = 0;
	if(session.getAttribute("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID == 0){
		out.print("<script>alert('유효하지않은 글입니다.')</script>");
		response.sendRedirect("/chap10_BBS/login.jsp");
		return;
	}
	
	BbsDTO bbs = new BbsDAO().getBbs(bbsID);
	%>
	<nav class="navigation">
		<div class="navi-header">
			<button type="button" class="navi-toggle">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navi-brand" href="main.jsp">게시판 사이트</a>
			<div></div>
		</div>

		<div class="navi-collapse">
			<ul class="nav navi-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>

			<%
			if (userID == null) {
			%>
			<ul class="nav navi-nav navi-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> 접속하기 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
			} else {
			%>
			<ul class="nav navi-nav navi-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> 회원관리 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
			</ul>

			<%
			}
			%>

		</div>
	</nav>
	
	<h1>게시글 페이지</h1>		
	<div>
	
		<table border="1">
			<thead class="table">
			<tr>
				<th colspan="3" style="background-color : #eeeeee; text-align: center">게시판 글보기</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td style="width: 30%;">글제목</td>
				<td colspan="2"><%= bbs.getBbsTitle() %></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td colspan="2"><%= bbs.getUserID() %></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td colspan="2"><%= bbs.getBbsDate() %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="2" style="min-height:200px; text-align:left;"><%= bbs.getBbsContent() %></td>
			</tr>
			</tbody>
		</table>
		<a href="bbs.jsp">목록</a>
		<%
			if(userID != null && userID.equals(bbs.getUserID())){ //작성자가 동일하다면
		%>
			<a href="update.jsp?bbsID=<%=bbsID %>">수정</a>
			<a href="deleteAction.jsp?bbsID=<%=bbsID %>">삭제</a>
		<%
			}
		%>
		<input type="submit" href="write.jsp" class="btn btn-right" value="글쓰기">
	</form>
	</div>
	
	

</body>
</html>