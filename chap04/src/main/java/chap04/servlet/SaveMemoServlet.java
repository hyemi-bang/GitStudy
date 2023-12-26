package chap04.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/saveMemo")
public class SaveMemoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        String memo = req.getParameter("memo");

        // Save memo logic
        Memo newMemo = new Memo(memo, userId);
        MemoDataManager.addMemo(newMemo);

        // Redirect back to userPage.jsp
        resp.sendRedirect("/chap04/quiz/userPage.jsp");
    }
}
