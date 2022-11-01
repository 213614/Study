package kr.co.itwill.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginCont {

	public LoginCont() {
		System.out.println("--------LoginCont() 객체 생성");
	} // default constructor
	
	
	// 결과 확인  http://localhost:9095/login.do
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String loginForm() {
		return "login/loginForm";		// = /WEB-INF/views/login/loginForm.jsp
	}//logF() end
	
	
	// 
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public ModelAndView loginProc(@ModelAttribute LoginDTO dto, HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		String id = dto.getId();
		String pw = dto.getPw();
		
		ModelAndView mav = new ModelAndView();
		if(id.equals("itwill") && pw.equals("1234")) {
			
			mav.setViewName("login/loginResult");
			
			// 세션에 담아서 로그인 정보 유지 
			session.setAttribute("s_id", id);
			session.setAttribute("s_pw", pw);
			
			req.setAttribute("message", "<h5>로그인 성공</h5>");
			
		}else {
			
			mav.setViewName("login/msgView");
			
			req.setAttribute("message", "<h5>로그인 실패</h5>");
			
			req.setAttribute("link", "<a href='javascript:history.back()>다시 시도</a>");
			
		}// if end → DAO연결 자리 
		
		return mav;
	}//logP() end
	
}// class end
