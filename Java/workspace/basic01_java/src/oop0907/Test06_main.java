package oop0907;

public class Test06_main {
	public static void test() {
		/* 
		   main();		→ !error 
		 	 → 메인함수는 마음대로 호출 할 수 있는게 아님 = 사용자가 임의로 호출하지 못함
		 	 
		 	 ● Java Virtual Machine(JVM) : 자바 가상 머신
		 	 	: JVM만 있으면 OS(운영체재)상관없이 .class를 실행시킬 수 있다.
		 	 	: = 플랫폼이 독립되어져 있다.
		 	 	→ JVM이 구동될 때 main함수를 먼저 호출하고 그 이후에 실행된다.
		 	 
		 	 = main()은 JVM이 실행될 때 호출하는거지 사용자가 임의로 호출하는것이 아니다.
		 	 (main이 없으면 무시하고 실행된다 즉, main()이 늘 필수사항은 아니다)
		 	 
		 	 main함수는 cmd에서 건드려야한다
		 	  
		 */
	}//test end
	
	//					 ↓ 함수 명       ↓ = argument string : 전달문자
	public static void main(String[] args) { 
		/* 		   ↑ 리턴값X    ↑ 문자열형태로 받아온다(바꿀수없음) 
								= 일단 String으로 받을테니 니가 알아서 바꿔서 써라
		*/
		
		// 한글자연어처리패키지(자바class) : ai가 한글 품사를 분석해서 문장을 자연스럽게 꾸밈 
		
		/*
		  	main()함수가 호출되는 시점과 값을 전달하는 예제
			: default package에 있는 MainTest.java참조
           	→ 명령 프롬프트에서 실습
           	>cd\                    	최상위 루트 이동
            >i:                     	드라이브 변경
            >cd java202207          	폴더 변경
            >cd workspace
            >cd basic01_java
            >cd src
            >dir
           	>javac MainTest.java		자바 소스 컴파일
           	>java MainTest				자바 클래스 실행 
           	>java MainTest Seoul Jeju Busan
           								화면에 서울제주부산 출력됨
           								서울제주부산 = String[] args
           								
           	※.class파일 실행시 전달값은 main()함수의 매개변수가 받는다. 
		*/								
		
	}//main end
}//class end
