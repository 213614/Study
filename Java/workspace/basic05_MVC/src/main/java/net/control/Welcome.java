package net.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
	참조 : https://docs.oracle.com/javaee/7/api/
	
	● HttpServlet Class 
	- http 프로토콜 기반의 요청과 응답을 처리해주는 클래스
	
	● 결과 확인
	- http://localhost:9090/basic05_MVC/wel.do → 명령어로 페이지 호출
									  ( /control/welcome.jsp → 페이지로 호출(.asp/.php/.jsp) )
	● Welcome Servlet class
	- 직접 만든 서블릿 클래스는 web.xml (배치관리자)에 등록해야한다.(→ Spring Framework에서는 등록이 따로 필요없이 명령어가있음)				  
*/

public class Welcome extends HttpServlet {
	// → Http서블릿을 상속받아 welcome이라는 서블릿 클래스를 만든것이다	
	
	// 나(클래스)의 부모가 class     : extends    상속 (확장)  
	// 나(클래스)의 부모가 interface : implements 상속 (구현) → 미완성메소드, 함수의 본체가 없다(override필수)
	
	

	@Override		// ← 상속받은 함수를 나(클래스)에 맞게 재정의(리폼)하겠다.	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
					   //→ 사용자가 요청한 정보 	     → 클래스가 응답할 정보 
		
		// 전송방식 method = "get"으로 요청하면 doGet()함수가 자동으로 호출된다 
		// req  : 모델 1 방식(myweb)의 내부객체 request.~ 와 동일한 변수 
		// resp : 모델 1 방식(myweb)의 내부객체 response와 동일한 변수 
		// ※ 변수명은 변경 가능하나 프로그램이 지원해주는건 왠만해선 유지하는 걸 추천
		
		try {
				resp.setContentType("text/html; charset=UTF-8");
				// 응답할 페이지의 형태를 지정 : HTML 문서 구조 (<body> 등)으로 응답하겠다 
				
				//resp.setContentType("text/plain; charset=UTF-8");
				// 	   					    → HTML문서가아니라 단순한 문자열 (String)으로 응답하겠다는 뜻 = AJAX에서 많이 사용함
				
				// 요청한 사용자에게 응답하기 위한 출력 객체
				PrintWriter out = resp.getWriter();
				// 응답할 객체를 out에 담았기때문에 out으로 응답할 정보를 프린트하면 됨

				out.print(" <!DOCTYPE html> ");
				out.print(" <html> ");
				out.print(" <head> ");
				out.print(" 	<meta charset='UTF-8'> ");
				out.print(" 	<title>환영합니다</title> ");
				out.print(" </head> ");
				out.print(" <body> ");
				out.print(" 	<strong>대한민국</strong> ");
					
				out.print(" 	<hr> ");
					
				out.print(" 	<span style='color:red;'>오 필승 코리아</span> ");
					
				out.print(" 	<hr> ");
					
				out.print(" 	<table border='1'> ");
				out.print(" 		<tr> ");
				out.print(" 			<th>이름</th> ");
				out.print(" 			<td>무궁화</td> ");
				out.print(" 		</tr> ");
				out.print(" 	</table> ");
					
				out.print(" </body> ");
				out.print(" </html> ");
				
				// 서블릿 클래스를 이용하여 뷰단(프론트단) 코드 작성시 out.print안에 다 string으로 몰아넣어야해서 아주 불편하다
				// jsp에서는 백엔드단 <%을 이용해서 작성해야해서 불편하다 
				// → 각각의 장단점이 있다 : (서블릿은 보안) : 두개를 잘 섞어서 사용해야함
			
		} catch(Exception e) {
			System.out.println("요청 실패 : " + e);
		} //try end
		
		
	}// doGet() end

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 전송방식 method = "post"으로 요청하면 doPost()함수가 자동으로 호출된다 
		
	}// doPost() end


	
	
	
}//class end
