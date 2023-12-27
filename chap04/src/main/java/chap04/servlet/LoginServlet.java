package chap04.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/quiz2/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//JSP 내장객체, 자동으로 만들어져 있는 객체들 (ServletContext, HttpSession 등등)
		ServletContext application = req.getServletContext();
		HttpSession session = req.getSession();
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		//String pwd2 = (String)application.getAttribute(id);
		Map<String, Object> infoMap = (Map)application.getAttribute(id);
		String pwd2 = (String) infoMap.get("pwd");
		
		//ID가 존재하고 해당 ID에 비밀번호를 맞추면 로그인 성공
		if(pwd2 != null && pwd.equals(pwd2)) {
			//Map<String, String> infoMap = new HashMap<>();
			infoMap.put("login", "ok");
			
			//Attribute는 Context내부에서 활용하는 값이기 때문에 모든 자바 객체 타입을 값으로 활용할 수 있다 (String , List, 내가만든회원정보객체 등등)
			session.setAttribute("info", infoMap); 
						//"info" 로그인 한 정보 등 기록하기 위함
						// 1=> 로그인한 사용자에게 환경설정 해주는 것 
						// 유트브 프리미엄 가입자들에게 광고가 안보이도록 "{premium :true, age~~~ 등등 정보를 넣을 수 있음}"
			resp.sendRedirect("/chap04/quiz2/memo/main");
			
		} else {
			//로그인실패
			resp.sendRedirect("/chap04/quiz2/index.jsp?error=1");
			
		}
	}
}
