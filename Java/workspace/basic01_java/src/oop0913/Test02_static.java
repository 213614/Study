package oop0913;

import java.util.Calendar;

public class Test02_static {

	public static void main(String[] args) {
		/* 
		     static : 정적이다, 고요하다
		     	→ (자바 아니고) 메모리의 특징이다
		     	→ RAM에 저장되는 메모리 특징
		     	=> RAM에서 static부분에 해당 함수를 저장해달라는 뜻
		     	=> main함수를 static에 저장해주세요
		     	
		     	→ 변수(정적변수, 클래스변수), 함수 앞에 붙일 수 있음
		     	→ 메모리 생성 1번, 소멸도 1번
		     	→ new 연산자를 이용하여 별도의 객체를 생성하지 않고 사용가능하다
		     	
		     	=> 클래스명.변수    	로 접근가능 
		     	=> 클래스명.함수()		로 접근가능
		     	→ static은 클래스명으로 직접 접근 가능
		     	
		     	일반적 지역변수 : RAM - stack에 저장 : 휘발됨
		     	new로 참조변수 : RAM - heap에 저장
		     	
		
		
		//					↓ math는 클래스명.변수(함수())로 static을 가지고 있다 
		System.out.println(Math.abs(0));	// 클래스명.변수
		System.out.println(Math.abs(-2));	// 클래스명.함수
		
		// static은 오히려 new연산자를 사용하면 오류가 난다 = new Math();는 오류
		
		System.out.println(String.format("%.2f", 12.3456));
		*/
//---------------------------------------------------------------------------------
		
		// 급여 계산 : Sawon클래스 생성하고 실습 oop0913\Sawon.java
		// static 변수와 static함수는 클래스명으로 직접 접근 가능하다
		System.out.println(Sawon.COMPANY);
		System.out.println(Sawon.SUDANG);
		System.out.println(Sawon.TAX);
		Sawon.line();
		
		
	// 1. static의 특징을 적용하지 않은 경우 (error는 아니지만 비추)
		Sawon one = new Sawon("1001", "개나리", 100);
		// 세금
		double myTax = one.pay * one.TAX;	// 3
		
		// 총 지급액 = 급여 - 세금 + 수당
		int tot=(int)(one.pay - myTax + one.SUDANG); // 100 - 3 + 10
		
		System.out.println("회사 : " + one.COMPANY);
		System.out.println("사번 : " + one.sabun);
		System.out.println("이름 : " + one.name);
		System.out.println("급여 : " + one.pay);
		System.out.println("수당 : " + one.SUDANG);
		System.out.println("세금 : " + myTax);
		System.out.println("총 지급액 : " + tot);
		one.line();
		
		
	// 2. static의 특징을 적용한 경우 (추천)
	// → static 변수·함수는 이미 static메모리에 값이 올라와있기때문에 별도의 객체 생성하지않고 사용해도된다
	// → 별도의 객체 생성을 하겠다 = heap 영역을 거치겠다 
		Sawon two = new Sawon("1002", "진달래", 200);
		// 세금
		myTax = two.pay * Sawon.TAX;	
		
		// 총 지급액 = 급여 - 세금 + 수당
		tot=(int)(two.pay - myTax + Sawon.SUDANG); 
		//							→ static 변수
		System.out.println("회사 : " + Sawon.COMPANY);
		System.out.println("사번 : " + two.sabun);
		System.out.println("이름 : " + two.name);
		System.out.println("급여 : " + two.pay);
		System.out.println("수당 : " + Sawon.SUDANG);
		System.out.println("세금 : " + myTax);
		System.out.println("총 지급액 : " + tot);
		Sawon.line();		// static 함수
		
		
	// 3. static 변수의 연산 (continue) 
		Sawon kim = new Sawon("1003", "무궁화", 300);
		Sawon lee = new Sawon("1004", "봉선화", 400);
		
		System.out.println(kim.SUDANG);		// 10
		System.out.println(lee.SUDANG);		// 10
		
		// ↓ 이렇게 작성하는건 비추 
		kim.SUDANG = kim.SUDANG + 1;	
		System.out.println(kim.SUDANG); 	// 11
		
		lee.SUDANG = lee.SUDANG + 1;
		System.out.println(lee.SUDANG);		// 12가 나옴 (11+1)
		// → kim.sudang에 1을 더한값이 나옴 
		// heap은 new연산자를 사용하여 새로운 메모리를 할당하여 생성되지만 (그래서 값이 초기화, hascode주소값도 다 다름)
		// static은 해당 이름의 생성자가 있다면 새로운 메모리를 할당하지 않고 그냥 계속 사용된다
		// 그래서 kim.SUDANG에 + 1 된것이다.
		// = static은 하나의 주소로 공유된다는 뜻
		
		Sawon.SUDANG = Sawon.SUDANG + 1;	// 12+1
		
		System.out.println(Sawon.SUDANG); 	// 추천 → 어차피 연산 쌓이니까 따로 kim, lee 선언 필요치 않음
		System.out.println(kim.SUDANG);
		System.out.println(lee.SUDANG);
	
		// static = heap영역을 안 거치기(new연산자로 따로 선언하지않음)때문에 빠르다 
		//		  = 연산은 continue된다. (하나의 주소에서 계속 값을 가져오기때문에 연산이 쌓인다) 
		// 프로젝트 중 여러 페이지가 하나의 특정한 값(변수,함수)을 공유해야할 때가 생기는데 그때 static을 사용한다.
		
	}//main()end
}//class end
