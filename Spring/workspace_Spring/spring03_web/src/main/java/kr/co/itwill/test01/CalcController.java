package kr.co.itwill.test01;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

// ↓ URL상 요청 명령어를 읽어서(받아드려서) 실행해주는 클래스로 지정 
//   (@Controller : 자동으로 객체를 생성시켜주는 Annotation → 의존성 주입)
@Controller
public class CalcController {

	public CalcController() {
		System.out.println("--------CalcController() 객체 생성");
	}//default constructor
	
	// URL에서 요청한 명령어 등록 
	// 기본 형식 @RequestMapping(value="", method=GET | POST)
	@RequestMapping(value="/add.do", method = RequestMethod.GET)
	//                   = /add.do 라는 명령어를 GET방식으로 요청했을 때(요청이 들어왔을 때) 아래 add() 함수 실행 
	// 결과 확인 : http://localhost:9095/add.do?no1=3&no2=5
	
	public ModelAndView add(HttpServletRequest req) {
				 // 사용자가 요청한 값을 매개변수로 가져오기 (이클립스 doGet()과 같다)
				 // add.do?변수=값&변수=값 : 값을 요청하는 페이지이기때문에 req필수 
		
		// ①. 사용자가 요청한 값 불러오기 : add.do?no1=값&변수2=값 ← 값 불러오기
		int no1    = Integer.parseInt(req.getParameter("no1"));
		int no2    = Integer.parseInt(req.getParameter("no2"));
		int result = no1 + no2;
		
		// ②. View 페이지로 이동하기 위한 클래스 
		//    → Model
		// 	    → ModelAndView
		//    : 둘 중 아무거나 사용 가능 (보통은 MAV를 많이 씀) 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("calcResult");
			//→ prefix + ViewName + suffix = /WEB-INF/views/calcResult.jsp
		
		// ③. 공유 저장소 Request 영역에 값 올리기(calcResult.jsp에 공유를 위해)
		req.setAttribute("no1",    no1);
		req.setAttribute("no2",    no2);
		req.setAttribute("result", result);
		req.setAttribute("message","<h3>두 수 사이의 합 </h3>");
		req.setAttribute("img","<img src='images/face-plain.png'>");
		
		return mav;	
	}//add() end
	 
	
	// 결과 확인 : http://localhost:9095/sub.do?no1=3&no2=5
	@RequestMapping (value="/sub.do", method = RequestMethod.GET)
	public ModelAndView sub(HttpServletRequest req) {
		
		// ①. 사용자가 요청한 값 불러오기 
		int no1    = Integer.parseInt(req.getParameter("no1"));
		int no2    = Integer.parseInt(req.getParameter("no2"));
		int result = no1-no2; 	// Math.abs(); : 절대값(음수없음)
		
		// ②. View 페이지로 이동하기 위한 클래스 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("calcResult");
		
		// ③. 공유 저장소 Request 영역에 값 올리기(calcResult.jsp에 공유를 위해)
		// 이번엔 ModelAndView 활용
		mav.addObject("no1",    no1);
		mav.addObject("no2",    no2);
		mav.addObject("result", result);
		mav.addObject("message","<h3>두 수 사이의 차 </h3>");
		mav.addObject("img","<img src='images/face-surprise.png'>");

		return mav;	
	}//sub() end
	
	
	// 결과 확인 : http://localhost:9095/mul.do?no1=3&no2=5
	@RequestMapping (value="/mul.do", method = RequestMethod.GET)
	public ModelAndView mul(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
											  	 // → 사용자 요청에 의한 응답 객체,   → 세션(개인 캐비넷) 객체 : 매개변수의 유연함(스프링의 특징 : 유연함)
		// ①. 사용자가 요청한 값 불러오기 
		int no1    = Integer.parseInt(req.getParameter("no1"));
		int no2    = Integer.parseInt(req.getParameter("no2"));
		int result = no1*no2; 	
		
		// ②. View 페이지로 이동하기 위한 클래스 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("calcResult");
		
		// ③. 공유 저장소 Request 영역에 값 올리기(calcResult.jsp에 공유를 위해)
		// 이번엔 ModelAndView 활용
		mav.addObject("no1",    no1);
		mav.addObject("no2",    no2);
		mav.addObject("result", result);
		mav.addObject("message","<h3>두 수 사이의 곱 </h3>");
		mav.addObject("img","<img src='images/face-smile.png'>");

		return mav;	
	}//mul() end
	
	
	// 결과 확인 : http://localhost:9095/div.do?no1=3&no2=5
	@RequestMapping (value="/div.do", method = RequestMethod.GET)
	public ModelAndView div(HttpServletRequest req) {
		
		// ①. 사용자가 요청한 값 불러오기 
		int no1    = Integer.parseInt(req.getParameter("no1"));
		int no2    = Integer.parseInt(req.getParameter("no2"));
		int result = no1/no2; 	
		
		// ②. View 페이지로 이동하기 위한 클래스 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("calcResult");
		
		// ③. 공유 저장소 Request 영역에 값 올리기(calcResult.jsp에 공유를 위해)
		// 이번엔 ModelAndView 활용
		mav.addObject("no1",    no1);
		mav.addObject("no2",    no2);
		mav.addObject("result", result);
		mav.addObject("message","<h3>두 수 사이의 나눗셈 </h3>");
		mav.addObject("img","<img src='images/face-grin.png'>");

		return mav;	
	}//div() end
	
	
	
}// class end
