package chap07_T.webprocess;

import javax.servlet.http.HttpServletRequest;

import chap07_T.dao.BreadDao;

public class BreadListWebProcess implements WebProcess{

	@Override
	public String process(HttpServletRequest request) {
		// try-catch 작업이 추후에는 꼭 있어야 하나 싶어지기도 한다. 
		//해서 Dao 개념으로 보내지기도 함 > chap07_T > dao > BreadDao.java
		/*try(Connection conn = DBConnector.getConnetion();
		) {
			//DB에서 꺼낸 후 		
			//어트리뷰트에 싣는다
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		BreadDao breadDao = new BreadDao();
		request.setAttribute("breads", breadDao.getAll());

		return "/WEB-INF/views/bread/list.jsp";
	}

}
