package chap09.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtils {
	
	//쿠키 제어하기 위해 받아야하는 인스턴스 : request, response
	HttpServletRequest request;
	HttpServletResponse response;
	
	public CookieUtils(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	//쿠키가 존재하는가?
	// 이걸 활용해서 다른데서 불러다 쓸 수 있게 모듈화 해놓기
	public boolean exist(String name) {
		Cookie[] cookies = request.getCookies();
		
		if(cookies == null) {
			return false;
		}
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals(name)) {
				return true;
			}
		}
		return false;
	}
}
