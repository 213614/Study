package oop0913;

class BbsDTO { 
	// Data Transfer Object(DTO) : getter/setter/toString이 들어있는 클래스 = DTO class
	// DTO클래스가 있다는 전제하에 Spring이 동작되기때문에 잘 구현해놔야 오류안남
	
	// 멤버변수 field
	private int bbsno; 			// 글 번호
	private String writer; 		// 작성자
	private String subject;		// 글 제목
	
	// constructor
	public BbsDTO() {}			// 기본생성자함수
	
	
	// ● private변수를 getter/setter 함수로 만들어서 간접 접근을 한다
	
	// ○ getter(){}
	// 멤버변수의 자료형 + get + 멤버변수의 첫글자 대문자 + 뒤는 그대로 + () {return}
	public int getBbsno() {		
		return this.bbsno;	
	}
	
	// ○ setter(){}
	// void + set + 멤버변수 첫글자 대문자 + 뒤는 그대로 + (매개변수) {this. = ;}
	// → void라 리턴값X 					  		   → 멤버변수와 동일하게
	public void setBbsno(int bbsno) {
		this.bbsno = bbsno;
	}
	
	
	public String getWriter() {					// getter
		return this.writer;
	}
	public void setWriter(String writer) {		// setter
		this.writer = writer;
	}
	
	
	public String getSubject() {				// getter
		return this.subject;
	}
	public void setSubject(String subject) {	// setter
		this.subject = subject;
	}
	
}//class end

public class Test06_getset {

	public static void main(String[] args) {
		/*
		    
		    ★ private 처리된 변수에 접근하고자 할 때 get/set함수를 사용한다 ★
		    
			● get
			  → getter 함수
 			  → 무언가를 가져올 때 
			
			● set
			  → setter 함수
			  → 무언가를 줄 때			
			  
			○ 함수명 작성 규칙
 			  - 접두어 is 함수명()	:  대체적으로 boolean값으로 return
 			  -      to 함수명()	:  to 뒤에 오는 값으로 반환하라(ex.toString();)
 			  -      get함수명()	:  얻어오는 함수, 대부분 return값 존재
 			  -      set함수명()	:  원하는 값으로 세팅할 때 
 			  
 			→ 대체적으로 매개변수가 없거나 1개면 getter 
 			  두개 이상은 setter 
 			  ex. css() 		  → 매개변수 없음
 				  css("color")	  → 매개변수 1개
 				  css("size",15)  → 매개변수 2개 : "size"를 15로 setting하겠다는 뜻(setter함수)
 				  
 			○ getter함수명을 작성하는 규칙
		      → get멤버변수의첫글자는대문자로함수명()
		      ∴ 멤버변수의 자료형 + get + 멤버변수의 첫글자 대문자 + 뒤는 그대로 + () {return ;}
		
		    ○ setter함수명을 작성하는 규칙
		      → set멤버변수의첫글자는대문자로함수명()
		      ∴ void + set + 멤버변수 첫글자 대문자 + 뒤는 그대로 + (매개변수) {this. = ;}
				  → void라 리턴값X 					  		 → 멤버변수와 동일하게
				 
		*/

		BbsDTO dto = new BbsDTO();
		
		// set함수에 전달값으로 각 변수들 setting
		dto.setBbsno(1);
		dto.setWriter("오필승");
		dto.setSubject("무궁화 꽃이 피었습니다.");
		
		// get함수 호출로 출력
		System.out.println(dto.getBbsno());
		System.out.println(dto.getWriter());
		System.out.println(dto.getSubject());
		

	}//main() end
}//class end
