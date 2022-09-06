package oop0906;

public class Test06_array {

	public static void main(String[] args) {
		/*
		 	● 【배열 Array】
		 	
		 	- 연속성 자료형, 열거형 자료형
		 	- ★하나의 변수에 1개 이상의 동일한 자료형의 값이 온다★
		 		→ 다른 자료형끼리는 class로 저장
		 		→ JS에서는 자료형이 달라도 가능했지만 JAVA는 안됨
		 	- element, 요소
		 	- index, 색인, 순서
		 	
		 	- 1차원 배열 : [열]
		 	 			 → 0행
		 	- 2차원 배열 : [행][열] 
		 				 → 행을 아파트 층수로 생각 
		 	- 3차원 배열(c언어에만 있고 java에는 없다) : [면][행][열] 
		 										→ 면을 아파트 동으로 생각
		 	
		 	- 배열을 쓸 때 메모리를 먼저 확보하고 연산해야한다 
		 	- new 연산자 : 메모리 할당(확보) 연산자 
		 
		*/
		
		// 	  ○ 1차원 배열
		
		// int kor=[]
		// kor변수에는 int형만 값을 넣을 수 있음
		// int 4bye

		int[] kor = new int[3];
					// 4byte짜리 int를 3개 확보한다는 뜻
					// 4*3=12byte를 kor 변수에 할당한다
		
		kor[0] = 10;
		kor[1] = 30;
		kor[2] = 50;
		System.out.println(kor[0]);
		System.out.println(kor[1]);
		System.out.println(kor[2]);
		
		/*
		System.out.println(kor[3]); 
		→ kor의 3번째 요소는 존재하지 않으므로 오류
		error code : Exception in thread "main" java.lang.ArrayIndexOutOfBoundsException: Index 3 out of bounds for length 3
				     at oop0906.Test06_array.main(Test06_array.java:45)
				   = 예외처리(오류)
		*/
		
		System.out.println(kor.length); // 3 : 배열 요소의 개수
		
		// 메모리 할당 및 초기값 지정
		int[] eng = {20, 30, 40}; 		// 열거형
		// →  eng라는 int형 배열안에 20,30,40 4byte짜리 3개를 한 배열로 묶는다 = 총 12byte
		// new int[3]과 같지만 new를 생략한 형태 
		
		// 다양한 자료형과 반복문과도 함께 쓰일 수 있다. 
		double[] aver = {1.2, 3.4, 5.6};
		for (int i=0; i<aver.length; i++) {
			System.out.println(aver[i]);
		}
		
		char[] ch = {'H','e','I','l','o'};
		for(int i=0; i<ch.length; i++) {
			System.out.println( ch[i]);
		}
		
		String[] name = {"개나리", "진달래", "무궁화"};
		for (int i=0; i<name.length; i++) {
			System.out.println(name[i]);
		}
		
//------------------------------------------------------------------------------------
			
		// 	  ○ 2차원 배열
		
		/*
		 	ex. 		mat(변수)
		 			10 	  20	30
		 			40	  50 	60
		 			
		 			10 → [0][0] : 0행의 0열 
		 			20 → [0][1] : 0행의 1열 
		 			30 → [0][2]	: 0행의 2열
					40 → [1][0]	: 1행의 0열
					50 → [1][1]	: 1행의 1열
					60 → [1][2] : 1행의 2열
					
					※ count는 0부터
		 */
		// → [행][열]
		// → 행, 줄, row
		
		// 2행 3열 
		int[][] mat=new int[2][3];		// 4바이트*6 = 총 24바이트 메모리 할당
		mat[0][0] = 10;
		mat[0][1] = 20;		
		mat[0][2] = 30;		
		mat[1][0] = 40;		
		mat[1][1] = 50;		
		mat[1][2] = 60;		

		for(int r=0; r<=1; r++) {
			for(int c=0; c<=2; c++){
				System.out.println(mat[r][c]);
			}
		}
		
		/*
		System.out.println(mat[4][4]);
		→ 예외처리 오류 (4행4열 값은 존재하지 않음) 
		: Exception in thread "main" java.lang.ArrayIndexOutOfBoundsException: Index 4 out of bounds for length 2
		  at oop0906.Test06_array.main(Test06_array.java:112)
		*/
		
		System.out.println(mat.length);			// 2 : mat배열의 행의 갯수 (0,1행 총 2줄)
		System.out.println(mat[0].length);		// 3 : mat[0]행의 열의 갯수 (10, 20, 30) : 0번 행의 요소 갯수라고 생각하면 편할듯
		System.out.println(mat[1].length);		// 3 : mat[1]행의 열의 갯수 (40, 50, 60)
		
		/* 
		 	 - 2차원 배열에서 각 행의 열의 갯수는 달라도 된다
		 	 - [0][0]
			 - [1][0][1][2]
			 - [2][0][1]
			 
			 이런식으로 가능하다
		*/
		// 2차원 배열에서 각행의 열의 갯수는 달라도 된다 → 알아서 메모리 할당을 한다
		int[][] music = {
							 {10, 20}				//[0][0]=10, [0][1]=20
							,{30, 40, 50, 60}		//[1][0]=30, [1][1]=40, [1][2]=50, [1][3]=60
							,{70, 80, 90}			//[2][0]=70, [2][1]=80, [2][3]=90 
		};
		
		System.out.println(music.length);		// 3
		System.out.println(music[0].length);	// 2
		System.out.println(music[1].length);	// 4
		System.out.println(music[2].length);	// 3
							//   ↑ 여기를 변수처리하면 반복문 가능
		
		int len = music.length;
		
		for(int r=0; r<len; r++) {
			int col = music[r].length;
				for(int c=0; c<col; c++) {
					System.out.print(music[r][c]+" ");
				}
			System.out.println();
		}
		
		
	}// main()end
}// class end
