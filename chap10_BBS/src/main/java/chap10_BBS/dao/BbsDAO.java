package chap10_BBS.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import chap10_BBS.dto.BbsDTO;

public class BbsDAO {

	private Connection conn;
	private ResultSet rs;

	public BbsDAO() {

		try {
			conn = DBConnector.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// 게시판 글쓰기
	public String getDate() {
		String sql = "SELECT to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') FROM dual";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스오류
	}

	public int getNext() {
		String sql = "SELECT bbsID FROM bbs ORDER BY bbsID DESC";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				return rs.getInt(1) + 1;
			}
			return 1; // 첫번째 게시물
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스오류
	}

	public int write(String bbsTitle, String userID, String bbsContent) {

		String sql = "INSERT INTO bbs VALUES (?, ?, ?, TO_DATE(?, 'YYYY/MM/DD HH24:MI:SS'), ?, ?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스오류
	}

	public ArrayList<BbsDTO> getList(int pageNums) {
		String sql = "SELECT * FROM (SELECT * FROM bbs WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC) WHERE ROWNUM <= ?";
		ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNums - 1) * 10);
			pstmt.setInt(2, getNext() - (pageNums - 1) * 10 + 10);
			// getNext 다음으로 작성된 글 번호가 4번이면 4-(1-1) *10 -> 해야 1~4번까지 다 나오니까
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BbsDTO bbs = new BbsDTO();

				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; // 게시글 목록을 list에 담아서 반환
	}

	public boolean nextPage(int pageNums) {
		// 페이징처리하기
		String sql = "SELECT * FROM bbs WHERE bbsID < ? AND bbsAvailable = 1";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNums - 1) * 10);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; // 
	}
	
	public BbsDTO getBbs(int bbsID) {
		String sql = "SELECT * FROM bbs WHERE bbsID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bbsID);			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				BbsDTO bbs = new BbsDTO();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; // 
	}

}
