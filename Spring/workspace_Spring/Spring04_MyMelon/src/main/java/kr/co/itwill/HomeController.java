package kr.co.itwill;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	public HomeController() {
		System.out.println("--------HomeController() 객체 생성");
	}// default constructor
	
	// MyMelon Project 첫 페이지 호출 명령어 등록
	// 결과 확인 http://localhost:9095/home.do
	@RequestMapping("/home.do")
	public ModelAndView home() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/mediagroup/list.do");
		//				→ home.do 명령어를 호출하면 ↑ 페이지가 열린다 
		//              → redirect : 등록한 명령어를 호출할 수 있다 (.jsp호출만이아니라)
		//              → /home.do = /mediagroup/list.do : 같은 페이지가 열리는 명령어
		
		return mav;
	}//home() end

}//class end
