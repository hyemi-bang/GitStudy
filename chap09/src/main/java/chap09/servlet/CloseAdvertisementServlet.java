package chap09.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/quiz/close")
public class CloseAdvertisementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Cookie[] cookies = req.getCookies();
        
        boolean showAd = true;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                String cname = cookie.getName();
                if (cname.equals("checkBox")) {
                    String checkBoxValue = cookie.getValue();
                    if ("true".equals(checkBoxValue)) {
                        showAd = false; // 체크박스가 체크된 경우 광고를 보여주지 않음
                        // 쿠키 삭제 로직 추가
                        cookie.setMaxAge(0); // 쿠키 수명을 0으로 설정하여 삭제
                        cookie.setPath("/chap09/quiz");
                        resp.addCookie(cookie); // 응답에 추가하여 클라이언트에게 전달
                    }
                }
            }
        }
        
        if(showAd) {
            // 30초가 지나면 광고 다시 보여야 함
            Cookie cookie = new Cookie("checkBox", "true");
            cookie.setMaxAge(30); // 쿠키의 만료 시간을 30초로 설정
            cookie.setPath("/chap09/quiz");
            resp.addCookie(cookie);
            // 쿠키를 삭제하지 않고 다시 보여줄 때까지의 대기시간 설정
            // setTimeout(() => {
            //     document.getElementById('advertisementPopup').style.display  = "block";
            // }, 30000);
        }

        resp.sendRedirect(req.getContextPath() + "/quiz/index.jsp");
        System.out.println("Servlet called successfully.");
    }
}
