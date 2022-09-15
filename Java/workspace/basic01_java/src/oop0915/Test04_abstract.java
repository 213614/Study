package oop0915;

// ↓ 추상클래스 선언 형식 : 추상 메소드가 하나라도 있다면 맨 앞 abstract 
abstract class Animal{
	String name;

	void view() {} // 일반 메소드
	
	// ↓ 추상 메소드 선언 형식 : 맨 앞 abstract + 중괄호 없이 세미콜론 
	abstract void disp();   // 추상 메소드(중괄호body없음 = 미완성, 메모리 할당X)
	
}//ani.cla end


// 추상클래스도 클래스라서 상속가능 → 그런 용도로 쓰이는 클래스다 
class Elephant extends Animal {

	@Override
	void disp() {
		System.out.println("덤보");
	}
	// 추상클래스는 부모역할만 할수있다
	// 추상클래스를 상속받은 자식클래스는 *반드시* 추상 메소드를 완성해야한다.(★반드시 override를 해야한다)

}//Ele.cla end


class Fish extends Animal {
	
	// ↓ 부모(추상클래스)의 추상메소드 override 필수★
	@Override
	void disp() {
		System.out.println("니모");	
	} 
	
}//Fish.cla end


public class Test04_abstract {

	public static void main(String[] args) {
		/*
		      ● 추상 클래스 Abstract class
		    	  - 상속 extends
		    	  - 리폼 override
		    	  - 부모 super 
		    	  - 자신 this 
		    	  - 다형성
		    	→ 미완성 클래스(★keyword)
		    	  = 미완성이라 객체 생성을 할 수 없음(new연산자 직접 사용 불가) 
		    	  = 데이터 할당하지 않는다 
		    	→ 추상 method가 하나라도 있으면 추상클래스다(완전하지 않다는 뜻)
		    	※ 대체적으로 메이커측에서 제공되는게 추상클래스고 우리는 인터페이스를 주로 사용할거임
		    	→ 일반 method와 추상 method를 같이 선언 가능하다
		    	
		    	○ 추상 method 
		    	  → 미완성 메소드 
		    	  → 일반 메소드 : 모디파이어 리턴형 함수명(매개변수) {}			    		
		   		  → 추상 메소드 : 모디파이어 리턴형 함수명(매개변수); 
		   		  ∴ 중괄호가 없음 = 메소드의 body가 없는 함수 = 메소드를 선언만 해 놓은 상태 
		   		  (식당에서 메뉴판같다고 생각하면 됨)
		   		  
		    	○ 인터페이스 interface
		    	  → 추상 메소드'만' 선언 가능하다		    			   		
		    	  ※ 일반+추상메소드 = 추상클래스 / 추상+추상메소드 = 인터페이스 
		    	  (인터페이스는 자바 프로그래밍 언어에서 클래스들이 구현해야 하는 동작을 
		    	   지정하는데 사용되는 추상 자료형이다)
		    	   
		    	  → 프로젝트 진행시 구현하지 말아야할 것들이 있으므로 일정한 양식을 가진 구조화작업이 필요하다
		    	    그때 사용되는것이 인터페이스(or 슈펴인터페이스) = 프로젝트가 좀 더 견고해진다 
		    	
		 - static - 빠르다 / 연산이 continue된다 (★keyword)
		   
		*/
		
		// 추상클래스는 new연산자로 직접 객체 생성할 수 없다
		// Animal ani = new Animal(); 	→ !error
	
		Elephant dumbo = new Elephant();
		dumbo.disp();
		
		Fish nemo = new Fish();
		nemo.disp();
		
		// 다형성으로 접근
		Animal ani = new Elephant(); 
		// → 추상클래스는 new 연산자로 직접 객체 생성할 수는 없지만 자식클래스를 이용해 다형성으로 객체 생성을 할 수 있다
		// = 자식이 들어오면 부모가 형태를 바꾸기 때문에 disp()가 추상메소드가 아닌 값이 들어있는 상태(override된상태)로 바뀌기때문
		ani.disp(); 	// 덤보
		
		ani = new Fish();
		ani.disp(); 	// 니모 
		
		
		
		
	}//main() end
}//class end
