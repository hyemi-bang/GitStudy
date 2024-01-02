package chap07_T.webprocess;

import javax.servlet.http.HttpServletRequest;

public class IndexWebProcess implements WebProcess{

	@Override
	public String process(HttpServletRequest request) {
		// (1) 과정은 어플리케이션 서블렛에 있다 
		// (2) 처리가 있으면 하고
		
		// (3) 처리가 끝난 후 다음으로 포워드 해야하는 뷰 페이지를 반환
		return "/WEB-INF/views/index.jsp";
	}
	
	

}
