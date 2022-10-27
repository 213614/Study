package net.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginForm extends HttpServlet{

	// 결과 : http://localhost:9090/basic05_MVC/login.do
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// method="get" → URL에다가 직접 입력하면 get방식
		
		// 페이지 이동
		// ①
		//resp.sendRedirect("control/loginForm.jsp");
		// http://localhost:9090/basic05_MVC/control/loginForm.jsp 
		// login.do로 페이지 이동하면 JSP와 똑같은 URL이 나옴 = JSP페이지로 연결해서 이동시킨거니까 
	
		// ② (더 많이 사용됨)
		String view = "control/loginForm.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);
		// http://localhost:9090/basic05_MVC/login.do
		// → 부모페이지에서 만든 값을 자식페이지로 전달할 수 있다(①번은 안됨)
		// → control 경로가 감춰짐 
		
		// ①번은 req를 가져가지 않지만 ②는 req를 가져가서 사용한다 (사용자가 입력한 정보를 자식 페이지와 주고받을 수 있게된다)
		
		
		
	}//doGet() end

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// method="post"
		super.doPost(req, resp);
		
	}//doPost() end

	
}//class end
