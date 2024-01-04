package chap09.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cookie/delete")
public class DeleteCookieServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		Cookie[] cookies = req.getCookies();
		String contextPath = req.getContextPath();
		
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("age")) { // 이름이 age인 쿠키들을 삭제할 때
					cookie.setPath(contextPath + "/cookie"); // path()도 같아야하니까 추가해주기
					cookie.setMaxAge(0); // 0으로 바꾸고
					resp.addCookie(cookie);
				} else if(cookie.getName().equals("fav")) {
					cookie.setMaxAge(0);
					cookie.setPath(contextPath);
					resp.addCookie(cookie);
				}
			}
		}
		
		resp.sendRedirect(contextPath + "/cookie/index.jsp");
		
	}
}
