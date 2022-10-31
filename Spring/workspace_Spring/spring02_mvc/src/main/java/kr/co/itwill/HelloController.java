package kr.co.itwill;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

// URL에서 요청한 명령어를 읽어서(어떤 명령어인지) 처리해주는 CALSS
// HelloController 클래스는 컨트롤러 기능을 한다. (1테이블 = 1컨트롤러)
// Spring Container(=웹 서버)가 자동으로 객체를 생성해서 의존성 주입을 해준다.
// = 직접 new 하지않아도 객체 생성이 됨
// (Spring Container : 스프링에서 자바 객체들을 관리하는 공간)
@Controller
public class HelloController {
	
	public HelloController() {
		System.out.println("-------HelloController() 객체 생성됨");
	}//constructor end
	
	// 결과확인 http://localhost:9095/hello.do
	// 							  /spring02_mvc 
	//                            → SpringBoot에서는 직접적으로 프로젝트명을 적지 않는다(=내장 톰캣이 있어서)
	
	// → 요청 명령어(hello.do)등록 후 실행의 주체는 메소드(함수)
	
	// 명령어 등록하는 어노테이션
	@RequestMapping("/hello.do")
	public ModelAndView hello() {
		// 보통 명령어와 함수 이름은 동일하게 간다
		// 명령어등록(RequestMapping) → 해당 명령어 호출시 실행될 함수 작성(hello())
		ModelAndView mav = new ModelAndView();
		
		// application.properties 환경 설정 파일의 prefix(접두어)와 suffix(접미사)를 조합해준다 = ViewResolver
		// prefix + ViewName + suffix
		mav.setViewName("hello");		
		// => /WEB-INF/views/hello.jsp
		
		
		// 서로 다른 page간의 변수 공유 (request, session, application)
		// ↓ request.setAttribute(); 함수와 동일하다	
		mav.addObject("message", "Welcome to My Home <3");
		
		
		return mav;
		// → /WEB-INF/views/hello.jsp : 조합된 결과를 return
		
	}//hello() end
	
}//class end
