package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.dto.BoardDTO;

public class BoardDAO {

   public int write(BoardDTO dto) {
      String sql = "INSERT INTO myboard(board_id, board_title, board_content, board_password, board_writer) "
            + "VALUES(myboard_id_seq.nextval, ?, ?, ?, ?)";

      try (DBSession session = DBConnector.getSession(); 
  			PreparedStatement pstmt = session.prepareStatement(sql);
    		  /*
    		  PreparedStatement 인터페이스 SQL 쿼리를 실행하기 위한 객체,
    		  사용하면 쿼리를 미리 컴파일하고, 나중에 동일한 쿼리를 여러 번 실행할 때 효율적이다.
    		  conn.prepareStatement(sql)을 통해 pstmt를 생성
    		  (sql) 은 실행할 SQL 쿼리문
    		   */ 
         ) {
         pstmt.setString(1, dto.getBoard_title());
         pstmt.setString(2, dto.getBoard_content());
         pstmt.setString(3, dto.getBoard_password());
         pstmt.setString(4, dto.getBoard_writer());

         return pstmt.executeUpdate();
         /*
         executeUpdate()를 호출하여 INSERT, UPDATE, DELETE 등의 쿼리를 실행하고 영향을 받은 행의 수를 반환
         */

      } catch (Exception e) {
         e.printStackTrace();
         return -1;
      }
   }
   
   public List<BoardDTO> getList() {
      
      String sql = "SELECT board_id,board_title,board_writer,"
            + "view_count,write_date FROM myboard "
            + "ORDER BY board_id DESC";
      
      List<BoardDTO> list = new ArrayList<>();
      
      try (DBSession session = DBConnector.getSession(); 
  			PreparedStatement pstmt = session.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery();
      ) {
         while (rs.next()) {
            BoardDTO dto = new BoardDTO();
            
            dto.setBoard_id(rs.getInt("board_id"));
            dto.setBoard_title(rs.getString("board_title"));
            dto.setBoard_writer(rs.getString("board_writer"));
            dto.setView_count(rs.getInt("view_count"));
            dto.setWrite_date(rs.getDate("write_date"));
            
            list.add(dto);
         }
         return list;
      } catch (Exception e) {
         e.printStackTrace();
         return null;
      }
      
   }
   
   public BoardDTO get(int pk) {
      String sql = "SELECT * FROM myboard WHERE board_id=?";
      
      BoardDTO detail = new BoardDTO();
      
      try (DBSession session = DBConnector.getSession(); 
  			PreparedStatement pstmt = session.prepareStatement(sql);
         ) {
         pstmt.setInt(1, pk);
         
         try (ResultSet rs = pstmt.executeQuery()) {
            rs.next();
            detail.setBoard_id(rs.getInt("board_id"));
            detail.setBoard_title(rs.getString("board_title"));
            detail.setBoard_content(rs.getString("board_content"));
            detail.setBoard_writer(rs.getString("board_writer"));
            detail.setView_count(rs.getInt("view_count"));
            detail.setWrite_date(rs.getDate("write_date"));
            detail.setBoard_password(rs.getString("board_password"));
         } 
         return detail;
      } catch (Exception e) {
         e.printStackTrace();
         return null;
      }
   }
   
   public int plusView(int pk) {
      String sql = "UPDATE myboard SET view_count=view_count+1 "
            + "WHERE board_id=?";
      
      try (DBSession session = DBConnector.getSession(); 
  			PreparedStatement pstmt = session.prepareStatement(sql);
      ) {
         pstmt.setInt(1, pk);
         return pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
         return -1;
      } 
   }
   
   public int modify(BoardDTO dto) {
	   String sql ="UPDATE myboard SET board_title=?,board_content=? WHERE board_id=?";
	   
	  
	try( DBSession session = DBConnector.getSession(); 
			PreparedStatement pstmt = session.prepareStatement(sql);
	) {
		
		pstmt.setString(1, dto.getBoard_title());
		pstmt.setString(2, dto.getBoard_content());
		pstmt.setInt(3, dto.getBoard_id());
		
		return pstmt.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
		return -1;
	}
	  
   }
   
   
   public int delete(int pk) {
	   String sql = "DELETE FROM myboard WHERE board_id = ?";
	   try (DBSession session = DBConnector.getSession(); 
				PreparedStatement pstmt = session.prepareStatement(sql);
		){
		
		   pstmt.setInt(1, pk);
		   return pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
		return -1;
	}
   }
}