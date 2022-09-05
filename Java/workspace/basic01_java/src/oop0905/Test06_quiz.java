package oop0905;

public class Test06_quiz {

	public static void main(String[] args) {
		// 			연습문제
		// 참조 : javascript 지폐 갯수 구하는 문제 (section_0804)
		/*
		 	  1년 : 365.2422···일
		 	  출력 결과 : 365일 5시간 48분 46초 
		 	  = 문제 = 2422일이 몇시간 몇분 몇초냐
		 	  - 나머지연산자 활용문제   
		 	  
		 	  <hint>
		 	  1분  = 60초
		 	  1시간 = 60분*60초 		  = 3600초
		 	  1일  = 24시간*3600초 	  = 86400초
		 	  1년  = 365.2422일*86400초 = 31566926.08초 
		 	  						  → 소수점 버림
		*/
		
		double year=365.2422;
		int total = (int)(year*86400);	// 31556926
										// 1년 
		int a = total/86400;
		System.out.println(a);			//365 (일)
	
		double b = year-365;			//0.24220000000002528
		System.out.println(b);			//여기서 시간을 뽑아내야는데... 
		

	}//main() end

}//class end
