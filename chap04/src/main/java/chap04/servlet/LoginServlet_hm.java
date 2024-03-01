package chap04.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/chap04/login")
public class LoginServlet_hm extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("user-id");
		String userPassword = req.getParameter("user-password");
		
		boolean isValidMember = validateMember(userId, userPassword);
		
		if (isValidMember) {
			// 세션 생성 및 사용자 정보 저장
			HttpSession session = req.getSession(true);
            session.setAttribute("userId", userId);
            
            List<User> registeredUsers = UserDataManager.getRegisteredUsers();
      
            for (User user : registeredUsers) {
                if (user.getUsername().equals(userId) && user.getPassword().equals(userPassword)) {
                    // 로그인 성공 시, 현재 사용자 목록을 ServletContext에 저장
                    storeUsersInServletContext(req.getServletContext(), registeredUsers);
                    // 로그인 성공 시
                    resp.sendRedirect("/chap04/session/userPage.jsp");
                    return;
                }
            }
            
		} else {
			PrintWriter out = resp.getWriter();
			out.print("<html><body><p>로그인 실패. 아이디/비밀번호를 다시 확인하세요.</p></body></html>");
		}
	}
	
	private boolean validateMember(String userId, String userPassword) {
		// 여기서는 간단하게 하드코딩한 예제를 사용, 실제 프로젝트에서는 DB 등을 활용
		return "userId".equals(userId) && "userPassword".equals(userPassword);
	}
	
	private void storeUsersInServletContext(ServletContext servletContext, List<User> users) {
        servletContext.setAttribute("registeredUsers", users);
    }
}
