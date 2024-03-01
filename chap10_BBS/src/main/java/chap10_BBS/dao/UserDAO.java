package chap10_BBS.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import chap10_BBS.dto.UserDTO;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {

		   try {
	            conn = DBConnector.getConnection();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	}
	
	public int login(String userID, String userPassword) {
		String sql="SELECT userPassword FROM userTable WHERE userID = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				} else {
					return 0; // 로그인실패
				}
			}
			return -1; // 아이디가 없음
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	
	public int join(UserDTO user) {
		String sql="INSERT INTO userTable VALUES(?, ?, ?, ?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
		    pstmt.setString(1, user.getUserID());       
	        pstmt.setString(2, user.getUserPassword()); 
	        pstmt.setString(3, user.getUserName());
	        pstmt.setString(4, user.getUserEmail());   
			
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; //DB오류
	}
}