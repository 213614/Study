package oop0907;

import java.util.Arrays;

public class Test04_method {
	
	//						  ↓ 배열의 요소가 정수값이므로 그거에 맞춰서 자료형 넣으면 된다.
	public static void test1(int a, int b) {
		System.out.println(a);
		System.out.println(b);
	}//test1 end : call by value
	
	//							↓ 배열로 받으면 됨 a={10,20,30};
	public static void test2(int[] a) {
		for(int i=0; i<a.length; i++) {
			System.out.println(a[i]);
		}
	}//test2 end : call by reference 
	
	public static void test3(String a, String b) {
		System.out.println(a);
		System.out.println(b);
	}//test3 end
	
	public static void test4(String[] a) {
		for(int i=0; i<a.length; i++) {
			System.out.println(a[i]);
		}
	}//test4 end
	
	public static void test5(int a, int b) {
		System.out.println(a);
		System.out.println(b);
	}//test5 end
	
	public static void test6(int[][] a) {
		for(int i=0; i<a.length; i++) {
			int col = a[i].length;
			for(int j=0; j<col; j++) {
				System.out.println(a[i][j]);
			}
		}
	}//test6 end
	
	
	public static void main(String[] args) {
		/* 
		 	● 함수 호출 방식 
		       ○ call by value
		       			: 값에 의한 호출방식(값을 참조한다는 뜻) 
		       ○ call by reference 
		       			: 주소에 의한 호출방식(주소를 참조한다는 뜻)
		*/
		int[] num= {10, 20, 30};
		
		// call by value : 값에 의한 호출 방식 
		test1(num[0], num[2]); 		//10, 30
		
		// call by reference : 주소에 의한 호출 
		test2(num); 	// num배열의 모든 요소를 지칭함
						// = 배열 요소가 저장되어있는 주소를 지칭한다 = 배열 전체를 넘긴것
		
		String[] name = {"무궁화", "진달래", "개나리"};
		test3(name[0], name[2]); 	//무궁화,개나리
		test4(name);
		
		int[][] su = {		
				 {1, 2, 3}		// → 2행 3열 
				,{4, 5, 6}
		};
		
		test5(su[0][0], su[1][1]);		// 1, 5
		test6(su);
		
		System.out.println("--------------------------");
//-----------------------------------------------------------------------
		
		// selection/bubble sort를 직접 짜지않고 자바에서 제공되는 정렬class를 사용하면 된다.
		int[] lotto = {7, 3, 4, 15, 28, 13};
		Arrays.sort(lotto);		//1차원 배열을 오름차순 정렬해주는 함수
		
		for(int i=0; i<lotto.length; i++) {
			System.out.println(lotto[i]);
		}
		
	}//main end
}//class end
