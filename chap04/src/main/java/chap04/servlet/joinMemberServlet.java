package chap04.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("joinMember")
public class joinMemberServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 회원가입페이지 보여주는 부분

    	resp.setCharacterEncoding("EUC-KR");
        PrintWriter out = resp.getWriter();
        
        out.println("<html>");
        out.println("<head><title>회원가입 페이지</title></head>");
        out.println("<body>");
        out.println("<h2>회원가입 페이지</h2>");
        out.println("<form method=\"post\" action=\"/chap04/joinMember\">");
        out.println("  아이디: <input type=\"text\" name=\"user-id\"><br>");
        out.println("  비밀번호: <input type=\"password\" name=\"user-password\"><br>");
        out.println("  <input type=\"submit\" value=\"가입\">");
        out.println("</form>");
        out.println("</body>");
        out.println("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 아이디 중복체크 및 가입된 정보 application 영역에 등록하는 부분

        String userId = req.getParameter("user-id");
        String userPassword = req.getParameter("user-password");

        if (validateUserId(userId)) {
            User newUser = new User(userId, userPassword);
            UserDataManager.addUser(newUser);

            resp.sendRedirect("/chap04/quiz/index.jsp"); // 가입이 완료된 후 index.jsp로 이동
        } else {
            PrintWriter out = resp.getWriter();
            out.print("<html><body><p>아이디 중복. 다른 아이디를 선택하세요.</p></body></html>");
        }
    }

    private boolean validateUserId(String userId) {
        List<User> registeredUsers = UserDataManager.getRegisteredUsers();
        for (User user : registeredUsers) {
            if (user.getUsername().equals(userId)) {
                return false; // 중복된 아이디가 존재
            }
        }
        return true; // 중복된 아이디가 없음
    }
}
