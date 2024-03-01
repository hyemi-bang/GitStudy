package board.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import board.dao.ReplyDAO;
import board.dto.BoardDTO;

public class BoardDetailService implements Service {

	BoardDAO boardDAO = new BoardDAO();
	ReplyDAO replyDAO = new ReplyDAO();
	// 하나의 함수에 여러 기능을 덕지덕지 붙여버리면 그 하나의 기능을 보고 싶어도 볼 수 없으니
	//구분을 잘 지어둬야 한다.

	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {

		int board_id = Integer.parseInt(request.getParameter("board_id"));

		Cookie[] cookies = request.getCookies();
		boolean exist = false;

		// 글 번호와 같은 이름을 지닌 쿠키가 존재하는지 여부를 체크
		// 해당 쿠키가 존재(plused 가 true)하면 조회수는 증가하지 않음
		if (cookies != null) {
			for (Cookie cookie : request.getCookies()) {
				if (cookie.getName().equals("" + board_id)) {
					// 존재함
					exist = true;
				}
			}
		}

		// 글 번호와 같은 이름이 쿠키가 조회된 적이 없다면 조회수를 증가시키고 쿠키를 만듬
		// 존재하지 않는다면
		if (!exist) {
			int row = boardDAO.plusView(board_id);
			response.addCookie(new Cookie("" + board_id, "1"));

			// row < 1 이라는건 PK가 없다는 뜻
			if (row < 1) {
				return "/WEB-INF/views/board/detailNotFound.jsp";
			}
		}

		BoardDTO detail = boardDAO.get(board_id);

		if (detail != null) {
			request.setAttribute("detail", detail);
			request.setAttribute("replies", replyDAO.getBoardReplies(board_id));
			return "/WEB-INF/views/board/detail.jsp";
		} else {
			return "/WEB-INF/views/board/detailNotFound.jsp";
		}

	}
}
