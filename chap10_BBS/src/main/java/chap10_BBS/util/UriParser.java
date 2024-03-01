package chap10_BBS.util;

import javax.servlet.http.HttpServletRequest;

public class UriParser {

	public static String getCmd(HttpServletRequest request) {
		
		return request.getMethod() + "::" 
				+ request.getRequestURI().substring(request.getContextPath().length());
	}
}
