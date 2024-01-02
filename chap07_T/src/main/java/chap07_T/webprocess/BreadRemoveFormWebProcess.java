package chap07_T.webprocess;

import javax.servlet.http.HttpServletRequest;

public class BreadRemoveFormWebProcess implements WebProcess{

	@Override
	public String process(HttpServletRequest request) {
		
		return "/WEB-INF/views/bread/deleteForm.jsp";
	}

}
