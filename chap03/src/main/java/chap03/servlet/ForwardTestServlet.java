package chap03.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/forward/test/*")
public class ForwardTestServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 하나의 서블릿에서 URI를 통해 여러 종류의 요청 처리하는 것도 가능하다
		//System.out.println(req.getRequestURI());
		String uri = req.getRequestURI();
		System.out.println("uri:" + uri);
		
		System.out.println(req.getParameter("firstName"));
		System.out.println(req.getParameter("lastName"));
		// 콘솔에 출력만 하고 아래 RequestDispatcher로 보낸다~
		// resp.getWriter().append() 해서 실어 보낼 수도 있지만, 하지않고 아래 dispatcher로 보낸것
		
		// 다른 서블릿으로 포워딩 (경로: webapp 밑의 경로를 사용)

		if(uri.equals("/chap03/forward/test/1")) {
			
			// RequestDispatcher : 요청을 분배해줄 수 있는 객체
			RequestDispatcher dispatcher = req.getRequestDispatcher("/forward/page1.jsp");
			
			// forward : 응답을 마무리하지 않고 다음 페이지에서 처리를 이어나감
			dispatcher.forward(req, resp);
		} else if (uri.equals("/chap03/forward/test/2")) {
			
			// 상대 클라이언트 (해당 요청을 보낸 클라이언트)에게 "" 주소로 다시 요청 하라고 응답
			// 경로는 클라이언트 입장에서의 URL경로를 사용해야한다
			
			// 새로운 요청을 보내는 것이라 내가 실어보냈던 이름 정보들은 안 따라 간 것이라 null 값이 나온다!
			//resp.sendRedirect("/chap03/forward/page1.jsp");
			
			// 데이터 유지하고 싶을때 강제로 정보 넣는 방법
			// 주소 뒤에 GET 방식 파라미터를 추가하는 것은 가능하지만, POST방식 파라미터 추가는 불가능하다
			resp.sendRedirect("/chap03/forward/page1.jsp?firstName=Smith&lastName=John");
		}
		
	}
}
