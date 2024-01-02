package chap07_T.webprocess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import chap07_T.dao.DBConnector;
import chap07_T.dto.EmployeeDTO;

public class dbTestWebProcess implements WebProcess {

	@Override
	public String process(HttpServletRequest request) {
		//내가 해야할 작업
		
//		 try { 
//			 Class.forName("oracle.jdbc.driver.OracleDriver"); 
//		  } catch (ClassNotFoundException e) { 
//		  		e.printStackTrace();
//		   }
//		

		try (
			//Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "hr", "1234");
			Connection conn = DBConnector.getConnetion();
			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM employees");
			ResultSet rs = pstmt.executeQuery();) {
			// dto : 읽기/쓰기 가능
			// vo : 읽기 전용
			List<EmployeeDTO> employees = new ArrayList<>();

			while (rs.next()) {
				employees.add(new EmployeeDTO(rs.getInt("employee_id"), rs.getString("first_name"),
						rs.getString("last_name"), rs.getDouble("salary"), rs.getDouble("commission_pct"),
						rs.getDate("hire_date"), rs.getString("job_id"), rs.getInt("manager_id"),
						rs.getInt("department_id")));
			}

			// 처리 후 어트리뷰트에 데이터 적재
			request.setAttribute("employees", employees);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 
		 
		// 다음으로 가야할 주소
		return "/WEB-INF/views/dbtest/list.jsp";
	}

}
