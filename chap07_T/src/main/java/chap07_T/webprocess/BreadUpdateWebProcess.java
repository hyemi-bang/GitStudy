package chap07_T.webprocess;

import javax.servlet.http.HttpServletRequest;

import chap07_T.dao.BreadDao;
import chap07_T.dto.BreadDTO;

public class BreadUpdateWebProcess implements WebProcess {

    BreadDao breadDao = new BreadDao();

    @Override
    public String process(HttpServletRequest request) {
        String breadName = request.getParameter("bread_name");
        Integer newPrice = Integer.parseInt(request.getParameter("new_price"));

        BreadDTO updatedBread = new BreadDTO(breadName, newPrice);

        Integer result = breadDao.update(updatedBread);

        if (result == null) {
            return "redirect::" + request.getContextPath() + "/";
            // update 안되었을 때 index.jsp로 가고
        } else if (result > 0) {
            return "redirect::" + request.getContextPath() + "/dbtest/bread/list";
            // update 잘 되었을 때 확인하러 간다
        } else {
            return "redirect::" + request.getContextPath() + "/";
        }
    }
}
