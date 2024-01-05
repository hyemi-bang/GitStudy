package chap10.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap10.service.FilterIndexService;
import chap10.service.Service;

public class ApplicationServlet extends HttpServlet {
	
	static Map<String, Service> uriMapping = new HashMap<>();
	static String REDIRECT_PREFIX = "redirect::";
	static int REDIRECT_PREFIX_LEN = REDIRECT_PREFIX.length();
	
	@Override
	public void init() throws ServletException {
		//service 초기화 가능
		uriMapping.put("GET:/filter", FilterIndexService.getInstance()); 
		// service라는건 항상 한개만 있으면 된다
		// 하나만 쓰게 하고 더 쓰지 못하기 위해 filterIndexService를 private으로 숨겨버린다.
		// 디자인패턴 -> 
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		//req.setCharacterEncoding("EUC-KR");// 필터를 달아서 사용할 수 있다~ -> CharcterEncodingFilter.java로이동
		String cmd =req.getMethod() + ":" + req.getRequestURI().substring(req.getContextPath().length());
		String nextView = uriMapping.get(cmd).service(req);
	
		if(nextView.startsWith("REDIRECT_PREFIX")) {
			resp.sendRedirect(nextView.substring(REDIRECT_PREFIX_LEN));
		} else {
			req.getRequestDispatcher(nextView).forward(req, resp);
			
		}
	}

	
}
