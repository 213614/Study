package oop0907;

public class Test02_method {
	
	//			   ↓ ★리턴값의 자료형을 여기다 넣어줘야함
	public static int test1(int a, int b) {
		int c = a+b;		// 6
		// return; → 리턴값 없는거(void)
		return c;	// 리턴값이 있는거(c) → 리턴값의 자료형을 void자리에 넣어주어야한다
					// 리턴값은 1개값만 가능하다 return c, a; 안됌! 
	}//test1 end
	
	public static String test2(int a) {
		if(a%2==0) { 
			return "짝수";	// 문자열값을 리턴하니까 String (문자는 char)
		} else {
			return "홀수";
		}//if end
	}//test2 end
	
	// 				↓ 모르겠으면 일단 void로 작성 후 리턴값에 맞게 수정
	//					if 조건문안으로 리턴되니까 boolean값으로 리턴해야함(true,false)
	public static boolean test3(int a) {
		if (a%4==0 && a%100!=0 || a%400==0) {
				 return true;
		} else { return false; }
	}//test3 end
	
	public static long test4(int a) {
		long b=1;
		for(int i=a; i>=1; i--) {
			b*=i; 	// b = b*i를 계속 누적
		}
		return b;
	}//test4 end
	
	public static long fact(int a) {
		if(a==0) {		// a가 0이면 1반환 
			return 1;
		} else {		// 호출값(5)*호출값-1(4)를 가지고 다시 a=4는 0인가 아니면 3과곱하고의 반복 
						// 값이 a==0이 될때까지 반복 | for문과 같다
			return a*fact(a-1);
		}// if end
	}//fact end
	
	
	
	public static void main(String[] args) {
		/* 
		  ●	【 Method 메소드 (함수) 】 
		
		JS → function
		DB → 프로시저 
		*/
		
		// ○ 리턴값이 있는 함수 : 반환값이 있음 
		//System.out.println(Math.abs(-3)); 		//-3의 절대값을 반환
		//System.out.println(Math.max(5, 7));		//7을 반환 (5와7중의 최대값 반환)
		
//		↓ 리턴값의 자료형과 통일시킨다 
		int result = test1(2, 4);	// 함수도 변수에 담을 수 있다
		System.out.println(result);

// 과정 : 호출시 2와 4를 가지고 함수로 감 → 함수에서 두 수를 더한 값을 c라는 변수에 저장 
//		 → return c니까 c값을 가지고 호출된 시점으로 다시 리턴 → 그 값을 저장한 result변수를 syso로 화면에 출력
//		 ∴ 2,4 를 함수에서 더한 후 c에 저장 → c가 그 값을 가지고 호출된 곳으로 돌아와서 result에 저장 
//		   → result(return c)를 화면에 출력 → 6이 화면에 출력됨 	
		
		
		// 값 : 상수값 ,변수값 ,리턴값 
		System.out.println(test1(5,6));
		
		System.out.println("------------------------------");
		
		// 짝수, 홀수 출력하기
		// ↓ 리턴 값의 자료형
		String str = test2(7);
		System.out.println(str);
		
		System.out.println("------------------------------");
		
		// 윤년확인하기
		if (test3(2022)) {
			System.out.println("윤년");
		} else {
			System.out.println("평년");
		}

		System.out.println("------------------------------");
		
		// 팩토리얼구하기
		long f=test4(5);
		System.out.println(f);
		
		System.out.println("------------------------------");
		
//------------------------------------------------------------------------------------

		// ○ 재귀적 함수 호출 : 내가 나를 부르는 것 
		
		// 팩토리얼값
		System.out.println(fact(5));
		
	}//main end
}//class end
