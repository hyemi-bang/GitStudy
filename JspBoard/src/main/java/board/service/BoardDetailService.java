package board.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import board.dto.BoardDTO;

public class BoardDetailService implements Service {

	BoardDAO dao = new BoardDAO();

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
			int row = dao.plusView(board_id);
			response.addCookie(new Cookie("" + board_id, "1"));

			// row < 1 이라는건 PK가 없다는 뜻
			if (row < 1) {
				return "/WEB-INF/views/board/detailNotFound.jsp";
			}
		}

		BoardDTO detail = dao.get(board_id);

		if (detail != null) {
			request.setAttribute("detail", detail);
			return "/WEB-INF/views/board/detail.jsp";
		} else {
			return "/WEB-INF/views/board/detailNotFound.jsp";
		}

	}
}
