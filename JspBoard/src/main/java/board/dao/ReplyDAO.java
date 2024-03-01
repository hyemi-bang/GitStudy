package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.dto.ReplyDTO;
import board.secure.SecureTools;

public class ReplyDAO {

	public int add(ReplyDTO dto) {
		String sql = "INSERT INTO myreply(reply_id, board_id, reply_writer, "
				+ "reply_content, reply_password) VALUES(myreply_id_seq.nextval,?,?,?,?)";

		try (DBSession session = DBConnector.getSession();
				PreparedStatement pstmt = session.prepareStatement(sql);) {
			pstmt.setInt(1, dto.getBoard_id());
			pstmt.setString(2, dto.getReply_writer());
			pstmt.setString(3, dto.getReply_content());
			pstmt.setString(4, SecureTools.genHashPassword(dto.getReply_password()));

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List<ReplyDTO> getBoardReplies(int pk) { // 댓글이 여러행이 나오니까 리스트로 받는다
		String sql = "SELECT * FROM myreply WHERE board_id=?";
		List<ReplyDTO> replies = new ArrayList<>();

		try (DBSession session = DBConnector.getSession(); 
			PreparedStatement pstmt = session.prepareStatement(sql);
		) {
			pstmt.setInt(1, pk);
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					ReplyDTO dto = new ReplyDTO();

					dto.setReply_id(rs.getInt("reply_id"));
					dto.setBoard_id(pk);
					dto.setReply_content(rs.getString("reply_content"));
					dto.setReply_writer(rs.getString("reply_writer"));
					dto.setReply_password(rs.getString("reply_password"));
					dto.setReply_date(rs.getDate("reply_date"));

					replies.add(dto);
				}
			}
			return replies;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return replies;
	}
}
