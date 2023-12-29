package chap07.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap07.dto.CoffeeBeansDTO;
import chap07.dto.EmployeeDTO;
import chap07.util.UriParser;

public class ApplicationServlet extends HttpServlet {


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		String cmd = UriParser.getCmd(req); 
		// 커멘드가 무엇인가에 따라서 처리를 다르게한다
		
		if(cmd.equals("/")) {
			req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, res);
		} else if(cmd.equals("/dbtest/list")) {
			// DB 에서 값을 꺼낸 후
			try {				
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch(ClassNotFoundException e){
				e.printStackTrace();
			}
			
			try(Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","hr", "1234");
					PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM employees");
					ResultSet rs = pstmt.executeQuery();
				) {
				//dto : 읽기/쓰기 가능
				//vo : 읽기 전용
				List<EmployeeDTO> employees = new ArrayList<>();
				
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
							rs.getInt("department_id")
							));
				}
				
				//처리 후 어트리뷰트에 데이터 적재
				req.setAttribute("employees", employees);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			// 포워딩한다
			req.getRequestDispatcher("/WEB-INF/views/dbtest/list.jsp").forward(req, res);
		} else if(cmd.equals("/dbtest/table")) {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			try(
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","hr","1234");
				PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM coffeebeans");
				ResultSet rs = pstmt.executeQuery();
				) {
				
				List<CoffeeBeansDTO> coffeebeans = new ArrayList<>();
				
				while(rs.next()) {
					coffeebeans.add(new CoffeeBeansDTO(
							rs.getInt("beans_id"),
							rs.getString("bean_name"),
							rs.getString("country_id"),
							rs.getString("coffee_taste")
							));
				}
				req.setAttribute("coffeebeans", coffeebeans);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			req.getRequestDispatcher("/WEB-INF/views/dbtest/table.jsp").forward(req, res);
		}
	}
}
