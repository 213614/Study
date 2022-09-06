package oop0906;

public class Test02_math {

	public static void main(String[] args) {
		// ● Math 수학 관련 클래스
		System.out.println(Math.E);
		System.out.println(Math.PI);
		
		// 절대값
		System.out.println(Math.abs(3));			
		System.out.println(Math.abs(-3));
		System.out.println(Math.abs(2.4));
		System.out.println(Math.abs(-2.4));
		System.out.println("-------------------------");
				
		System.out.println(Math.ceil(1.3));			// 2.0 : 소수점 올림
		System.out.println(Math.floor(2.7));		// 2.0 : 소수점 내림
		System.out.println(Math.round(3.8));		// 4   : 반올림
		System.out.println("-------------------------");
		
		System.out.println(Math.max(3, 5));			// 최대값
		System.out.println(Math.max(1.2, 3.4));
		System.out.println(Math.min(6, 7));			// 최소값 
		System.out.println("-------------------------");
		
//------------------------------------------------------------------------------------
		
		// 난수 : random값, 무작위로 발생한 값
		// 난수 발생 범위 : 0.0 <= r < 1.0
		
		// 예제 : 주사위 수의 범위 : 1~6
		System.out.println((int)(Math.random()*6)+1);
		
		// 예제 : 로또번호 범위 : 1~45
		System.out.println((int)(Math.random()*45)+1);
		
		
		
	}

}
