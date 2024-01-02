package chap07_T.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import chap07_T.dto.BreadDTO;

public class BreadDao {
	
	public List<BreadDTO> getAll(){
		String sql = "SELECT * FROM bread";
		List<BreadDTO> list = new ArrayList<>();
		// BreadDTO 생성필요 -> chap07_t > dto > 가서 생성함
	
		try (Connection conn = DBConnector.getConnetion();
			PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				){
			
			while(rs.next()) {
				list.add(new BreadDTO (
						rs.getString("bread_name"),
						rs.getInt("bread_price")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list; //ㅣist .add  후 리턴~ 
		
	}
	
	public Integer insert(BreadDTO breadDto) {
		// 나중에 테이블이 수정되는 것에 대비해 *같은 요소를 활용하는 것은 바람직하지 않다
		// 모든 컬럼명을 다 적는것이 바람직하다
		String sql="INSERT INTO bread(bread_name,bread_price) VALUES(?,?)";
		
		try(
			Connection conn = DBConnector.getConnetion();
			PreparedStatement pstmt = conn.prepareStatement(sql);
		){
			pstmt.setString(1, breadDto.getBread_name());
			pstmt.setInt(2, breadDto.getBread_price());
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public Integer delete(BreadDTO breadDto) {
	    String sql = "DELETE FROM bread WHERE bread_name = ?";

	    try (
	        Connection conn = DBConnector.getConnetion();
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	    ) {
	        pstmt.setString(1, breadDto.getBread_name());
	        return pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	
	public Integer update(BreadDTO breadDto) {
	    String sql = "UPDATE bread SET bread_price = ? WHERE bread_name = ?";

	    try (
	        Connection conn = DBConnector.getConnetion();
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	    ) {
	        pstmt.setInt(1, breadDto.getBread_price());
	        pstmt.setString(2, breadDto.getBread_name());

	        return pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return null;
	    }
	}

}
