package chap10.service;

import javax.servlet.http.HttpServletRequest;

public interface Service {
	
	String service(HttpServletRequest request);
	// 서비스는 uri에 따라 달라진다는 개념으로 만든 것
	// 처리하는 과정을 서비스 라는 용어로 부르기도한다
	// 웹툰 이라는 주소로 들어갔을때 웹툰 목록 (타이틀 /이미지) 뉴스 주소로 들어가면 어떤 장르만 보여주는것 
	// 이런것을 하나의 서비스로 봐야한다. 서비스 처리를 하고 나면 다음으로 갈 뷰가 나온다
	// 웹 프로세스는 추장적인 이미지라면, 서비스는 회사차원의 이야기를 하는 것이라고 봐야한다
	
}
