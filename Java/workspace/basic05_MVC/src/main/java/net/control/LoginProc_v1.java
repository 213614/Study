package net.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginProc_v1 extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 전송 방식 : method = "post"이면 service()가 doPost()함수를 호출
		try {
			    // 사용자가 입력한 값(아이디, 비밀번호)를 req가 받는다 (request.~ 가 받으니까) 
			   
				// ①. 한글 인코딩 (가장 첫줄에 작성)
			    req.setCharacterEncoding("UTF-8");
			    
			    // ②. 사용자가 요청한(입력한) 정보를 req에 받아와서 변수에 담는다 (= request.getPa~(""); IN JSP)
			    // 모델 객체를 톰캣이 만들어 줬다면 이제는 우리가 직접 만들어 사용하는 것이다.
			    String uid = req.getParameter("uid").trim();
			    String upw = req.getParameter("upw").trim();
			    
			    // ③. 요청한 사용자에게 응답(돌려준다)
			    resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();

				out.print(" <!DOCTYPE html> ");
				out.print(" <html> ");
				out.print(" <head> ");
				out.print(" 	<meta charset='UTF-8'> ");
				out.print(" 	<title>환영합니다</title> ");
				out.print(" </head> ");
				out.print(" <body> ");
				out.print(" 	<h3>* 로그인 결과 *</h3> ");
				out.print(" 	아이디 : <strong>" + uid + "</strong> ");
				out.print(" 	<hr> ");
				out.print(" 	비밀번호 : <strong>" + upw + "</strong> ");	
				out.print(" </body> ");
				out.print(" </html> ");
				
			    out.close(); 
			
		} catch(Exception e) { System.out.println("요청 실패 : " + e); }//try end
		
	}//doPost() end
	
	
	
}//class end
