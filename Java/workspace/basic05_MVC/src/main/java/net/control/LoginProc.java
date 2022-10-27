package net.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginProc extends HttpServlet {

	// 전송 방식 : method = "post"이면 service()가 doPost()함수를 호출

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
				req.setCharacterEncoding("UTF-8"); 		// 한글 인코딩
			    
			    String uid = req.getParameter("uid").trim();
			    String upw = req.getParameter("upw").trim();
				
			    if (uid.equals("itwill") && upw.equals("1234")) {
			    	// 로그인 성공
			    	req.setAttribute("r_uid", uid);
			    	req.setAttribute("r_upw", upw);
			    } else {
			    	// 로그인 실패
			    	req.setAttribute("r_uid", "guest");
			    	req.setAttribute("r_upw", "guest");			    	
			    }// if end
			    
			    // View(Front) 페이지 이동
			    String view = "control/loginResult.jsp";
			    
			    // 부모 페이지(LoginProc() 클래스)에서 만든 변수를 자식 페이지(loginResult.jsp)에서도 사용하고싶다 
			    // = RequestDispatcher을 사용해야한다
				RequestDispatcher rd = req.getRequestDispatcher(view);
				rd.forward(req, resp);
			
				
		} catch(Exception e) { System.out.println("요청 실패 : " + e); }//try end
		
	}//doPost() end
	
	
}//class end
