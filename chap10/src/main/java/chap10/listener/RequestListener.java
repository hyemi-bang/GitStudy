package chap10.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class RequestListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("RequestListener: 요청이 발생 했습니다");
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("RequestListener: 요청이 파괴되었습니다"); // 응답이 갔을 때
	}
}
