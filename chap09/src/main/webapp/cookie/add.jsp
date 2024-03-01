<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	//쿠키는 웹 브라우저에 저장하는 값이기 때문에 문자열만 보관이 가능하다
	Cookie cookie = new Cookie("age","21-50"); // 1. 기본쿠키
	// 현재 쿠키 인스턴스는 존재하지만, 응답에 쿠키가 포함되지 않았다 

	Cookie cookie2 = new Cookie("fav", "drama"); // 2 만료기간을 설정한 쿠키
					//new Cookie(String name , String value);
	cookie2.setMaxAge(600); // 초 뒤에 지워지는 쿠키, MaxAge()를 설정하지 않는경우 브라우저 종료시까지만 유지가 된다
	cookie2.setHttpOnly(true); // 자바스크립트에서 이 쿠키를 사용하지 못하도록 설정하는 것(보안상 필요하다)
	cookie2.setPath("/chap09"); // 해당 쿠키가 적용되는 범위를 설정 현재는 chap09전역에서 사용하길 희망하는 것
	//cookie2.setDomain("localhost"); "naver... 등"남의 도메인은 어짜피 선택할 수 없음으로 크게 소용이 없는 옵션이다
	cookie2.setValue("comedy"); // setValue()로 값을 변경 할 수 있지만 쿠키이름은 변경 불가능하다
	
	response.addCookie(cookie); // response.addCookie()로 응답에 실어보내야 클라이언트 측에 반영된다
	response.addCookie(cookie2);
	response.sendRedirect(request.getContextPath() + "/cookie/index.jsp");

%>