package chap07.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			  try { Class.forName("oracle.jdbc.OracleDriver"); 
			  } catch (ClassNotFoundException e) { 
			  		e.printStackTrace();
			   }
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

		    try (Connection conn = connectDatabase()) {
		        if (beanName != null && countryId != null && coffeeTaste != null) {
		            int beanSeqId;

		            String beanIdStr = req.getParameter("beanId");
		            
		            System.out.println("beanId: " + beanIdStr);

		            if (beanIdStr != null && !beanIdStr.isEmpty()) {
		                try {
		                    beanSeqId = Integer.parseInt(beanIdStr);
		                    
		                    // bean_id가 제공될 때
		                    try (PreparedStatement pstmt = conn.prepareStatement(
		                            "INSERT INTO coffeebeans(bean_id, bean_name, country_id, coffee_taste) VALUES(?,?,?,?)")) {
		                        pstmt.setInt(1, beanSeqId);
		                        pstmt.setString(2, beanName);
		                        pstmt.setString(3, countryId);
		                        pstmt.setString(4, coffeeTaste);

		                        int rowsAffected = pstmt.executeUpdate();
		                        System.out.println("Rows: " + rowsAffected);
		                    } catch (SQLException e) {
		                        e.printStackTrace();
		                        req.setAttribute("error", "데이터 추가 중 오류 발생");
		                        req.getRequestDispatcher("/WEB-INF/views/dbtest/coffeeAdd.jsp").forward(req, res);
		                        return;
		                    }
		                    
		                } catch (NumberFormatException e) {
		                    req.setAttribute("error", "잘못된 형식의 bean_id");
		                    req.getRequestDispatcher("/WEB-INF/views/dbtest/coffeeAdd.jsp").forward(req, res);
		                    return;
		                }
		            } else {
		            	  // bean_id가 제공되지 않으면 시퀀스를 사용하여 생성
		                try (PreparedStatement pstmt = conn.prepareStatement(
		                        "INSERT INTO coffeebeans(bean_id, bean_name, country_id, coffee_taste) VALUES(coffeebeans_id_seq.NEXTVAL,?,?,?)",
		                        new String[]{"bean_id"})) {

		                    pstmt.setString(1, beanName);
		                    pstmt.setString(2, countryId);
		                    pstmt.setString(3, coffeeTaste);

		                    int rowsAffected = pstmt.executeUpdate();
		                    System.out.println("Rows: " + rowsAffected);

		                    try (ResultSet generatedBeanId = pstmt.getGeneratedKeys()) {
		                        if (generatedBeanId.next()) {
		                            beanSeqId = generatedBeanId.getInt(1);
		                        } else {
		                            throw new SQLException("Bean_id가 잘못되었습니다.");
		                        }
		                    }
		                } catch (SQLException e) {
		                    e.printStackTrace();
		                    req.setAttribute("error", "데이터 추가 중 오류 발생");
		                    req.getRequestDispatcher("/WEB-INF/views/dbtest/coffeeAdd.jsp").forward(req, res);
		                    return;
		                }
		            }

		            // 추가된 후
		            List<CoffeeBeansDTO> coffeebeansList = new ArrayList<>();
		            coffeebeansList.add(new CoffeeBeansDTO(beanSeqId, beanName, countryId, coffeeTaste));
		            req.getSession().setAttribute("addBeans", coffeebeansList);

					req.getRequestDispatcher("/WEB-INF/views/dbtest/coffeeAdd.jsp").forward(req, res);


		        } else {
		            // 데이터가 null이면 에러 메시지를 추가하고 다시 /WEB-INF/views/dbtest/coffeeAddTable.jsp로 포워딩
		            req.setAttribute("error", "모든 필드를 입력해주세요.");
		            req.getRequestDispatcher("/WEB-INF/views/dbtest/coffeeAdd.jsp").forward(req, res);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		}else if (cmd.equals("/dbtest/remove")) {
		    String beanIdStr = req.getParameter("beanId");

		    // beanIdStr이 null 또는 빈 문자열인지 확인
		    if (beanIdStr != null && !beanIdStr.isEmpty()) {
		        try {
		            Integer beanId = Integer.parseInt(beanIdStr);

		            try (Connection conn = connectDatabase();
		                 PreparedStatement pstmt = conn.prepareStatement(
		                         "DELETE FROM coffeebeans WHERE bean_id = ?")) {

		                pstmt.setInt(1, beanId);

		                int rowsAffected = pstmt.executeUpdate();
		                System.out.println("Rows Deleted: " + rowsAffected);

		                // 삭제 후에 추가적인 처리가 필요하다면 여기에 추가

		            } catch (SQLException e) {
		                e.printStackTrace();
		                req.setAttribute("error", "데이터 삭제 중 오류 발생");
		            }
		        } catch (NumberFormatException e) {
		            e.printStackTrace();
		            req.setAttribute("error", "잘못된 형식의 bean_id");
		        }
		    } else {
		        req.setAttribute("error", "bean_id가 제공되지 않음");
		    }

		    req.getRequestDispatcher("/WEB-INF/views/dbtest/coffeeRemove.jsp").forward(req, res);
		} else if (cmd.equals("/dbtest/update")) {
			String beanIdStr = req.getParameter("beanId");
			String beanName = req.getParameter("beanName");
			String countryId = req.getParameter("countryId");
			String coffeeTaste = req.getParameter("coffeeTaste");
			
			try (Connection conn = connectDatabase()){
				if(beanIdStr != null && !beanIdStr.isEmpty()) {
					try {
						int beanId = Integer.parseInt(beanIdStr);
						String updateQuery = "UPDATE coffeebeans SET bean_name =?,country_id = ?, coffee_taste = ? WHERE bean_id = ?";
						try (PreparedStatement pstmt = conn.prepareStatement(updateQuery)){
							  pstmt.setString(1, beanName);
			                    pstmt.setString(2, countryId);
			                    pstmt.setString(3, coffeeTaste);
			                    pstmt.setInt(4, beanId);
			                    
			                    int rowsAffected = pstmt.executeUpdate();
			                    System.out.println("Rows Updated: " + rowsAffected);
						}
					} catch(NumberFormatException e) {
		                e.printStackTrace();
		                req.setAttribute("error", "잘못된 형식의 bean_id");	
					}
				} else {
					req.setAttribute("error: ", "bean_id 확인");
				}
			} catch (SQLException e) {
				 req.setAttribute("error", "데이터 수정 중 오류 발생");
				e.printStackTrace();
			}
			 req.getRequestDispatcher("/WEB-INF/views/dbtest/coffeeUpdate.jsp").forward(req, res);
			 // 선생님 해설 이렇게 다니면 유지보수가 너무 힘들어짐으로 커멘드들에 있어서 공통점을 빼냐야 한다
			 // 1. 내가 전달 받은 uri를 문자열 형태로 커멘드(cmd)를 입력(전달)받는다.
			 // 2. 해당 uri에 알맞은 처리를 한다 (DB작업 등)
			 // 3. 내가 다음으로 가야할 뷰 페이지로 포워드 하거나 리다이렉트한다 
			 // -> chap07.Controller -> 인터페이스로 Controller.java 생성 하였는데 좀 더 추상화 하기 위해 다시 지움 ㅇㅅㅇ
			 // 저 3가지의 작업을 인터페이스로 구현해놓으면 유지보수가 편할 수 있다~ => 최종 webprocess 패키지, 인터페이스 생성
			 
			 // if문을 사용할 때의 문제점 - 끝도 없이 소스코드가 길어짐, 유지보수 어려움
			 // 엄청나게 늘어날 수 있는 if문은 제거해야한다.. if문을 없애는 방법을 강구해야한다.
			 // => 인터페이스와 Map을 활용 ( if문~ 활용까지를 하나의 커맨드패턴/디자인패턴 이라고 할 수 있다 )
		} else if(cmd.equals("/bread/dbtest/bread/list")) {
			
			req.getRequestDispatcher("/WEB-INF/views/bread/list.jsp").forward(req, res);
		}

	}

}
