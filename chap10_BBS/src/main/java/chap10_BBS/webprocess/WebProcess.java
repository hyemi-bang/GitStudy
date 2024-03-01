package chap10_BBS.webprocess;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface WebProcess {
	
	// 리턴 String, 매개변수로 request만 전달한다
	String process(HttpServletRequest request, HttpServletResponse response);

}
