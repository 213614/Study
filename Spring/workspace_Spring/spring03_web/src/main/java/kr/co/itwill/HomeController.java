package kr.co.itwill;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

// ↓ URL에서 요청, 응답이 가능한 클래스로 지정
@Controller
public class HomeController {

	public HomeController() {
		System.out.println("--------HomeController() 객체 생성");
	}//default constructor
	
	// 결과확인 : http://localhost:9095/home.do
	
	// 요청 명령어를 등록하고, 실행의 주체는 메소드(함수)다
	@RequestMapping("/home.do")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("start");
		// application.propertice 참조 
		//→ prefix + ViewName + suffix = /WEB-INF/views/start.jsp
		
		mav.addObject("message","어서오세요.");
		// request에 값 올리기 ↑ 변수명  ↑ 내용
		
		mav.addObject("img","<img src='images/devil.png'>");
		// request로 이미지 전달
		
		return mav;
	}//home() end
	
	
	
}//class end
