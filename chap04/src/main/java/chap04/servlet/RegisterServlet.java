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

@WebServlet("/quiz2/register")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//서블릿에서 application 영역 사용하기
		ServletContext application = req.getServletContext();
		//서블릿에서 session영역 사용하기
		//req.getSession();
		//서블릿에서는 page영역을 사용할 수 없다. (jsp에만 있는 부분이라 사용 불가)
		
		//파라미터는 웹에서 만들어져 오는 값임으로 무조건 String으로 반환된다.
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		//파라미터의 값이 빈 값인지 검증할때 null뿐만 아니라 빈 문자도 체크해야한다
		if(id == null || pwd == null || id.equals("") || pwd.equals("")) {
			resp.sendRedirect("/chap04/quiz2/index.jsp?error=1");
			return;
		}
		
		//ID가 있는지 체크
		if(application.equals(id)) {
			//회원 등록을 하는 곳이라 같은 값이 있을때는
			resp.sendRedirect("/chap04/quiz2/index.jsp?error=1&dup=1");
			return;
		}
		
		//비밀번호 정규표현식으로 검증하기~
		//무엇이 포함되어야하는지 추가하기
		
		//id => application 객체 등록 (원래는 DB에 넣어야한다)
		//application.setAttribute(id, pwd);
		Map<String, Object> infoMap = new HashMap<>();
		
		infoMap.put("pwd", pwd);
		
		application.setAttribute(id, infoMap); // id를 통해 여러정보를 꺼내고 싶음으로 pwd -> Map을 사용한다
		resp.sendRedirect("/chap04/quiz2/index.jsp");
		
	}
}
