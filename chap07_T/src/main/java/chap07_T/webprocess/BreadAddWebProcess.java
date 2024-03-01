package chap07_T.webprocess;

import javax.servlet.http.HttpServletRequest;

import chap07_T.dao.BreadDao;
import chap07_T.dto.BreadDTO;

public class BreadAddWebProcess implements WebProcess{

	BreadDao breadDao = new BreadDao();
	
	
	@Override
	public String process(HttpServletRequest request) {
		String bread_name = request.getParameter("bread_name");
		Integer bread_price = Integer.parseInt(request.getParameter("bread_price")); 
				// null체크해야하지만 바로 parseInt
	
		Integer result = breadDao.insert(new BreadDTO(bread_name, bread_price));
		
		if(result == null) {
			return "redirect::"+request.getContextPath()+"/";
			// insert 안되었을때 index.jsp로 가고
		} else if (result != null && result > 0) {
            return "redirect::" + request.getContextPath() + "/dbtest/bread/list";
            //  insert 잘 되었을때 확인하러 간다
		} else {
			return "redirect::"+request.getContextPath()+"/";
		}
		
	}

}
