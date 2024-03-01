package chap01.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//chap01/gugudan으로 접속하는 사용자에게 멋있는 구구단 페이지를 응답하는 서블릿을 만들어보세요

@WebServlet("/gugudan")
public class GugudanServlet extends HttpServlet {

	private void gugudan(PrintWriter out) {
		for (int step = 2; step <= 9; ++step) {
			out.print("<h2 id=\"maincolor\">"  + step + "dan" + "</h2>");
			for (int mul = 1; mul <= 9; ++mul) {
				out.print("<div id=\"servecolor\">"+step + " X " + mul + " = " + (step * mul) + "<br>"+"</div>");
			}
		}


	}
	

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {

		PrintWriter out = resp.getWriter();

		out.print("<html>");
		out.print("<head>");
		out.print("<title>Gugudan Page</title>");
		out.print("<style>");
		out.print("#maincolor { background-color: seagreen; color: white; width: 180px; margin: 15px; text-align: center;}");
		out.print("#servecolor { background-color: cornsilk; color: black; width: 200px;margin: 5px; text-align: center;}");	
		out.print("</style>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h2># Gugudan #</h2>");
		gugudan(out);
		out.print("</body>");
		out.print("</html>");
	}
}
