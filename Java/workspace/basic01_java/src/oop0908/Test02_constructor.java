package oop0908;

import java.util.GregorianCalendar;

class School {
	// 멤버변수 field : 보통 프라이빗으로 정보를 은닉해놓는다.
	private String name; 
	private int kor, eng, mat;
	private int aver;
	
	// 생성자함수 constructor : 클래스명과 동일한 함수, 리턴형이 없다 : public void School(){} 주의!(error는 안나는데 오류임)
	public School() {	// 기본 생성자 함수 default constructor
						// void 작성하지 않는다
						// 자동으로 생성되어 있음 (코드로 적혀있진않지만 기본으로 생성됨)
		System.out.println("School() 호출");
	}
	//	 - 생성자 함수도 오버로딩(함수명 중복정의) 가능 : 매개변수만 다르면 함수명은 중복사용이 가능하다
	public School(String n) {
		name = n;
	}
	public School(int k, int e, int m) {
		kor = k;
		eng = e;
		mat = m;
	}
	public School(String n, int k, int e, int m) {
		name = n;
		kor  = k;
		eng  = e;
		mat  = m;
	}
	
	// 멤버함수 method
	void calc() {
		aver=(kor+eng+mat)/3;
	}//calc end
	
	public void disp() {
		System.out.println(name);
		System.out.println(kor);
		System.out.println(eng);
		System.out.println(mat);
		System.out.println(aver);
	}//disp end
	
}//class end

public class Test02_constructor {

	public static void main(String[] args) {
		/* 
		 	생성자 함수(Constructor)
		   → 클래스 명과 동일한 함수
		   → new 연산자와 함께 메모리 할당할 때 사용한다
		   → 오버로딩 가능 
		   
		   	소멸자 함수(Destructor)
		   → 가비지 콜렉팅(Garbage Collecting) 
		   → 자바는 JVM이 자동으로 메모리 회수를 하므로 소멸자 함수가 없다
		*/
		/*
		// ○ 생성자 함수 : 메모리를 생성했다는 뜻, 어딘가에 주소가 발생함
		//				주소값을 변수에 저장하면 접근이 쉬워짐
		new GregorianCalendar();
		GregorianCalendar today = new GregorianCalendar();
		
		if(today.isLeapYear(2022)) {
			System.out.println("윤년");
		} else { 
			System.out.println("평년");
		}//if end
		
		// Q. 서기 1년 ~ 서기 2022년의 윤년 갯수를 구하시오
		// 그레고리안 클래스 활용
		int count1 = 0;
		for(int i=1; i<=2022; i++) {
			if(today.isLeapYear(i)) {
				count1++;
			}
		}
		System.out.println(count1);		// 502
		
		// 윤년 구하는 공식 활용
		int count2 = 0;
		for(int i=1; i<=2022; i++) {
			if(i%4==0 && i%100!=0 || i%400==0) {
				count2++;
			}
		}
		System.out.println(count2);		// 490
		*/
		
//------------------------------------------------------------------------------------
		
		//new School();	    객체 Object = 인스턴스 Instance
		//new School();
		/*
		School one = new School(); 	// ex. #100번지
		System.out.println(one.hashCode());
		one.calc();
		one.disp();
		
		// null : 비어있는 값 
		String a = new String();	// 메모리 할당 받음 = String a = "";
		String b = null;  			// 메모리 할당을 하지않고 b라는 참조변수에 null값을 줄 수 있다
		
		System.out.println(a.length());		// 글자갯수 0 : 메모리 할당받은게 있어서 length가 먹힘
		System.out.println(b.length());		// !NullPointerException : 어딘가에 null값이 있어서 오류다
		
		System.out.println("null");     // 문자열 상수
		System.out.println(true);  		// boolean형
		System.out.println("true"); 	// 문자열 상수
		*/
		
//------------------------------------------------------------------------------------
		
		// 생성자 함수의 전달값은 객체 선언과 동시에 초기값을 함께 전달해주는 역할을 한다
		// new School(); 이렇게하면 빈 메모리만 잡힘
		School two = new School("개나리"); // → 개나리라는 초기값을 함께 전달해줌
		two.calc();
		two.disp();
		
		School three = new School(10, 20, 30); // → 국영수 초기값을 함께 전달 
	   //자료형 참조변수명 = 메모리할당 생성자함수명(초기값);
		three.calc();
		three.disp();
		
		School four = new School("진달래", 40, 50, 55);
		four.calc();
		four.disp();
		
		// 생성자 함수가 많다 = 다양한 상황에 대처가 가능하다
		
//------------------------------------------------------------------------------------

		// ↓ 두개가 같은 표현이니 선택해서 사용
		String str1 = "손흥민";		// 단 자바에서 자주쓰기때문에 허용하는거지 모든 클래스에서 가능한 표현은 아님
		String str2 = new String("박지성");
		System.out.println(str1);
		System.out.println(str2);
		
		
		
		
	}//main end
}//class end
