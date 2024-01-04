<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//도메인과 path가 맞는 경우에 쿠키는 항상 요청에 포함되어 도착한다
	//원하는 쿠키 하나만 받는 메서드는 기본적으로 존재하지 않는다
	Cookie[] cookies = request.getCookies();

	//쿠키가 하나도 없는 경우를 대비
	if(cookies != null){
		for(Cookie cookie : cookies){
			String cname = cookie.getName(); // setName은 안되는데 getName은 가능 
			
			if(cname.equals("age")){
				cookie.setMaxAge(300); // 만료기간이 세션값이던 쿠키를 300초 후 종료되게 설정
				cookie.setValue("3-7");
				System.out.println("age path: "+cookie.getPath());
				
				// 요청으로 전달받은 쿠키에는 path정보가 없다 (경로 직접설정)
				//예전에 사용한 path를 그대로 사용하는 것은 불가능 하다
				response.addCookie(cookie); // 응답에 실어야만 수정사항이 반영된다.
				
			} else if (cname.equals("fav")){
				// 정확하게 같은 쿠키를 사용하기 위해서는 name뿐 아니라 path값도 동일하게 일치시켜야 한다.
				// path값이 다르면 다른 쿠키로 인식한다.
				cookie.setMaxAge(-1); // maxAge 값을 음수로 바꾸면 해당 쿠키를 세션으로 설정하는 것
				cookie.setPath("/chap09");
				response.addCookie(cookie);
			}
			
		}
	}
	
	response.sendRedirect(request.getContextPath() + "/cookie/index.jsp");
%>