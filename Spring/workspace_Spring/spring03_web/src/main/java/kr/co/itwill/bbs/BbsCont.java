package kr.co.itwill.bbs;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

// 1테이블 1컨트롤러
@Controller
// @RequestMapping → 여기에다가 적어서 아예 컨트롤러 클래스를 하나의 명령어로 매핑할 수 있다
public class BbsCont {
	
	public BbsCont() {
		System.out.println("--------BbsCont() 객체 생성");
	}// default constructor
	
	
	// ▶ 결과 확인 : http://localhost:9095/bbs/create.do → GET방식으로 호출
	@RequestMapping(value="/bbs/create.do", method = RequestMethod.GET)
	
	/* ①. 스프링의 유연함을 살리지 못한 함수 
	public ModelAndView bbsForm() {
		
		ModelAndView mav = new ModelAndView();	
		mav.setViewName("bbs/bbsForm"); 
		//= /WEB-INF/views/bbs/bbsForm.jsp
	
		return mav;
	}// bbsForm() end
	*/
	
	// ②. ①번과 동일하게 페이지 이동이 가능한 함수 : 그냥 String으로 값을 넘겨버린다 
	public String bbsForm() {
		return "bbs/bbsForm";		//= /WEB-INF/views/bbs/bbsForm.jsp : 결과 동일
	}//bbsForm() end
	
	
	// ▶ 동일한 이름의 요청 명령어를 전송 방식(메소드) GET  |  POST로 구분하여 호출 가능하다 (각 다른 명령어로 인식)
	@RequestMapping(value="/bbs/create.do", method = RequestMethod.POST)
	
	/* ①.
	public ModelAndView bbsIns(HttpServletRequest req) {
		
		// ①. 사용자가 입력 요청한 정보 가져오기
		String wname   = req.getParameter("wname").trim();
		String subject = req.getParameter("subject").trim();
		String content = req.getParameter("content").trim();
		String passwd  = req.getParameter("passwd").trim();
		
		// ②. View 페이지로 이동하기 위한 클래스 
		ModelAndView mav = new ModelAndView();	
		mav.setViewName("bbs/bbsResult"); 
		//= /WEB-INF/views/bbs/bbsResult.jsp
	
		// ③. 공유 저장소 Request 영역에 값 올리기
		mav.addObject("wname",   wname);
		mav.addObject("subject", subject);
		mav.addObject("content", content);
		mav.addObject("passwd",  passwd);
		
		return mav;
	}// bbsIns() end
	*/
	
	// ②. 매개변수(parameter)가 DTO 객체인 경우
	public ModelAndView bbsIns(@ModelAttribute BbsDTO dto) {
							// @ModelAttribute DTO파일명 변수명 = 매개변수로 DTO를 사용하겠다는 어노테이션 
							// 알아서 DTO에 대입해주겠다는 뜻으로 DTO 클래스에 <form><input name="">과 동일한 이름의 멤버변수(field)·getter·setter가 필히 있어야한다 (전제조건)
							// → ex. <input type=text name=wname> = private String wname = getWname() = setWname(String wname)  	
							// ★ @ModelAttribute 는 생략가능하다
		
		// View 페이지로 이동하기 위한 클래스 
		ModelAndView mav = new ModelAndView();	
		mav.setViewName("bbs/bbsResult2"); 
		
		// 공유 저장소 Request 영역에 값 올리기
		mav.addObject("dto", dto);
		
		return mav;
	}//bbsIns() end
	
	
}//class end
