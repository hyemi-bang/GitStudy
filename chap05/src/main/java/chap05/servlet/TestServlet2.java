package chap05.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 1.chap05.servlet 패키지 > New > Servlet선택
 2.클래스 이름 설정 (TestServlet2)
 3.URL mappint 이름을 선택 > Edit > (/TestServlet2 -> /test2 수정)
 4.서블릿 매핑 이름 수정 하고 ok
 5.Constructors form superclass 옵션 체크박스 해제 
 6. 오버라이딩할 생명주기 메서드 추가 ( 기본값 선택된 상태에서init,destory, doGet, doPost 체크함)
 */


/**
 * Servlet implementation class TestServlet2
 */
@WebServlet("/test2")
public class TestServlet2 extends HttpServlet {
	//private static final long serialVersionUID = 1L; 
		// 서블릿 클래스에서 직렬화를 위해 이클립스에서 자동으로 지정한 상수.
       

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("TestSerVlet2 init메서드 호출");
	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("TestSerVlet2 destory메서드 호출");
	}
}
