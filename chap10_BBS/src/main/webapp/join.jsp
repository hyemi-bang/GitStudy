<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width" initial-scale="1">
    <link rel="stylesheet" href="/views/css/login.css">
    <title>회원가입화면</title>
</head>
<body>
    <nav class="navigation">
        <div class="navi-header">
            <button type="button" class="navi-toggle">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navi-brand" href="main.jsp">게시판 사이트</a>
            <div>
                <ul class="nav navi-nav navi-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 접속하기 <span class="caret"></span> </a>
                    <ul class="dropdown-menu">
                        <li class="active"><a href="login.jsp">로그인</a></li>
                        <li><a href="join.jsp">회원가입</a></li>
                    </ul>
                </li>
            	</ul>
            </div>
        </div>
      
        <div class="navi-collapse">
            <ul class="nav navi-nav">
                <li><a href="main.jsp">메인</a></li>
                <li><a href="bbs.jsp">게시판</a></li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <div class="jumbotron" style="padding-top: 20px">
                <form method="POST" action="joinAction.jsp">
                    <h3 style="text-align: center;">회원가입화면</h3>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
                    </div>					
                    <div class="form-group">
                        <input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
                    </div>	
                    <input type="submit" class="btn btn-primary form-control" value="회원가입">
                </form>
            </div>
            <div class="col-lg-4"></div>
        </div>
    </div>
</body>
</html>