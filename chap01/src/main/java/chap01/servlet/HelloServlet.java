package chap01.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//JSP가 1차로 변환되는 형태

// @WebServlet(URI) : 이 서블릿으로 접속할때 사용할 URI를 설정한다
@WebServlet("/Hello")
public class HelloServlet extends HttpServlet{
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		//HttpServletRequest : 클라이언트 측에서 보낸 요청 정보가 담겨있는 객체 
		//HttpServletResponse : 요청에 대한 모든 처리가 끝난 후 요청을 보냈던 상대에게 응답하는 객체

		//JSP에서 <% %> 부분
		PrintWriter out = resp.getWriter();
		
		out.print("<html>");
		out.print("<head><title>Hello Servlet!</title></head>");
		out.print("<body>");
		out.print("<h3>Hello, Servlet!</h3>");
		out.print("</body>");
	}
}
