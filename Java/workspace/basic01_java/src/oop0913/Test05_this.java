package oop0913;

class Sungjuk{
	
	// 멤버변수 field
	private String name;
	private int kor, eng, mat;
	private int aver;
	
	
	// 생성자 constructor
	public Sungjuk() {  // 기본생성자 default constructor
		
		// 생성자 함수도 자신의 다른 생성자 함수를 호출할 수 있다.
		// 바로 아래있는 생성자함수 호출하기 
		// Sungjuk("손흥민"); → !error : 다른 함수는 이렇게 호출하지만 자신안에 다른 함수는 this를 사용
		// this = 나! ('self' in Python)
		this("손흥민");
	}
	
	public Sungjuk(String name) {
		this.name  = name; 
	  //this.멤버변수 = 매개변수(parameter)
		
	}//end
	
	public Sungjuk(int kor, int eng, int mat) {
		this("박지성");
		this.kor=kor;
		this.eng=eng;
		this.mat=mat;
		// this("박지성"); → !error : 자신의 생성자함수 호출 시 첫줄(가장 윗줄)에서 호출해야한다
	}//end
	
	public Sungjuk(int aver) {
		disp(); 	// 생성자 함수에서 일반 메소드 호출가능
	}
	
	
	// 멤버함수 method
	public void disp() {
		// this(85); 	→ !error : this는 생성자 내에서만 부르는 것, 일반 메소드에서 생성자 함수 호출불가 
	}
	// 일반함수(멤버함수)method는 main에서 new 연산자를 사용해서 메모리할당 후 호출할 수 있다.
	// ex. Score one = new Score("김연아", 50, 60, 75);
	// one.disp(); 		← 이런식으로 .disp();로 해야 호출됨
	// ∴ this = 생성자는 new연산자 쓰지 않기때문에 메모리할당이 없으므로 일반메소드에서 호출 불가
	
	
}//class end

public class Test05_this {

	public static void main(String[] args) {
		/* 
		 	● this()		/run안할거임 문법만보기/
			  → 생성자 함수가 자기 자신의 생성자 함수를 호출할 때
			 
	 	*/
		

	}//main() end
}//class end
