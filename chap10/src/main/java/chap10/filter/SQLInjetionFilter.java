package chap10.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class SQLInjetionFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String name = request.getParameter("userName"); //userName이 있다는것을 가정
		//request.getParameterNames(); 로 모든 이름을 꺼내서 검사할 수도 있다.
		
		// 위험한 SQL문자열이 있는지 검사한다 ( 주석(--), 세미콜론(;) 등등 )
		// if(name.contains())
		
		// 글 내용중에 자바스크립트 소스가 포함 되어있는지 검사한다. XSS(Cross-Site Scripting) 공격 대비
		//XSS공격이란 공격자가 악의적인 스크립트 코드를 웹 애플리케이션에 삽입하여
		// 사용자의 웹 브라우저에서 해당 코드가 실행되도록 하는 공격 기법이다
		System.out.println("파라미터에 포함된 데이터들을 검사하는 중입니다");
		chain.doFilter(request, response);
		
	}
}
