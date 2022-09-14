package oop0914;

// final class AA{}  → 종단클래스(앞에 final)는 상속받을 수 없다!  
class AA {
	private void zero() {}	// private는 외부 노출이 안되므로 상속되지않는다 
	public  void  one() {
		System.out.println("AA.one()...");
	}
	public  void  two() {
		System.out.println("AA.two()...");
	}
}//AA.class end


class BB extends AA {
//class 자식클래스명 extends 부모클래스명 {}  → 자식(sub)BB, 부모(super)AA
	
	public void three() {
		System.out.println("BB.three()...");
	}
	// AA.class를 상속받았기때문에 보이지는 않지만 one(),two()를 가지고 있다.
	
}//BB.class end

	
class CC extends BB {	// → 자식(sub)CC, 부모(super)BB
	
	public void four() {
		System.out.println("CC.four()...");
	}
	// BB.class를 상속받았기때문에 보이지는 않지만 [AA:one(),two()],three()를 가지고 있다.
	
}//CC.class end


/*
class DD {}
class EE extends AA, DD {}	→ !error : 클래스간의 상속은 단일 상속만 가능
※ class는 다중상속이 안됨 : class EE extends DD, AA 안됨! 
※ 다중상속하고싶으면 interface 사용 : interface DD {}
							   interface EE {}
							   class FF implements DD, EE,···.{}							   
※ extends와 implements 동시 사용 가능 : class FF extends BB implements DD,EE {}
참조 : https://m.blog.naver.com/highkrs/220224228913
*/

public class Test03_Inheritance {

	public static void main(String[] args) {
		/*
		 		★ 상속 ; Inheritance
		 		
		 		→ 클래스를 물려받는 것(나에게 맞게 재정의override 가능)
		 		→ 클래스 재활용
		 		→ 상속이 되면 관계가 형성됨 (부모-자식/조상-후손/super-sub)
		 		  : 관계가 성립되어야만이 다형성이 구현된다
		 		  
		 			
		 			○ extends		: 확장
		 				→ 자식클래스명 extends 부모클래스명 {}
		 			
		 			○ implements	: 구현
		 				→ 쓰이는 용어(문법)차이일 뿐 기능은 같다 
		 				→ implements로 상속받는것이 interface
		 			  	  = 인터페이스는 객체의 사용 방법을 정의한 타입으로 
		 			      interface를 implements(구현)한다고 이야기한다.
		 			      ★ 객체타입을 다양하게 변경 가능하므로 다형성을 구현하는데 매우 중요한 역할을 한다.
		 				  (참조 : https://m.blog.naver.com/snoopy12oyk/220782040836)
		*/
		
		AA aa = new AA();
		//aa.zero();  	   → !error : private속성은 클래스 내부에서만 접근 가능 
		aa.one();
		aa.two();
		
		System.out.println("----------------------");
		
		BB bb = new BB();
		//bb.zero();  	   → !error : private속성은 상속되지 않는다 (외부접근불가이기때문)
		bb.three();
		bb.one(); 		   // void-AA = 'void(리턴값X)속성이고, AA에서 상속됨' 이라는 뜻  
		bb.two(); 		   // void-AA = void(리턴값X) - AA에서 상속됨
		
		CC cc = new CC();
		cc.four();
		cc.three();		   // void-BB = void(리턴값X) - BB에서 상속됨 
		cc.one();		   // void-AA = void(리턴값X) - AA에서 상속됨 (BB가 이미 상속받은 상태였으므로)
		cc.two();		   // void-AA = void(리턴값X) - AA에서 상속됨 (BB가 이미 상속받은 상태였으므로)
		
		
	}//main() end
}//class end
