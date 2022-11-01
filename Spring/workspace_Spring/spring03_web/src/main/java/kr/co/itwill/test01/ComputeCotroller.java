package kr.co.itwill.test01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ComputeCotroller {
	
	public ComputeCotroller()  {
		System.out.println("--------ComputeCotroller() 객체 생성");
	} //default constructor
	
	
	// 요청 명령어를 처리하는 메소드 매개변수의 유연성 (스프링의 특징)
	// @RequestParam("요청(가져올) 변수명") 자료형 저걸 담을 변수명
	// → 사용자가 요청한 값을 직접 변수에 저장 가능하다 
	// ∴ mapping 함수의 매개변수안에다 작성한다. 
	
	
	// 결과 확인 : http://localhost:9095/diff.do?no1=3&no2=5
	@RequestMapping("/diff.do")		// method가 지정되어있지않으면 둘 다(get,post) 허용하겠단 소리
									// GET 에서 먼저 찾은 다음 없으면 POST로 간다
									// 하나의 명령어에 대해 get방식 | post방식으로 세세하게 나눌 수 있다
	public ModelAndView diff(@RequestParam("no1") int a, @RequestParam("no2") int b) {
							//	원래는 요청 변수와 담을 변수이름을 같게 준다
							// = 사용자가 요청한(입력한) no1을 변수 a에 no2를 변수 b에 담는다 
		
		// ①. 사용자가 요청한 값 불러오기 
		int result = Math.abs(a-b);
		
		// ②. View 페이지로 이동하기 위한 클래스 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("calcResult");
		
		// ③. 공유 저장소 Request 영역에 값 올리기(calcResult.jsp에 공유를 위해)
		// 이번엔 ModelAndView 활용
		mav.addObject("no1",    a);
		mav.addObject("no2",    b);
		mav.addObject("result", result);
		mav.addObject("message","<h3>두 수 사이의 차이 </h3>");
		mav.addObject("img","<img src='images/face-wink.png'>");
		
		
		return mav;
	} //diff end
	
	
	// 결과 확인 : http://localhost:9095/max.do?no1=3&no2=5
	// 사용자가 요청한 값(no1,no2)를 매개변수로 직접 저장 가능하다
	// → @RequestParam를 사용하지 않고 바로 요청 변수를 매개변수로 지정해버리면 된다 
	// ※ 단, 요청 변수명과 매개변수명이 무조건 동일해야한다 (전제조건)
	@RequestMapping("/max.do")
	public ModelAndView max(int no1, int no2) {
						  //→ 매개변수에 그냥 적으면 됨
						  //→ 자료형을 다르게 적으면 자동 형변환까지 됨 (String no2)
		
		// ①. 사용자가 요청한 값 불러오기 
		int result = Math.max(no1, no2);
		
		// ②. View 페이지로 이동하기 위한 클래스 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("calcResult");
		
		// ③. 공유 저장소 Request 영역에 값 올리기(calcResult.jsp에 공유를 위해)
		// 이번엔 ModelAndView 활용
		mav.addObject("no1",    no1);
		mav.addObject("no2",    no2);
		mav.addObject("result", result);
		mav.addObject("message","<h3>두 수 중 최대값 </h3>");
		mav.addObject("img","<img src='images/face-sad.png'>");
		
		
		return mav;
	} // max() end
	
	
}//class end
