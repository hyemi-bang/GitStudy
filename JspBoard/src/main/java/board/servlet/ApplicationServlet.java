package board.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.*;  //서비스에 있는 모든걸 참조하겠다

public class ApplicationServlet extends HttpServlet {

	static Map<String, Service> uriMapping = new HashMap<>(); // URI와 해당 URI에 대한 서비스 클래스의 매핑을 관리
	static String REDIRECT_PREFIX = "redirect::";
	static int REDIRECT_PREFIX_LEN = REDIRECT_PREFIX.length();

	@Override
	public void init() throws ServletException {

		uriMapping.put("GET:/", BoardListService.getInstance());
		uriMapping.put("GET:/list", BoardListService.getInstance());
								//new BoardListService 이걸 두 개 해줄 필요가 없다
		uriMapping.put("GET:/write", new BoardWriteFormService());
		uriMapping.put("POST:/write", BoardWriteService.getInstance());
		uriMapping.put("GET:/detail", new BoardDetailService());
		uriMapping.put("GET:/modify", new BoardModifyFormService());
		uriMapping.put("POST:/modify", new BoardModifyService());
		uriMapping.put("POST:/delete", new BoardDeleteService());
		uriMapping.put("GET:/delete/open", new DeletePopupService());
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("EUC-KR");

		 // 현재 요청의 메서드와 URI를 조합하여 명령(cmd)생성
		String cmd = req.getMethod() + ":" + req.getRequestURI().substring(req.getContextPath().length());
		// 매핑된 명령(cmd)에 대응하는 서비스 클래스를 가져와서 해당 서비스를 실행하고, 다음 뷰(nextView)를 받는다
		String nextView = uriMapping.get(cmd).service(req, resp);
		System.out.println(nextView);

		if (nextView.startsWith(REDIRECT_PREFIX)) {
			resp.sendRedirect(req.getContextPath() + nextView.substring(REDIRECT_PREFIX_LEN));
		} else {
			req.getRequestDispatcher(nextView).forward(req, resp);
		}
	}

}
