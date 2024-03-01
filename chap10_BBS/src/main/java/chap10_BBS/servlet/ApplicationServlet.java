package chap10_BBS.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import chap10_BBS.util.UriParser;
import chap10_BBS.webprocess.WebProcess;

public class ApplicationServlet extends HttpServlet {
	
	// 선생님 해설 이렇게 다니면 유지보수가 너무 힘들어짐으로 커멘드들에 있어서 공통점을 빼냐야 한다
	 // 1. 내가 전달 받은 uri를 문자열 형태로 커멘드(cmd)를 입력(전달)받는다.
	 // 2. 해당 uri에 알맞은 처리를 한다 (DB작업 등)
	 // 3. 내가 다음으로 가야할 뷰 페이지로 포워드 하거나 리다이렉트한다 
	 // -> chap07.Controller -> 인터페이스로 Controller.java 생성 하였는데 좀 더 추상화 하기 위해 다시 지움 ㅇㅅㅇ
	 // 저 3가지의 작업을 인터페이스로 구현해놓으면 유지보수가 편할 수 있다~ => 최종 webprocess 패키지, 인터페이스 생성
	 
	 // if문을 사용할 때의 문제점 - 끝도 없이 소스코드가 길어짐, 유지보수 어려움
	 // 엄청나게 늘어날 수 있는 if문은 제거해야한다.. if문을 없애는 방법을 강구해야한다.
	 // => 인터페이스와 Map을 활용 ( if문~ 활용까지를 하나의 커맨드패턴/디자인패턴 이라고 할 수 있다 )
	
		/*
		 * static Map<String, WebProcess> uriMapping = new HashMap<>();
		 * 
		 * 
		 * static { //(1) 전달받은 URI(cmd)에 따라 알맞은 웹 프로세스를 꺼내줄 수 있는 맵을 생성해두면 if문 사용 안해도 된다
		 * (커맨드패턴)
		 * 
		 * uriMapping.put("GET::/", new IndexWebProcess());
		 * uriMapping.put("GET::/dbtest/list", new dbTestWebProcess());
		 * uriMapping.put("GET::/dbtest/bread/list", new BreadListWebProcess());
		 * uriMapping.put("GET::/dbtest/bread/add", new BreadAddFormWebProcess());
		 * uriMapping.put("POST::/dbtest/bread/add", new BreadAddWebProcess()); //
		 * add파일에서 빵을 추가한 후 계속 그 파일에 있기 위해서 form action=./add로 놓는다면 // UriParser클래스에서 내
		 * 방식만의 커멘드를 만들어준다 uriMapping.put("GET::/dbtest/bread/delete", new
		 * BreadRemoveFormWebProcess()); uriMapping.put("POST::/dbtest/bread/delete",
		 * new BreadRemoveWebProcess()); uriMapping.put("GET::/dbtest/bread/update", new
		 * BreadUpdateFormWebProcess()); uriMapping.put("POST::/dbtest/bread/update",
		 * new BreadUpdateWebProcess()); }
		 * 
		 * @Override protected void service(HttpServletRequest req, HttpServletResponse
		 * resp) throws ServletException, IOException { System.out.println("method:" +
		 * req.getMethod()); String cmd = UriParser.getCmd(req); // 커멘드가 무엇인가에 따라서 처리를
		 * 다르게한다
		 * 
		 * WebProcess webProcess = uriMapping.get(cmd); if (webProcess != null) { String
		 * nextPage = webProcess.process(req);
		 * 
		 * if (nextPage != null && nextPage.startsWith("redirect::")) {
		 * resp.sendRedirect(nextPage.substring("redirect::".length())); } else {
		 * 
		 * req.getRequestDispatcher(nextPage).forward(req, resp); } } else {
		 * req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp); }
		 */
		
	}