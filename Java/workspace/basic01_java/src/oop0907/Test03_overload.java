package oop0907;

public class Test03_overload {

	public static void hap (int a) {
		System.out.println(a);
	}//hap end
	
	public static void hap(int a, int b) {
		System.out.println(a+b);
	}//hap end
	
	public static void hap(double a) {
		System.out.println(a);
	}//hap end
	
	public static void hap(double a, double b) {
		System.out.println(a+b);
	}//hap end
	
	/*
	   !error! 함수의 리턴형은 메소드 오버로딩의 조건이 아님 	
	   public static int hap(double a, double b) {}
	 				  ↑ 원래 hap(void)과 다르게 리턴값이 있는 함수여도 
						매개변수가 전제조건이기때문에 매개변수가 같은 이상은 무조건 오류가 난다
	*/
	
	public static void main(String[] args) {
		/*
		  	 ● Method Overload
		  	 : 함수명을 중복하여 정의하는 것 ( = 함수명 중복사용이 가능해진다 )
		  	 ※ 변수명 말고 함수명~! 
		  	 
		  	 ※ method overloading의 《전제조건》
		  	 ★ 매개변수의 개수가 각각 달라야한다
		  	 ★ 매개변수의 자료형이 각각 달라야한다 
		  	 ex. hap1은 int 1개, hap2는 int 2개, hap3은 double 1개, hap4는 double 2개
		  	 → 그래야 함수 호출시 전달되는 값을 보고 알맞은 함수로 찾아간다.
		  	   ex. hap(2); → hap1 | hap(3.1, 0.1); → hap4 
		*/

		hap(3);
		hap(2, 4);
		hap(5.6);
		hap(9.8, 7.6);
		
		// 함수 문법 필수 숙지! 
		System.out.println(Math.abs(-3));		// int형	(기본형)
		System.out.println(Math.abs(4L)); 		// long형
		System.out.println(Math.abs(5.6f));	 	// float형
		System.out.println(Math.abs(7.8d));	 	// double형 (기본형이라 d 생략가능)
		
	}//main end
}//class end
