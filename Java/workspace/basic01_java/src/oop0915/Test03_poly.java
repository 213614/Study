package oop0915;


import java.util.Calendar;
import java.util.GregorianCalendar;

class Father {
	// field
	public String name = "아버지";
	public String addr = "주소";
	
	// constructor
	public Father() {}
	public Father(String name, String addr) {
		this.name = name;
		this.addr = addr;
	}//Father() end
	
	// method
	public void disp() {
		System.out.println(this.name);
		System.out.println(this.addr);
	}//disp() end
	
}//Father.cla end


class Son extends Father {
	
	public Son() {}
	public Son(String n, String a) {
		super.name = n;
		super.addr = a; 
	}
	
}//son.cla end


class Daughter extends Father {
	String friend = "친구";
	
	public Daughter() {}
	public Daughter (String n, String a){
		super(n,a);   //→ 부모생성자 함수 호출 
	}
	
}//Dau.cla end


public class Test03_poly {

	public static void main(String[] args) {
		/*
			 ● 다형 Polymorphism
			 = 형태가 여러가지  
			 
			   ○ 상속 관계에서의 다형성 
 			   → 부모 클래스의 관점에서 봐야한다(자식클래스들의 형태가 다 다르니까)
 			   → 같은 족보내에 있다면 클래스들간의 형 변환(타입 변환)을 유연하게 할수있다
 			   
 			   → class가 아닌 interface에서 사용하는것이 더 적합하다
 		
 			   EX. 
 			 	   GregorianCalendar now = new GregorianCalendar();
					   → = 를 기준으로 양 옆이 같았다 
				   Calendar cal = new GregorianCalendar();
					   → 양 옆이 달라도 같은 족보내에 있기때문에 사용 가능하다 (=다형성)
				   Number num = new Integer(5);
 			  
 			       ∴ = 을 기준으로 양 옆이 달라도 대입이 가능하다 : 오른쪽에 있는걸 왼쪽에 대입
 			  	     → 오른쪽이 자식 / 왼쪽이 부모 (아래 2.다형성을 이용 참고)
 			  
 			   → Spring(Framework)에서는 new 연산자도 없이 객체(object=instance=bean)생성을 할 수 있다
 			  	  
 			  	   
		*/
		
		// 1. 일반적 방식으로 객체 생성 → new 연산자 활용(Plain Old Java Object, POJO 방식)
		// 이젠 new보다는 bean으로 많이 씀(Spring)
		Father fa = new Father();
		fa.disp();
		
		Son son = new Son("아들", "영국");
		son.disp();
		
		Daughter dau = new Daughter("딸", "한국");
		dau.disp();
		
		System.out.println("-------------------------");
	
		
		// 2. 다형성을 이용한 객체 생성
		// → 자식클래스가 부모클래스에 대입 가능하다(부모님댁에 자식이 들어가는것)
		Father far = new Son("개나리", "역삼동");
		far.disp();  // son class가 "개나리","역삼동"을 가지고 father class로 들어가는것
					 // ★ 부모클래스는 대입된 자식클래스의 모양으로 스스로 형태를 바꾼다(다형성)
		far = new Daughter("진달래", "서초동");
		far.disp();
		
		System.out.println(far.name);	// 진달래
		System.out.println(far.addr);	// 서초동
		// 마지막에 대입된 자식의 값으로 바뀐 형태가 출력된다
		
		// 부모클래스가 물려준 변수(name, addr)가 아니면 다형성이 적용되지않는다
		// System.out.println(far.friend);   → !error		
		
		
		// 부모클래스도 자식클래스에 대입될 수 있지만 (문법적 오류는 아님) 데이터 손실 등 부정적 영향이 있다
		// → 단, 자식클래스의 모양으로 형변환해야한다. (Son/Daughter)father;
		Father father = new Father();
		Son so = new Son();
		
		father = so;		// 자식을 부모에 대입
		// so = father;     → !error
		so = (Son) father;	// 부모를 자식에 대입 단, 형변환이 필수다 | Exception error가 발생할수도있다
		
		double a=3.4;
		int b = (int)a; 	// b = 3 (a의 소수점이 버려짐)
							// 강제형 변환 = 부모가 자식에 대입될 때랑 같다 
		
		System.out.println("-------------------------");
		
		
		// EX. 
		Object obj = new Integer(5);	// object가 최상위 조상이라 가능함 (다형성, 자식이 부모에 대입)
		System.out.println(obj.toString());
		
		// Integer inte = obj;    		→ !error
		Integer inte = (Integer) obj;	// 다형성, 부모도 자식에 대입가능하지만 
										// 자식 클래스의 모양으로 강제형변환 필수
		
		obj = new Father();
		System.out.println(obj.toString());
		
		// ∴ 다형성 : 데이터가 손실되지않는 범위내에서 지원되는 method로 활용하면 된다
		
		
	}//main() end
}//class end 
