package oop0915;

//			↓ extends Object 생략
class Parent {
	//field
	int one, two;
	
	//constructor
	public Parent() {}
	public Parent(int one, int two) {
		this.one = one;
		this.two = two;
	}

	//method 
	
}//parent.cla end

class Child extends Parent {
	// field
	int three;
	
	//constructor
	public Child() {
		super();	 // 생략가능
	}//default constructor end
	
	public Child(int a, int b, int c) {
		
		// super.one = a;
		// super.two = b; 
		// ※ ↑ 도 가능! 단 one, two  멤버변수가 private면 오류남

		super(a,b);
		// 매개변수 a와 b값을 부모 멤버변수 one,two에 넣는다 
		// 상속받은 멤버 변수(one,two)에 초기값 전달 
		this.three = c;

		
	}//Child() end
	
	
}//Child.cla end

public class Test02_super {

	public static void main(String[] args) {
		/*
		 	 super, super()  |   this, this()
		 	 		를 활용한 클래스 설계
		*/
		
		Child ch = new Child(10, 20, 30);
		System.out.println(ch.three);
		System.out.println(ch.one);
		System.out.println(ch.two);

	}//main() end
}//class end
