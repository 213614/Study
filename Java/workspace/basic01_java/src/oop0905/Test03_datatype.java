package oop0905;

public class Test03_datatype {

	public static void main(String[] args) {
		// 자료형 datatype
		// JS는 타입을 지정하지 않아도 변수에 들어가면 알아서 정해지지만
		// Java는 자료형타입을 미리 필수로 지정해주어야한다★
		//    → 들어올 데이터의 형태를 미리 정해주는 것
		
		//	→ 기본 자료형 : 
		//	→ 참조 자료형 : class 
		
		// 1. 숫자형 
		
		// 1-1. 정수형 : 소수점이 없는 값
		
		//				↓ 데이터를 담을 수 있는 그릇의 크기 
		byte		// 1byte 할당
			a=1;
		short 		// 2byte 할당 → 사용하지 않음
			b=3;
		int			// 4byte 할당 → 가장 기본형
			c=5;
		long		// 8byte 할당
			d=7;
		// ∴ 유한한 값이라면 굳이 long으로 지정해서 데이터를 많이 잡아먹을 필요 없음
		// ex. 3 → 정수형, int : 아무말하지 않으면 가장 기본값인 int를 사용한다
		// ★ 자료형을 최소 한번은 선언을 하고 변수 사용해야한다
		
		System.out.println(a);		// 1
		System.out.println(b);		// 3
		System.out.println(c);		// 5
		System.out.println(d);		// 7
		
		// int c=9; → error! 변수의 자료형은 중복 선언 할 수 없다.
				
		
		// 1-2. 실수형 : 소수점이 있는 값 : byte → 소수점 뒤를 얼마나 길게까지 표현 가능한가 
		
		float			// 4byte할당 → 접미사 f 필수 추가 
			e = 1.2f;	
		double 			// 8byte할당 → 가장 많이 사용 : 접미사 d 생략 가능
			f = 3.4d; 
		
		System.out.println(e);
		System.out.println(f);
									// 가장 기본이 되는 자료형
		System.out.println(3);		// 정수형 int
		System.out.println(3.0);	// 실수형 double
		
//------------------------------------------------------------------------------------------------
		
		// 2. 문자형 : 작은 따옴표 ''로 감싸고 문자 1개만 저장 가능
		
		char			// 2byte 할당 : 한글가능(한글최소2byte)
			ch = 'T';
		System.out.println(ch);
		
			ch = '가';
		System.out.println(ch);
		// ∴ 영문은 1byte만 있어도 되기때문에 char는 너무 무거울 수 있음
		// 한글은 캐릭터(char)단위로 가져오지 않으면 깨진다.
		
		//※ error! 
		//  	ch = 'SKY';		→ 문자형인데 문자열 데이터가 들어감
		//		ch = ''; 		→ 빈 문자열
		
//------------------------------------------------------------------------------------------------
		
		// 3. 문자열형★ (문자형/문자열형 구분필수) : 큰 따옴표 ""로 감싼다
		
		String 		// ※ String은 참조형(class)이기때문에 S는 대문자로 쓴다 
			str = "KOREA";
		System.out.println(str);
		
			str = "A";
		System.out.println(str);
			
			str = "";	// 글자수 0개 
		System.out.println("#" + str + "#");
		
			str = " ";  // 글자수 1개(공백문자)
		System.out.println("#" + str + "#");
		
//------------------------------------------------------------------------------------------------
				
		// 4. 논리형 : boolean형 : 맞다 true / 틀리다 false
		boolean 
			flag = true;
		System.out.println(flag);
		
			flag = false;
		System.out.println(flag);
		
		System.out.println(true);		// boolean형 
		System.out.println("true");		// String 형
		
//------------------------------------------------------------------------------------------------
		
		// 연습 : 성적 프로그램
		String name = "무궁화";
		int kor=80, eng=95, mat=100;
		
		// 총합
		int tot = kor + eng + mat;
		
		// 평균
		double aver = tot/3;
		//		  int(tot)/int(3); :정수형끼리의 계산에서는 실수형이 나오지 않는다
		
		// 출력
		System.out.println("이름 : " + name);
		System.out.println("국어 : " + kor);
		System.out.println("수학 : " + mat);
		System.out.println("영어 : " + eng);
		System.out.println("총점 : " + tot);
		System.out.println("평균 : " + aver);
		// → java는 소수점값이 내림으로 알아서 나옴 : 원값 91.666- | aver 91.0
		
		
			
		
	}// main() end

}// class end
