package chap08.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import chap08.dto.EmployeeDTO;

public class EmployeeDAO {
    public List<EmployeeDTO> searchEmployees(String searchField, String searchQuery) {
        String sql = "";

        switch (searchField) {
            case "first_name":
                sql = "SELECT e.* FROM employees e LEFT JOIN departments d ON e.department_id = d.department_id WHERE e.first_name = ?";
                break;
            case "last_name":
                sql = "SELECT e.* FROM employees e LEFT JOIN departments d ON e.department_id = d.department_id WHERE e.last_name = ?";
                break;
            case "department_name":
                sql = "SELECT e.* FROM employees e INNER JOIN departments d ON d.department_id = e.department_id WHERE d.department_name = ?";
                break;
            default:
                return new ArrayList<>();
                //검색 필드가 어느 것에도 매치되지 않을 경우 빈 리스트를 반환
        }

        List<EmployeeDTO> employees = new ArrayList<>();

        try (Connection conn = DBConnector.getConnetion();
             PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setString(1, searchQuery);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                employees.add(new EmployeeDTO(
                        rs.getInt("employee_id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getDouble("salary"),
                        rs.getDouble("commission_pct"),
                        rs.getDate("hire_date"),
                        rs.getString("job_id"),
                        rs.getInt("manager_id"),
                        rs.getInt("department_id"),
                        rs.getString("department_name")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        if(employees.isEmpty()) {
        	System.out.println("검색 결과가 없습니다. 입력한 검색어 확인요망.");
        }

        return employees;
    }
}