package chap07_T.webprocess;

import javax.servlet.http.HttpServletRequest;

public interface WebProcess {
	
	// 리턴 String, 매개변수로 request만 전달한다
	String process(HttpServletRequest request);

}
