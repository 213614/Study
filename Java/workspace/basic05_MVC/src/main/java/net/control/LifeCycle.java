package net.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 	● HttpServlet의 계층도(족보)
 	
 	  class GenericServlet{}
 	    class *HttpServlet* extends GenericServlet{}
 	      class LifeCycle extends HttpServlet{}
 	      
 	● HttpServlet 생명 주기 ----------------------------------------------
 		
 		init() : 서버가 켜지고 서블릿이 호출되면 최초 1번만 호출
 		
 			  → service()
 			  → service()
 			  → service() : 사용자가 요청할 때마다(새로고침) 계속 호출
 			  → service() → doGet() / doPost()를 구분하는 역할을 한다.
 			  → service()
		  	  → service()
 			  
 		destroy() : 서버가 중지되면 최초 1번만 호출 
 	--------------------------------------------------------------------

	● LifeCycle 서블릿을 /WEB-INF/web.xml에 등록한다
	
	● 결과확인
	→ http://localhost:9090/basic05_MVC/life.do
*/



public class LifeCycle extends HttpServlet{
//  		 = 생명주기
// 서블릿에서 view단을 작성할때의 불편함을 개선시킨 클래스 

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		super.doGet(req, resp);
		System.out.println("doGet() 호출...");
		// method = "get" 요청들어오면 service()에게 호출되어 해당 함수 속 내용을 사용자에게 응답해준다  
		
	}//doGet() end

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		super.doPost(req, resp);
		System.out.println("doPost() 호출...");
		// method = "post" 요청들어오면 service()에게 호출되어 해당 함수 속 내용을 사용자에게 응답해준다  
		
	}//doPost() end

	
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {

		super.service(arg0, arg1);
		System.out.println("service() 호출...");
		// 가장 중추적인 역할로 URL을 통해 요청이 들어오면(새로고침=새로운 요청) 해당 요청을 service()함수가 받아서
		// 전송 방식이 method="get"/method="post"인지 (= 어떤 전송 방식으로 요청받았는지) 판단하여 
		// method = "get" 요청 → doGet() 호출 
		// method = "post" 요청 → doPost() 호출
		// 함수를 구분하여 호출해주는 함수다. 
		
		// → 사용자가 URL을 통해 요청 → service()가 Get/Post 판단 후 맞는 함수 호출  
		
	}//service() end

	
	@Override
	public void destroy() {

		super.destroy();
		System.out.println("destroy() 호출...");
		// 서버가 중지되면 딱 한번만 호출된다
		
	}//destroy() end

	
	@Override
	public void init() throws ServletException {

		super.init();
		System.out.println("init() 호출...");
		// 서블릿이 최초로 호출될 때 딱 한번 함수가 호출된다.
		// = 초기 환경 설정할 때 사용 
		
	}//init() end

	
	
}//class end
