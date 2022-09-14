package oop0914;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class Test02_calendar {

	public static void main(String[] args) {
		/*
		 		● Calendar class
		 		  ○ 년/월/일
		 		  ○ 시:분:초
				  → GregorianCalendar
				  → Calendar 
				  → Date (동명의 패키지가 있으므로 주의해서 사용, 여기선 util패키지에 있는 것)
		*/
		
		GregorianCalendar now = new GregorianCalendar();
		
		System.out.println(now.get(1));		// 년 2022
		System.out.println(now.get(2));		// 월 8 (1월을 0번째로 계산하기때문에 -1로 나오므로 현재 월을 뽑으려면 +1)
		System.out.println(now.get(2)+1);	// 현재 월  9 
		System.out.println(now.get(5));		// 일 14

		System.out.print(now.get(Calendar.YEAR)+"/");			// 년 
		System.out.print(now.get(Calendar.MONTH));				// 월-1
		System.out.print("("+(now.get(Calendar.MONTH)+1)+")/");	// 현재 월
		System.out.println(now.get(Calendar.DATE));				// 일
		// → 2022/8(9)/14
		
		System.out.print(now.get(Calendar.HOUR)+":");
		System.out.print(now.get(Calendar.MINUTE)+":");
		System.out.println(now.get(Calendar.SECOND));
		// → 10:47:10
		
		System.out.println(now.get(Calendar.HOUR_OF_DAY));
		// → 24시간제 
		System.out.println(now.get(Calendar.DAY_OF_WEEK));
		// → 요일 (일1 월2 화3 수4 목5 금6 토7)
		
		
		// ○ 날짜 데이터도 연산 가능 
		// 오늘 날짜(now)에 3년 더하기
		now.add(Calendar.YEAR, 3);		// now.add(1, 3) : 년도는 1로 바꿔도 가능(월은 2)
		System.out.println(now.get(1));
		
		// 오늘 날짜에 5달 빼기 
		now.add(Calendar.MONTH, -5);
		System.out.println(now.get(2));
		
		
		// 오늘 날짜에 7일 더하기
		now.add(5, 7);
		System.out.println(now.get(5));
		
		// 날짜데이터 구성하기 : 1989년 5월 30일
		GregorianCalendar myB = new GregorianCalendar();
		myB.set(Calendar.YEAR, 1989);
		myB.set(Calendar.MONTH, Calendar.MAY+1); // → 그냥 may는 4월로 나옴 왠지는 모름
		//myB.set(Calendar.MONTH, 5);
		myB.set(Calendar.DATE, 30);
		System.out.println(
									myB.get(1)+"."
								  + myB.get(2)+"."
								  + myB.get(5)
						  );
		
		
	}//main() end
}//class end
