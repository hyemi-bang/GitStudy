package chap08.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap08.dao.EmployeeDAO;
import chap08.dto.EmployeeDTO;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {

		String searchField = req.getParameter("searchField");
		String searchQuery = req.getParameter("searchQuery");
		
		EmployeeDAO employeeDao = new EmployeeDAO();
		List<EmployeeDTO> searchResults = employeeDao.searchEmployees(searchField, searchQuery);
	
		req.setAttribute("searchResults", searchResults);
		req.setAttribute("searchField", searchField);
		
		 // JSP 페이지로 포워딩
        RequestDispatcher dispatcher = req.getRequestDispatcher("search.jsp");
        dispatcher.forward(req, resp);
	}
}
