package chap06.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chap06.model.PizzaOrder;

/*
 	#Front Controller Design Pattern
 	- 모든 요청을 하나의 서블릿에서 받고 URI에 따라 알맞은 페이지로 포워딩
 	- 요청 -> URI 식별 -> 처리 -> 포워딩 -> 뷰 생성 순서로 모든 요청을 처리할 수 있다
 	
 */
public class ApplicationServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletContext application = req.getServletContext();
		HttpSession session = req.getSession();

		// 1. 요청을 받으면 URI를 통해 알맞은 처리로 안내한다
		System.out.println("Request URI: " + req.getRequestURI());

		String cmd = req.getRequestURI().substring(req.getContextPath().length());

		System.out.println(cmd);

		// 2. 원하는 코드로 처리한 후 뷰 페이지에서 필요한 데이터는 어트리뷰트에 실어보낸다
		// 3. 다음 뷰로 포워딩한다
		if (cmd.equals("/hello")) {
			String userName = req.getParameter("keyword");

			// DB에 접근해서 자료를 들고와 어트리뷰트에 실어보낸다
			// List<>() 해서 받아오겠지
			Set<String> resultSet = new HashSet<>();

			resultSet.add("Smith A");
			resultSet.add("Smith B");
			resultSet.add("Smith C");

			req.setAttribute("result", resultSet);

			// 이 정보들을 hello.jsp에서 보겠다고 하는 것이다.

//			req.setAttribute("userName", userName);
			// 포워딩을 통해서는 WEB-INF 폴더에 접근할 수 있다
			req.getRequestDispatcher("/WEB-INF/views/hello.jsp").forward(req, resp);
		} else if (cmd.equals("/greetings/hi")) {

		} else if (cmd.equals("/menus")) {
			// 도미노피자 메뉴의 크기와 개수를 선택하여 요청을 보내면 주문한 모든 내역과 총 가격을 보여주는 페이지가 나오게 만들어보세요
			String menu = req.getParameter("menu");
			String size = req.getParameter("size");
			
			int amount = Integer.parseInt(req.getParameter("amount"));
			// int totalPrice = Integer.parseInt(req.getParameter("totalPrice"));

			String totalPriceParam = req.getParameter("totalPrice");
			int totalPrice = 0;

			if (totalPriceParam != null && !totalPriceParam.isEmpty()) {
				totalPrice = Integer.parseInt(totalPriceParam);
			}

			// 여러개 선택되면 배열로 들어올텐데 이렇게 놔도 괜찮은가?
			// Set<String> choiceSet = new HashSet<>();
			List<String> userChoices = new ArrayList<>();
			String userChoice = "메뉴: " + menu + "사이즈: " + size + "수량: " + amount;

			userChoices.add(userChoice);

			// 주문 총액을 문자열로 저장
			String total = "총 가격: " + totalPrice;

			req.setAttribute("userChoice", userChoices);
			req.setAttribute("totalPrice", total);
			req.getRequestDispatcher("/views/dominosResult.jsp").forward(req, resp);

		} else if (cmd.equals("/pizza/form")) { // 2번절차 생략 바로 3번으로 가는 것
			req.getRequestDispatcher("/WEB-INF/views/pizza/form.jsp").forward(req, resp);
		} else if (cmd.equals("/pizza/cart/add")) {
			String size = req.getParameter("size2");
			String qtyStr = req.getParameter("qty2"); // 파라미터 값이 안전한지 체크를 해봐야한다, 널값이 나오는지 아닌지

			// 파라미터 값이 안전한지 체크
			if (size == null || qtyStr == null || size.equals("") || qtyStr.equals("")) {
				throw new ServletException("파라미터 값이 이상함");
			}

			int qty = Integer.parseInt(qtyStr); // Integer.parsInt 하기전에 null값 등 예외값을 먼저 체크해야한다

			System.out.println(size);
			System.out.println(qtyStr);

			Object c = session.getAttribute("cart"); // 카트에 들어온 것이 있는지 없는지 있으면 저장하고 등등 하려고

			if (c == null) {
				// 새로운 장바구니 리스트를 추가
				List<PizzaOrder> newCart = new ArrayList<>();
				newCart.add(new PizzaOrder(size, qty));
				session.setAttribute("cart", newCart);

			} else {
				// 있던 카트에 방금 받은 파라미터를 추가
				List<PizzaOrder> cart = (List) c;
				cart.add(new PizzaOrder(size, qty));

			}
			resp.sendRedirect(req.getContextPath() + "/pizza/form");

		}
	}
}
