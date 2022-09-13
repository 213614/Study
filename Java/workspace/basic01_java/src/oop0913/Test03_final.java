package oop0913;

import java.util.Calendar;

/*
	class Animal{}
	// 단 부모클래스 앞에 final을 붙이면 상속이 안되므로(종단클래스가 되기때문에) 오류난다.
	 
	// 	  자식(서브)클래스명 extends 부모(슈퍼)클래스명 {} 
	class Elephant extends Animal {}
	// 동물 클래스의 기능을 코끼리 클래스에 넣고싶다면 상속을 이용한다('부모-자식/조상-후손/슈퍼-서브'라는 관계가 성립)
*/
// 1. final 클래스(종단클래스)
//final class Animal{}

// 2. final 메소드 
class Fruit{
	void view() {}
	final void disp() {}	// final 메소드(함수) : 수정불가
} //class end

class Apple extends Fruit{		// 자식(서브)클래스명 extends 부모(슈퍼)클래스명 {}
	//자식(서브)		부모(슈퍼)
	
	// 보이지않지만 부모클래스(Fruit)의 view(){}, disp(){}가 숨겨져있다
	// 자식클래스 안, 빈 공간에 커서를 두고 ctrl+space하면 override 가능 메소드가 보임
	// 물려받은 메소드를 (view,disp)를 나에게 맞게 고쳐쓸 수 있다 = override
	
	@Override 	// ← annotation, 재정의(리폼)
	void view() {
		super.view();
	}
	
	/*
	@Override		// 억지로 작성해도 오류남
	void disp() {}	
 	→!error : disp는 final메소드라 수정할 수 없으므로 ctrl+space에 보이지 않는다(=override못함)
 	※ override(재정의)하지 못하는지 사용하지 못하는건 아님! 
	*/
	
} //class end


public class Test03_final {

	public static void main(String[] args) {
		/*
		 		● final ; 마지막 (= const(상수화시키는 자료형) in JS)
		 		  ○ 변수	  : 변수를 상수화(고정)시킨다 
		 		  ○ 함수   : (상속개념) 더 이상 오버라이드(리폼) 할 수 없다 (= 상속받은것을 변경할 수 없음)
		 		  		  : 상속 → 어렵게 생각하지말고 부모가 자녀에게 물려준다고 생각
		 		  		  	      받으면 내꺼임, 그대로 쓸수도있지만 나에게 맞게 고쳐쓸수도있다(리폼)
		 		  		  	      : 리폼 = 오버라이드 Override ; 재정의
		 		  ○ 클래스  : 종단 클래스, 후손 클래스를 생성할 수 없다
		*/ 

		int a = 3;
		a = 5;
		// 변수는 다른값으로 대입 가능 (자료형은 최초에만 선언)
		
		// final 변수 = 변수의 상수화
		final int b = 2;		// = const b=2; (in JS)
		// b = 4;	   → !error : final변수는 다른값 대입 불가 
		
		// Calendar클래스에서 제공되는 값(클래스.멤버변·함수에 작게 붙어있는 s=static, f=final)
		System.out.println(Calendar.YEAR);		// 1
		System.out.println(Calendar.MONTH);		// 2
		System.out.println(Calendar.DATE);		// 5
		
		System.out.println(Calendar.HOUR);		// 10
		System.out.println(Calendar.MINUTE);	// 12
		System.out.println(Calendar.SECOND);	// 13
		
		/*
			   class Calendar {
			   		static final int YEAR  = 1;
			   		static final int MONTH = 2;
			   		static final int DATE  = 5;
			   }
			   
			   → 이렇게 구성되어있는 것 
		*/
		
		// Calendar.YEAR = 2022;  	→ !error : final 변수값은 변경할 수 없다.
		
		
	}//main() end
}//class end
