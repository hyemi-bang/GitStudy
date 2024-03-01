package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Service {
	/*
	서비스 클래스는 주로 비즈니스 로직을 처리하고, 웹 애플리케이션에서 특정 기능을 수행하는 역할
	 MVC (Model-View-Controller) 아키텍처에서 모델(Model)의 역할을 수행하며 인터페이스와 데이터베이스 간의 중간 계층으로 작동
	*/
	String service(HttpServletRequest request, HttpServletResponse response);

}
