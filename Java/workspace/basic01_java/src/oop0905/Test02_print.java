package oop0905;

public class Test02_print {

	public static void main(String[] args) {
		// ★ class명의 첫 글자는 대문자로 한다 ★
		
		// syso 컨트롤 스페이스 : 출력 명령어 단축키
		
		System.out.print(123);
		System.out.print(456);
		System.out.print(789);
		// println < ln을 지우면 엔터없이 한줄에 쭉 출력 
		
		System.out.println();     // 콘솔창에서 줄바꿈
		
		System.out.println(123);
		System.out.println(456);
		System.out.println(789);
		// ln이 있으면 자동 줄바꿈(엔터) 
		
		// 문자  : 문자 하나하나  : '' 
		// 문자열 : 문자가 모인것  : "" 
		// ★ 따옴표 조심 ★
		
		System.out.println("JAVA");
		System.out.println("Python");
		System.out.println(123);	   		// 숫자형
		System.out.println("456");	   		// 문자열형
		
		// " ' \ 등을 단순 기호로 인식하고자 할 때 : 따옴표 안에 역슬래쉬와 함께 쓴다
		System.out.println("\"");			// "
		System.out.println("\'");			// '
		System.out.println("\\");			// \
		
		// + 연산자
		System.out.println(123+456);		// 579
		System.out.println("123"+"456");	// "123456"
		System.out.println(123+"456");		// 123"456"
		System.out.println("123"+456);		// "123"456
		System.out.println("123+456");		// "123+456"
	}// main()end

}// class end
