package oop0906;

public class Test05_quiz {

	public static void main(String[] args) {
		// Q1. 알파벳을 아래와 같이 한줄에 5개씩 출력하시오
		// → 알파벳이 한줄에 5개씩 출력 
        /*
        ABCDE
        FGHIJ
        KLMNO
        PQRST
        UVWXY
        Z
        */
		/* 실패^^! 다섯개씩 어케자르냐 
		for(char i='A'; i<='Z'; i++) {
			for(int a=0; a<5; a++) {
			System.out.print(i);
			}
			System.out.println(" ");
		}

		for(int a=0; a<5; a++) {
			for(char i='A'; i<='Z'; i++) {
			System.out.print(i);
			}
			System.out.println("");
		}
		*/

		// 강사님
		int count=0;
		for(char ch='A'; ch<='Z'; ch++) {
			count++; 
			System.out.print(ch);
			//(확인용)System.out.print(count);
			//A1B2C3D4E5F6G7H8I9J10K11L12···
			// → 5의 배수를 잡아서 그거마다 엔터들어가면 5개씩 잘림
			if(count%5==0) {
				System.out.println();
			}
		}
		
		System.out.print("\n");
//-----------------------------------------------------------------------------------------
		
		// Q2. 아래와 같이 출력하시오
		// → 빈곳은 공백문자
        /*
        ####
         ###
          ##
           #
        */		
		for (int a=1; a<=4; a++) {
			for(int b=1; b<=4; b++) {
				// 	b=0이면 맨앞에 공백문자들이 생김
				if (a>b) {
					System.out.print(" ");
				} else {
					System.out.print("#");
				}
			}
			System.out.println();	
		}//for end
		
		// 강사님
		for (int a=1; a<=4; a++) {
			for (int b=1; b<=4; b++) {
				if(a<=b) {
					System.out.print("#");
				}else {
					System.out.print(" ");
					// ("" ) 면 방향 반대로됨
				}
			}
			System.out.println();
		}//for end
		
		System.out.print("\n");
//-----------------------------------------------------------------------------------------
		
		// 이해가 안됨...다시 뜯어보자..흑흑..
		// Q3. 
		// → 분수 2/1 - 3/2 + 4/3 ··· 
		// → 결과값만 출력 
		/* 
        1   2    3    4    5      99
        ─ - ─ + ─ - ─ + ─ ...     ──   = ?
        2   3    4    5    6      100
		
		분자 a변수 / 분모 a+1
		*/
		
		// 강사님
		double hap=0.0;
		boolean flag=false;
		for(int a=1; a<=99; a++) {
			if(flag) {
				hap = hap - (a/(double)(a+1));
				flag = false;
			} else {
				hap = hap + (a/(double)(a+1));
				flag = true;
			}
		}
		System.out.println(hap);
		
		System.out.print("\n");
//-----------------------------------------------------------------------------------------
		
		// Q4. 아래와 같이 계산해서 출력하시오
		// → 중간에 ...은 그냥 문자로 출력 
        /*    
           1+....+10=55
           11+....+20=155
           21+....+30=255

           81+....+90=
           91+....+100=955   
        */
		/* 응실패
		for(int a=10; a<=100; a=a+10) {
			int sum=0;
			for (int i=0; i<=a; i++) {
				sum+=i;
			}
			System.out.println("1 + ... + " + a + " = " + sum );
			if (a>10) {
				for(int b=a+1; b<a; b++){
					sum+=b;
			System.out.println((a+1)+" + ... + " + a + " = " + sum );
				}	
			}
		}
		*/
		
		// 강사님
		int sum = 0;
		for(int a=10; a<=100; a+=10) {
			for(int b=a-9; b<=a; b++) {
				sum+=b;
			}//for end
			System.out.println((a-9)+"+ ... +"+a+"="+sum);
			sum=0;
		}// for end
		
		System.out.print("\n");
//-----------------------------------------------------------------------------------------
		
		// Q5. 어느 달팽이는 낮에는 3cm올라가고, 밤에는 2.5cm 내려온다고 할때
        //     달팽이가 13cm의 나무 꼭대기에 올라가려면 며칠이 걸리는지 구하시오
		// → 달팽이가 13cm 도달하면 안내려와도됨
		
		// 강사님
		int day=0; 			// 결과괎
		double snail=0.0;	// 달팽이
		
		while(true) {
			day++;
			snail += 3.0;
			if (snail>=13.0) {
				break;
			} else {
				snail -= 2.5;
			} // if end
		}//while end
		System.out.println(day+"일");
		System.out.print("\n");
		
		while(true) {
			day++;
			snail += 0.5;
			if (snail>=13.0) {
				break;
			}
		}
		System.out.println(day);
	}//main()end
}//class end
