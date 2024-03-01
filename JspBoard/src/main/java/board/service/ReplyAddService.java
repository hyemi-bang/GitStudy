package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.ReplyDAO;
import board.dto.ReplyDTO;

public class ReplyAddService implements Service {
	
	ReplyDAO replyDAO = new ReplyDAO();

	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {
		try {
			int board_id = Integer.parseInt(request.getParameter("board_id"));
			
			ReplyDTO dto = new ReplyDTO();
			
			dto.setBoard_id(board_id);
			dto.setReply_content(request.getParameter("reply_content"));
			dto.setReply_password(request.getParameter("reply_password"));
			dto.setReply_writer(request.getParameter("reply_writer"));
			
			replyDAO.add(dto);
			
			return "redirect::/detail?board_id=" + board_id; // 댓글을 달고 나면은 디테일로 돌아간다
			
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect::/";
		}
	}

}
