package chap10.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class MyFilter implements Filter{
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, 
			FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Myfilter 지나감");
		
		//3번째 매개변수인 chain으로 다음 chain을 찾아줘야한다.
		// 다음 필터를 찾아가는 메서드를 반드시 직접 호출해야한다.
		chain.doFilter(request, response); // 여기서 받은 req,resp다 보내주면 
	}

}
