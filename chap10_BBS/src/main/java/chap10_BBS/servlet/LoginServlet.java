package chap10_BBS.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap10_BBS.dao.UserDAO;

//@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		// 이미 로그인된 상태라면 게시판 페이지로 바로 이동
        if (req.getSession().getAttribute("info") != null) {
            resp.sendRedirect("/chap10_BBS/main.jsp");
            return;
        }
        
        // userDAO 클래스를 사용하여 로그인 로직을 구현 
        String userID = req.getParameter("userID");
        String userPassword = req.getParameter("userPassword");

        if (userID != null && userPassword != null && !userID.isEmpty() && !userPassword.isEmpty()) {
            UserDAO userDAO = new UserDAO();
            int result = userDAO.login(userID, userPassword);

            if (result == 1) { // 로그인 성공시
            	resp.sendRedirect("/chap10_BBS/main.jsp");
            } else if (result == 0) { // 비밀번호가 틀린 경우
            	resp.sendRedirect("/chap10_BBS/login.jsp?error=password");
            } else if (result == -1) {
            	resp.sendRedirect("/chap10_BBS/login.jsp?error=notexist");
            } else if (result == -2) {
            	resp.sendRedirect("/chap10_BBS/login.jsp?error=database");
            }
        }
    }
}