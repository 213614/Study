package oop0913;

public class Sawon {
	// 멤버변수 field
	String sabun;	 // 사번
	String name; 	 // 이름
	int pay;		 // 급여
	
	
	// 생성자함수 constructor
	public Sawon() {} // 기본 생성자

	// 생성자 함수 자동 코딩
    // 메뉴바 → Source → Generate Constructor using Fields..
	// 멤버변수를 매개변수로 넣어줌 → 체크박스 
	// after ..() → 해당 함수 뒤에 넣어준다는 뜻 → 메뉴에서 생성하기 전 이미 커서가 해당 위치에 있어야함
	public Sawon(String sabun, String name, int pay) {
		// super(); → 나중에 사용
		
		this.sabun = sabun;
		this.name  = name;
		this.pay   = pay;
		
	}// end
	
	// static 변수 : 일반 변수와 구분을 위해 주로 대문자로 이름을 지정한다
	static String COMPANY="㈜아이티윌";
	static int 	  SUDANG =10;
	static double TAX = 0.03;

	// static 함수
	static void line() {
		System.out.println("-----------------------------------------");
	}//line() end
	
	
}// class end
