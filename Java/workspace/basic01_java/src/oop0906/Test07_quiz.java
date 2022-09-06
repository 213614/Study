package oop0906;

public class Test07_quiz {

	public static void main(String[] args) {
		// 2차원배열 관련 연습문제
		
		char[] ch = {'I','t','W','i','l','l'};
		int size = ch.length;  	// 6
		
		// Q1. 대·소문자의 갯수를 각각 구하시오
		// 	   → 대문자 2개 소문자 4개 
		int upp = 0; 	// 대문자
		int low = 0; 	// 소문자
		
		for (int i=0; i<size; i++) {
			if (ch[i]>='A' && ch[i]<='Z') {
				upp++;
			} else if(ch[i]>='a' && ch[i]<='z'){
					low++;
			} // if end
		}// for end
		
		System.out.println("대문자 " + upp +"개\n" + "소문자 " + low + "개");
		
		// 강사님 코드
		int upper = 0;
		int lower = 0;
		
		for (int i=0; i<size; i++) {
			if (ch[i]>='A' && ch[i]<='Z') { upper++; }
			if (ch[i]>='a' && ch[i]<='z') { lower++; }
		}
		System.out.println("대문자 " + upper +"개\n" + "소문자 " + lower + "개");
	
		//////////////////////////////////////////////////////////////////////
		
		// Q2. 대·소문자를 서로 바꾸어서 출력하시오  
		//	   → itWILL
		
		for (int i=0; i<size; i++) {			// %c 문자서식 %s는 문자열  
			if (ch[i]>='A' && ch[i]<='Z') {		// ↓ 이렇게 적으면 됨..좀 더 붙잡고풀자
						System.out.printf("%c", ch[i]+32);
			} else if(ch[i]>='a' && ch[i]<='z'){
					System.out.printf("%c", ch[i]-32);
			} // if end
		}// for end
		
		// 강사님
		for (int i=0; i<size; i++) {
		if (ch[i]>='A' && ch[i]<='Z') { System.out.printf("%c", ch[i]+32); }
		if (ch[i]>='a' && ch[i]<='z') { System.out.printf("%c", ch[i]-32); }
		} 
		
		System.out.println();
		///////////////////////////////////////////////////////////////////////
		
		// Q3. 모음의 갯수를 구하시오 (a e i o u A E I O U) 
		//     → 모음 : 2개  / 모음 배열을 만들어서 겹치면 카운트 올라가는걸로 하면 될듯 
		char[] vowels = {'a','e','i','o','u','A','E','I','O','U'};
		int count = 0;
		
		for(int i=0; i<size; i++) {
			for (int n=0; n<vowels.length; n++) {
				if(ch[i] == vowels[n]) {
						count++;
				}// if end
			}
		}//for end
		
		System.out.println("모음 " + count + "개");
		
		// 강사님 : 전부 소문자로 바꾼 후 소문자 모음과 비교 / 전부 대문자로 바꾼 후 대문자 모음과 비교 
		int mo=0;	// 모음갯수
		for(int i=0; i<size; i++) {
			char c = ch[i];
			if (c >= 'A' && c <= 'Z') { c = (char)(c+32); } // 소문자로 변경 
			
			switch(c) {
			case 'a' :
			case 'e' :
			case 'i' :
			case 'o' :
			case 'u' : mo++;
			}
		}// for end
		System.out.printf("모음의 갯수 : %d\n", mo);
		
//------------------------------------------------------------------------------------

		char[][] str= {
						{'Y','e','a','r'}
					   ,{'M','o','n','t','h'}
					   ,{'D','a','t','e'}
				
		};
		
		// Q4. 각 행의 모음의 갯수를 구하시오
		// → 0행 : 2개 / 1행 : 1개 / 2행 : 2개 
		/* 아예 예외처리 오류나서 풀이가 맞는건지도 못봄 : 107행
		int cnt0=0;		// 0행
		int cnt1=0;		// 1행
		int cnt2=0;		// 2행
				
		for(int i=0; i<13; i++) {
			for (int n=0; n<vowels.length; n++) {
				if(str[0][i] == vowels[n]) {
						cnt0++;
				} else if(str[1][i] == vowels[n]) {
						cnt1++;
				} else if(str[2][i] == vowels[n]) {
						cnt2++;
				}
			}
		}//for end
		System.out.println("0행 : " + cnt0 + "개");
		System.out.println("1행 : " + cnt1 + "개");
		System.out.println("2행 : " + cnt2 + "개");
		
		↓ 방법2를 좀 발전시켰어야했다! 
		
		for(int r=0; r<=str.length; r++) {
			for(int c=0; c<=str[r].length; c++){
				for (int n=0; n<vowels.length; n++) {
					if(str[r][c] == vowels[n]) {
							cnt0++;
					}
				}
			}
		}
		System.out.println(cnt0 + "개");
		*/
		
		// 강사님
		int row=str.length; 	// 3
		int cnt=0;
		
		for (int r=0; r<row; r++) {
			int col = str[r].length;		//length를 따로 변수지정을 해야하는구나..
			for (int c=0; c<col; c++) {
				char w = str[r][c];			// 요소값을 저장할 변수 w 
	
				if (w >= 'A' && w <= 'Z') { w = (char)(c+32); } // 소문자로 변경 
				
				switch(w) {
				case 'a' :
				case 'e' :
				case 'i' :
				case 'o' :
				case 'u' : cnt++;
				}//swi end
			}//for end						%d : 정수 / %f : 실수
			System.out.printf("\n str[%d]행 모음의 갯수 : %d 개", r, cnt);
			cnt=0; // 각 행마다 모음의 갯수를 구하기 때문에 cnt변수 초기화 필수(안그러면 계속 더해지니까)
		}//for end
		
		System.out.println();
		
//------------------------------------------------------------------------------------		
		
		int[][] num = {
				   		{4, 3, 2}
				   	   ,{5, 9, 1}
				   	   ,{6, 8, 7}
		};
		
		// Q5. 대각선 방향의 각 요소의 합을 구하시오 
		// ↘ 방향의 합 : 20 (4+9+7)	[0][0] + [1][1] + [2][2]
		// ↙ 방향의 합 : 17 (2+9+6)	[0][2] + [1][1] + [2][0]

		/* 아예 예외처리 오류나서 풀이가 맞는건지도 못봄 : 148행
		   행과 열의 숫자가 동일하면 suum 변수에 값을 저장 후ㅠ 그걸 다 합치고싶었음..
		int suum=0;
		for (int i=0; i<=10; i++) { 		
			for (int a=0; a<=num[i].length; a++) {
				if (i==a) {
					suum += num[i][a];
				}
			}
		}
		System.out.println(suum);
		*/
		
		// 강사님 
		int hap1=0;  	// 대각선 ↘
		int hap2=0;		// 대각선 ↙
		
		for(int i=0; i<num.length; i++) {
			hap1=hap1+num[i][i];
			hap2=hap2+num[i][2-i];  //2-i같은 생각을 어케하냐! 문제에서 규칙을 찾는게 중요! 
		}//for end
		
		System.out.printf("\n대각선 ↘의 합 : %d", hap1);
		System.out.printf("\n대각선 ↙의 합 : %d", hap2);
		
	}//main end
}//class end
