<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List" %>
<%@ page import="chap10_BBS.dto.BbsDTO, chap10_BBS.dao.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="/views/css/bbs.css">
<title>게시판</title>
<style>
 a, a:hover{
 color :black;
 text-decoration: none;
 }
</style>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int pageNumber = 1; // 기본 페이지번호 1번
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request. getParameter("pageNumber"));
	}
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
	
	<h1>게시글 목록 페이지</h1>		
	<div>
	
	<section>
		<table border="1">
			<thead class="table">
			<tr>
				<th id="tableth">번호</th>
				<th id="tableth">제목</th>
				<th id="tableth">작성자</th>
				<th id="tableth">날짜</th>
			</tr>
			</thead>
			<tbody>
			<% 
				BbsDAO bbsDao = new BbsDAO();
				ArrayList<BbsDTO> list = bbsDao.getList(pageNumber);
				for(int i= 0 ; i < list.size(); i++){
			%>
			<tr>
				<td><%= list.get(i).getBbsID() %></td>
				<td><a href="view.jsp?bbsID"<%= list.get(i).getBbsID() %>>
				<%= list.get(i).getBbsTitle()%></a></td>
				<td><%= list.get(i).getUserID() %></td>
				<td><%= list.get(i).getBbsDate()%></td>
			</tr>
			<% 
				}
				%>
			</tbody>
		</table>
	<!-- 이전/다음페이지 넘어가는 구현은 다음에...  -->
		<a href="write.jsp" class="btn btn-right">글쓰기</a>
	</section>
	</div>
	
	

</body>
</html>