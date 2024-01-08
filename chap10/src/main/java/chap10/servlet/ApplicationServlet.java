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
		//uriMapping.put("메서드:/주소", 주소로 들어오면 갈 곳);
		/*
		 uriMapping.put("GET:/filter", new FilterIndexService()); 
		 서비스라는 것을 만들어놨는데 계속 사용할 필요가 없기 때문에 (service 라는 건 항상 한개만 있으면 된다)
		 서비스에 대해 잘 모르는 사람이  new FilterIndexService() 여러개 사용하지 못하게 하려고 filterIndexService를 private으로 숨겨버린다.
		 private 해놓으면 외부에서 가져다 사용할 수 없음으로 FilterIndexService() 클래스에서 추가 작업을 한다
		*/
		/*
		FilterIndexService.Instance() = null; 
		uriMapping.put("GET:/filter", FilterIndexService.Instance());
		static 은 한번만 생성되고 수정이 어려운데, 이런식으로 값을 넣으면 안되기 때문에 개터를 달아준것이다
		getInstance()로 사용하려고 함		
		*/
		uriMapping.put("GET:/filter", FilterIndexService.getInstance());
		

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
