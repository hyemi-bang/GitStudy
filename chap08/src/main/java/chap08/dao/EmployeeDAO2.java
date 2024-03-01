package chap08.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import chap08.dto.EmployeeDTO2;

public class EmployeeDAO2 {

	public List<EmployeeDTO2> search(String type, String query) {
		List<EmployeeDTO2> emps = new ArrayList<>();

		String sql = "SELECT employee_id,first_name,last_name,salary,hire_date,department_name "
				+ "FROM employees e, departments d WHERE e.department_id= d.department_id AND lower(" + type
				+ ") LIKE ?";

		// System.out.println(sql);

		try (
			Connection conn = DBConnector.getConnetion(); 
			PreparedStatement pstmt = conn.prepareStatement(sql);
		) {
			pstmt.setString(1, "%" + query.toLowerCase() + "%");
			
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					//System.out.println(rs.getString("first_name"));
					emps.add(new EmployeeDTO2(
							rs.getInt("employee_id"),
							rs.getString("first_name"),
							rs.getString("last_name"),
							rs.getDouble("salary"),
							rs.getDate("hire_date"),
							rs.getString("department_name")));
				}	
			}
			return emps;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}