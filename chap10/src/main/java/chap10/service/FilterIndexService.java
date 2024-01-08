package chap10.service;

import javax.servlet.http.HttpServletRequest;

public class FilterIndexService implements Service {

	// 싱글톤 디자인 패턴
	private static FilterIndexService instance = new FilterIndexService();
	/*
	내가 만들어놓은 new FilterIndexService(); 이것만 가져다 사용해라 하는 의미임
	private 해놓으면 외부에서 가져다 사용할 수 없음으로 FilterIndexService() 클래스에서 추가 작업을 한다
	*/ 
	
	// 이 클래스의 인스턴스가 프로그램에서 단 하나밖에 생성되지 않도록 하는 패턴
	
	public static FilterIndexService getInstance() {
		return instance;
	}
	
	//외부에서 이 클래스를 무단으로 생성하는 것을 방지하기 위함
	private FilterIndexService() {}
	
	@Override
	public String service(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return "/WEB-INF/views/filter/index.jsp";
	}
}
