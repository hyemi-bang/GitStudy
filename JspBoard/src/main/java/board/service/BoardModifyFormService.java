package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import board.dto.BoardDTO;

public class BoardModifyFormService implements Service {
	BoardDAO dao = new BoardDAO();

	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {
		try {
			int board_id = Integer.parseInt(request.getParameter("board_id"));

			BoardDTO oldData = dao.get(board_id);

			if (oldData != null) {
				request.setAttribute("oldData", oldData);
				return "/WEB-INF/views/board/modifyForm.jsp";
			} else {
				return "redirect::/";
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "redirect::/";
		}
	}
}
