<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	
	<form method="POST" action="writeAction.jsp">
		<table border="1">
			<thead class="table">
			<tr>
				<th colspan="2" style="background-color : #eeeeee; text-align: center">게시판 글쓰기 양식</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td><input type="text" class="form-control" placeholder="글쓰기" name="bbsTitle" maxlength="50"></td>
			</tr>
			<tr>
				<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height=300px"></textarea></td>
			</tr>
			</tbody>
		</table>
		<input type="submit" href="write.jsp" class="btn btn-right" value="글쓰기">
	</form>
	</div>
	
	

</body>
</html>