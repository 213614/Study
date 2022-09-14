package oop0914;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Jumin {
	//field
	private String juminno;		//주민등록번호
	
	//constructor
	public Jumin() {} 			//default 
	public Jumin(String juminno) {
		this.juminno = juminno;
	} //end
	
	//method
	public boolean validate() {
		boolean flag = false;
	
		//Q.주민등록번호가 올바르면 flag 변수값을 true로 바꾸기
		int[] gop = {2,3,4,5,6,7,8,9,2,3,4,5};	// 곱셈 수 
		int le = gop.length;
		int sum = 0; 							// 곱셈 결과를 더 할 변수 
		
		for(int i=0; i<le; i++) {
			sum += gop[i] *  Integer.parseInt(juminno.substring(i,(i+1)));
		}
		
		int a = sum%11; 	// 11로 나눈 나머지값 변수
		a = 11-a; 			// 11-나머지값 
		
		if (a>=10) {     
            a %= 10;
		}
		
		int le2 = juminno.length();
		flag = (a == Integer.parseInt(juminno.substring(le2-1))) ? true : false;
		/*
				if (a ==  Integer.parseInt(juminno.substring(le2-1))){
					flag = true;
				} else { flag = false; }	
		*/

		
		/*
		// 강사님 
		Integer[] CHEKNUM = {2,3,4,5,6,7,8,9,2,3,4,5};
		Integer[] save = new Integer[12];
		int hap = 0;
		int size = save.length;
		
		for(int i=0; i<size; i++) {
			int num=Integer.parseInt(juminno.substring(i,i+1)); 	//주민등록번호 한글자씩 잘라와서 형변환
			save[i] = num * CHEKNUM[i];		// 8*2
			hap += save[i];
		}// for end
		
		int M = (11-(hap%11))%10;		// 오류검증번호 
		if (M == Integer.parseInt(juminno.substring(12))) {
			flag = true;
		}
		*/
		
		return flag;
	}//validate() end
	
	
	public void disp() {
		// Q.생년월일, 성별, 나이, 띠 출력하기 
		/*	 
		 	  <sample>
        		 생년월일 : 1989년12월30일
        	 	 성별 : 남자
        		 나이 : 32   ->GregorianCalendar클래스 이용
        	 	 띠 :       ->태어난년도%12 (0원숭이 1닭 2개 ~~~~ 11양 : case문 사용)
		 */	
		int myear = 0; 	
		int mmon  = Integer.parseInt(juminno.substring(2,4));
		int mdate = Integer.parseInt(juminno.substring(4,6));
		int gen = Integer.parseInt(juminno.substring(6,7));

		if (gen == 1 || gen == 2) {
					myear = 1900 + Integer.parseInt(juminno.substring(0, 2));
		} else if (gen == 3 || gen == 4) {
					myear = 2000 + Integer.parseInt(juminno.substring(0, 2));
		}
	
		System.out.println(   "생년월일 : " + myear + "년 "
							+ mmon + "월 " 
				            + mdate +"일");
		
		if (gen%2 == 0) {
			System.out.println("성별 : 여성");
		} else {
			System.out.println("성별 : 남성");
		}
		
		GregorianCalendar now = new GregorianCalendar();
		int age = now.get(1) - myear;
		System.out.println("나이 : " + (age+1) + "세");		// 한국나이:age+1 | 만나이:age
		
        String[] ani12 = {"원숭이", "닭", "개", "돼지", "쥐", "소", "호랑이", "토끼", "용", "뱀", "말", "양"};
		System.out.println("띠 : " + ani12[myear%12]);
		// 참조: JS\section0810\01_요일구하기.html
		
		/*
		switch(myear%12) {
		case 0  : System.out.println("띠 : 원숭이");  break;
		case 1  : System.out.println("띠 : 닭"); 	   break;
		case 2  : System.out.println("띠 : 개"); 	   break;
		case 3  : System.out.println("띠 : 돼지");   break;
		case 4  : System.out.println("띠 : 쥐");    break;
		case 5  : System.out.println("띠 : 소");    break;
		case 6  : System.out.println("띠 : 호랑이"); break;
		case 7  : System.out.println("띠 : 토끼");   break;
		case 8  : System.out.println("띠 : 용");    break;
		case 9  : System.out.println("띠 : 뱀");    break;
		case 10 : System.out.println("띠 : 말");    break;
		case 11 : System.out.println("띠 : 양");    break;
		}
		*/
		
		
		/*
		// 강사님 
		GregorianCalendar now = new GregorianCalendar();
		int cYear = now.get(Calendar.YEAR);	// 2022
		
		int myCode = Integer.parseInt(juminno.substring(6,7));	// "1"→1 성별코드
		
		int myYear = 0, myMonth = 0, myDate = 0;
		myYear  = Integer.parseInt(juminno.substring(0,2));		// 89 출생년도
		myMonth = Integer.parseInt(juminno.substring(2,4));		// 12 출생월
		myDate  = Integer.parseInt(juminno.substring(4,6));		// 30 출생일
		
		switch(myCode) {
		case 1 : 
		case 2 : myYear = 1900 + myYear; break;
		case 3 :
		case 4 : myYear = 2000 + myYear; break;
		}
		
		int myAge = cYear - myYear; 	// 현재 나이

		String gender = ""; 
		switch(myCode%2) {
		case 0 : gender = "여자"; break;
		case 1 : gender = "남자"; break;
		}
		
		String[] animal = {"원숭이", "닭", "개", "돼지", "쥐", "소", "호랑이", "토끼", "용", "뱀", "말", "양"};
		
		System.out.println("주민등록번호: " + juminno);
		System.out.println("생년월일: " + myYear + "년" + myMonth + "월" + myDate + "일");
		System.out.println("나이: " + myAge);
		System.out.println("성별: " + gender);
		System.out.println("띠: " + animal[myYear%12]);
		*/
		
	}//disp() end
}//class end
