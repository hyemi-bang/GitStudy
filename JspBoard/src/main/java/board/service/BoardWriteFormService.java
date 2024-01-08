package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardWriteFormService implements Service{
	/*
	Service 인터페이스 구현, 
	HttpServletRequest와 HttpServletResponse를 매개변수로 사용(메서드가 요청 및 응답 객체와 상호 작용할 수 있다.)
	*/
	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {
	
		return "/WEB-INF/views/board/writeForm.jsp";
	}
}
