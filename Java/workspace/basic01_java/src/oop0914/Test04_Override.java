package oop0914;

class Korea{
	String name = "대한민국";
	final void view() {
		System.out.println("Korea.view()...");
	}
	void disp() {
		System.out.println("Korea.view()..." + name);
	}
}//Korea.class end

class Seoul extends Korea{}//Seoul.class end

class Busan extends Korea{
	String name = "부산광역시";	
	// "대한민국"은 사라지는게아니라 살아있음 단 우선순위가 아닐뿐 = 경우의 수가 늘어날 뿐 사라지는게 아님
	// 부모 클래스의 name 부르기 하면 "대한민국"을 불러 올 수 있다. = super.name 
	
	@Override		// ← annotation 	
	void disp() {
		System.out.println("Busan.disp()..." + name);
		super.disp();
	}
	/*
	 	@Override 
	 	void view(){}
	 	→ !error : final 메소드는 override할 수 없음 
	 */
	
}//Busan.class end



public class Test04_Override {

	public static void main(String[] args) {
		/*
		 	  ● Method Override 함수 재정의
		 	  	→ 상속관계에서만 사용 가능하다 
		 	  	→ 상속관계에서 물려받은 메소드를 재정의(수정, 리폼)하는 기능		 	  	 
		*/
		
		// ○ before override
		Seoul se = new Seoul();
		se.disp();
		se.view();
		
		// ○ after override
		Busan bu = new Busan();
		bu.disp();
		bu.view(); 	//→ final method는 상속은 가능하지만 override(리폼)할 수는 없다 

	}//main() end
}//class end
