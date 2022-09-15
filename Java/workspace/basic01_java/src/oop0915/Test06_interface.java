package oop0915;


interface Creature {
	
	 // void disp() {} → !error : 일반 메소드는 interface에서 오류
	
	 abstract void kind();
	
	 void breath();
// ↑ interface 자체가 추상 메소드만 올 수 있기 때문에 *abstract을 생략해도 된다* 
	
}//interface end


// 클래스 입장에서 상속받을 부모가 클래스    : extends 확장
// 클래스 입장에서 상속받을 부모가 인터페이스 : implements 구현

//형식) 클래스 클래스명 implements 부모인터페이스명 {부모의 추상메소드 override}
class Tiger implements Creature {

	@Override
	public void kind() {
		System.out.println("포유류");
	}

	@Override
	public void breath() {
		System.out.println("코");
	}
	
}//Tig.cla end

class Salmon implements Creature {

	@Override
	public void kind() {
		System.out.println("어류");
	}

	@Override
	public void breath() {
		System.out.println("아가미");
	}
	
}//Sal.cla end


public class Test06_interface {

	public static void main(String[] args) {
		/*
		 	● 인터페이스 Interface
		 	  - 추상 메소드로'만' 구성되어 있다.
		 	  - 추상 클래스보다 더 추상화 되어져 있다
		 	  - 상속 : extends 확장  |  implements 구현
		 	  - 필수로 구현해야하는 함수 목록들을 인터페이스에 몰아놓고 override로 사용한다 
		 	    → 하나라도 빼먹으면 오류가남 = 정밀한 코딩 가능 = 페이지들간의 구조화(부모가 같다는 공통점을 이용)
		*/
		
		// 인터페이스는 직접 객체 생성 불가능(미완성, 추상메소드)
		//Creature cre = new Creature();    → !error 
		
		// 인터페이스에서의 다형성 : 인터페이스는 클래스와 다르게 크게 형변화할 수 없기때문에 다형화가 주로 사용된다
		Creature cre = null;
				
		cre = new Tiger();
		cre.kind();				// 포유류
		cre.breath();			// 코
		
		cre = new Salmon();
		cre.kind();				// 어류
		cre.breath();			// 아가미
		
		
	}//main() end
}//class end
