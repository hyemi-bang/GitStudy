package board.dao;

import java.io.Closeable;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

// 커넥션,불리언 두 객체를 보관하고 있는 클래스
// Closeable 인터페이스를 구현한 클래스는 try()사용할 수 있다.
public class DBSession implements Closeable {
	// 커넥션객체
	Connection conn;
	// 불리언타입 (사용중이다, 사용중이 아니다)
	boolean using = false;

	public DBSession() {
		try {
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:XE", 
					"testuser", "1234");
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
	
	public PreparedStatement prepareStatement(String sql) throws SQLException {
		return conn.prepareStatement(sql);
	}

	@Override
	// 클로우즈는 커넥션을 받는게 아니라 유징을 false로 바꿔 (사용중이지 않다)
	public void close() throws IOException {
		using = false;
		
	}

}
