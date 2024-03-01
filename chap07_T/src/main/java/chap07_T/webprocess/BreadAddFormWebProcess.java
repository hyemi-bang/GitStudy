package chap07_T.webprocess;

import javax.servlet.http.HttpServletRequest;

public class BreadAddFormWebProcess implements WebProcess {

	@Override
	public String process(HttpServletRequest request) {
		 return "/WEB-INF/views/bread/insertForm.jsp";
	}

}
