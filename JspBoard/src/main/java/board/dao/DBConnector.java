package board.dao;

import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

public class DBConnector {
	// connection을 할 때 dbconnector를 10개 만들어놓는다 계속 사용됨을 방지 하기 위함
	// 커넥션 풀 만들기
	private static Set<DBSession> sessions = new HashSet<>();
	
	static {
		try { 
			 Class.forName("oracle.jdbc.driver.OracleDriver"); 
		  } catch (ClassNotFoundException e) { 
		  		e.printStackTrace();
		   }
		
		for(int i =0; i <10; ++i) {
			sessions.add(new DBSession());
		}
	}
	
	public static DBSession getSession() throws SQLException {
		while(true) {
			for(DBSession session : sessions) {
				if(!session.using) {
					session.using = true;// 해당 DB세션을 사용중으로 변경한다. 연결을 끊지 않고 사용한다는것
					return session; //모두 사용중이면 계속 반복이 될 것이다
				}
			}
			// 만약 11번째사람이 생긴다면 대기를 하고 있을것이다..
			// 모든 DB들이 사용중일때 현재 의 최대치를 늘려준다던지..
		}
	}
	

}
