package oop0905;

public class Test05_conversion {

	public static void main(String[] args) {
		// 자료형 변환 (Data type Conversion)
		
		// 1. 자동형 변환
		/*
		 	정수형 : byte < short < int < long
		 	실수형 : float < double
		 	
		 	정수형과 실수형 연산은 자동으로 실수형으로 변환된다
		 	(정수형끼리의 연산은 실수형이 나올 수 없다
		 	 실수형 값을 뽑아내려면 실수형으로 연산해야 한다 ex.5.0/3.0)
		*/
		byte a = 3;
		int  b = a; 		// 자동형 변환 byte → int
		
		long c = b; 		// 자동형 변환 int → long
		
		// a = c; → error! 좌우 변수의 데이터타입이 동일해야한다.
		
		float  d = 3.4f;
		double e = d;		// 자동형 변환 float → double
		
		int kor=80, eng=95, mat=100;
		
		System.out.println((kor+eng+mat)/3);	// 91
							// 실수형으로 절대 값이 나오지 않음
		
		System.out.println((kor+eng+mat)/3.0);	// 91.66666666666667
		System.out.println((kor+eng+mat)/3.);	// 91.66666666666667
							// 정수형과 실수형의 연산이라 값이 실수형으로 나옴
		
//------------------------------------------------------------------------------------------------		
		
		// 2. 강제형 변환(필요에 의해) : cast 연산
		/*
		 	필요한 곳에서 일시적으로 변환
		 	형식 :
		 			(자료형)값 → (int)3.5;
		*/
		System.out.println((int)3.5);				// 3
		System.out.println((double)4);				// 4.0
		System.out.println((int)2.6 + (int)5.7);	// 2 + 5 = 7
		System.out.println((int)(2.6 + 5.7));		// (int)(8.3) = 8
		// ※괄호의 위치를 주의하자 
		
		//ASCII(American Standard Code for Information Interchange)
        //->문자를 숫자로 기억하기 위한 총 128개의 부호
        //->미국 ANSI에서 표준화한 정보교환용 7비트 부호체계
        //->키보드에 있는 자판은 대부분 아스키코드값이 존재하고, 프로그래밍에서 활용할 수 있다.
		System.out.println((int)'A');		// 65
		System.out.println((int)'B');		// 66
		System.out.println((int)'C');		// 67
		
		System.out.println((int)'a');		// 97
		System.out.println((int)'b');		// 98
		System.out.println((int)'c');		// 99 
		
		System.out.println((char)65);		// A
		System.out.println((char)66);		// B
		System.out.println((char)67);		// C
		// ★아스키 코드값은 String아니고 char(작은따옴표사용)★
		System.out.println((char)97);		// a
		System.out.println((char)98);		// b
		System.out.println((char)99);		// c
		
		// 공백,엔터 아스키코드값은 사용할 때가 있으므로 알아두기 
		System.out.println((int)' ');		// 32 공백
		System.out.println((int)'\r');		// 13 엔터
		
		System.out.println('A'<'a');		// true : 65 < 97
		System.out.println('A'-'a');		// -32	: 65 - 97
		System.out.println('A'+'a');		// 162  : 65 + 97
		
		// 예제. 임의의 문자가 소문자인지 확인하시오
		char ch='B';		// ↓ ch변수가 소문자인가요?
		String result = (ch>='a' && ch <='z') ? "소문자" : "기타" ;
		System.out.println(ch + " = " + result);
		
	}// main()end

}// class end
