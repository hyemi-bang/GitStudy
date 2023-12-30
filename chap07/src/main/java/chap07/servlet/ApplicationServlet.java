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

	private Connection connectDatabase() throws SQLException {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "hr", "1234");
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String cmd = UriParser.getCmd(req);
		// 커멘드가 무엇인가에 따라서 처리를 다르게한다

		if (cmd.equals("/")) {
			req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, res);
		} else if (cmd.equals("/dbtest/list")) {
			// DB 에서 값을 꺼낸 후
			/*
			 * try { Class.forName("oracle.jdbc.OracleDriver"); } catch
			 * (ClassNotFoundException e) { e.printStackTrace(); }
			 */

			try (Connection conn = connectDatabase();
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
				req.setAttribute("employees", employees);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			// 포워딩한다
			req.getRequestDispatcher("/WEB-INF/views/dbtest/list.jsp").forward(req, res);
		} else if (cmd.equals("/dbtest/coffeeTable")) {

			try (Connection conn = connectDatabase();
					PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM coffeebeans ORDER BY bean_id");
					ResultSet rs = pstmt.executeQuery();) {

				List<CoffeeBeansDTO> coffeebeans = new ArrayList<>();

				while (rs.next()) {
					coffeebeans.add(new CoffeeBeansDTO(rs.getInt("bean_id"), rs.getString("bean_name"),
							rs.getString("country_id"), rs.getString("coffee_taste")));
				}
				req.setAttribute("coffeebeans", coffeebeans);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			req.getRequestDispatcher("/WEB-INF/views/dbtest/coffeeTable.jsp").forward(req, res);

		} else if (cmd.equals("/dbtest/add")) {
			String beanName = req.getParameter("beanName");
			String countryId = req.getParameter("countryId");
			String coffeeTaste = req.getParameter("coffeeTaste");

			System.out.println("beanName: " + beanName);
			System.out.println("countryId: " + countryId);
			System.out.println("coffeeTaste: " + coffeeTaste);

			if (beanName != null && countryId != null && coffeeTaste != null) {
				try (Connection conn = connectDatabase();
						PreparedStatement pstmt = conn.prepareStatement(
								"INSERT INTO coffeebeans(bean_id, bean_name, country_id, coffee_taste) VALUES(coffeebeans_id_seq.NEXTVAL,?,?,?)",
								new String[] { "bean_id" })) {

					pstmt.setString(1, beanName);
					pstmt.setString(2, countryId);
					pstmt.setString(3, coffeeTaste);

					int rowsAffected = pstmt.executeUpdate();
					System.out.println("Rows: " + rowsAffected);

					int beanSeqId;
					try (ResultSet generatedBeanId = pstmt.getGeneratedKeys()) {
						if (generatedBeanId.next()) {
							beanSeqId = generatedBeanId.getInt(1);
						} else {
							throw new SQLException("Bean_id가 잘못되었습니다.");
						}
					}

					// 추가된 후
					List<CoffeeBeansDTO> coffeebeansList = new ArrayList<>();
					coffeebeansList.add(new CoffeeBeansDTO(beanSeqId, beanName, countryId, coffeeTaste));
					req.getSession().setAttribute("addBeans", coffeebeansList);

					req.getRequestDispatcher("/WEB-INF/views/dbtest/coffeeAdd.jsp").forward(req, res);
					
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} else {
				// 데이터가 null이면 에러 메시지를 추가하고 다시 /WEB-INF/views/dbtest/coffeeAddTable.jsp로 포워딩
				req.setAttribute("error", "모든 필드를 입력해주세요.");
				req.getRequestDispatcher("/WEB-INF/views/dbtest/coffeeAdd.jsp").forward(req, res);
			}

		}
	}

}
