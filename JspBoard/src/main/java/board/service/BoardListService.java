package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import board.dto.BoardDTO;

public class BoardListService implements Service {

	// 싱글톤 왜 이런 구조인지를 알아야함
	// 싱글톤 사용 이유 중 하나는 메모리/ 데이터공유 / 속도 측면에서의 이점이 있으나 
	// 자식클래스를 만들 수 없고, 내부 상태 변경이 어려운 부분이 존재
	// 도메인 관점에서 인스턴스가 한 개만 존재하는 것을 보증하고 싶을때도 사용한다
	private static BoardListService instance = new BoardListService();

	// 외부에서 인스턴스에 접근할 수 있도록 하는 메서드임
	public static BoardListService getInstance() {
		return instance;
	}

	// 무분별한 객체생성을 막기 위해 사용하기 때문에 생성자는 외부에서 호출못하게 private 으로 지정하여 생성자 사용을 막아버림
	private BoardListService() {}

	BoardDAO dao = new BoardDAO();

	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {

		List<BoardDTO> boards = dao.getList();
		request.setAttribute("boards", boards);
		return "/WEB-INF/views/board/index.jsp";
	}

}
