package oop0907;

public class Test05_quiz {
	
				  // ↓ 배열이 리턴되려면 여기도 []추가하면됨 = double[]
	public static double sd (double[] a) {
		
		double av = 0.0;	// aver배열 요소의 평균값
		for(int i=0; i<a.length; i++) {
			av = av + a[i]; // aver의 요소 합을 av 변수에 저장
		} 					
		av = av/a.length; 	// aver의 평균값 = 87.2을 av에 저장
							// 5가 아니라 a.length로 나누면 더 알맞음! 
		
		for(int i=0; i<a.length; i++) {
			a[i] = a[i]-av;	// 각 요소에 평균을 뺀 값을 다시 a에 저장
			a[i] = Math.abs(a[i]);		// 절대값(전부 양수)로 다시 저장
		}
		
		double aav = 0.0;		// 편차
		for(int i=0; i<a.length; i++) {
			aav = aav + a[i];	// 절대값(원 요소에서 평균을 뺀 것의)끼리의 합을 저장
		}
		aav = aav/a.length;		// 평균편차(편차끼리의합/요소 총 갯수)
		return aav;
	}//aver평균값 
	
	public static void main(String[] args) {
		/*
		 	 빅데이터 
		 	 - 저장, 수입   : 크롤링(웹페이지분석), 데이터베이스(저장)
		 	 - 분석, 예측   : 통계학 전문지식 필요(회귀분석, 상관분석까지는 알아야함) : R program
		 	 - 비지니스 모델 : 
		 
		*/
		// Q1. 표준편차(Standard deviation) 구하기
		double[] aver= {85, 90, 93, 86, 82};
		// ↑ 원래 int인데 내가 계산하다보니 double로 돌려야해서 돌림(int는 오류남)
		double result = sd(aver);
		System.out.printf("표준 편차 : %.2f", result);
		
		
		/*
		 	표준편차 단계 
		 	1) aver의 평균을 구한다 = 87.2  (for문으로 돌리면서 변수하나 만들어서 거기다가 다 더하고(팩토리얼처럼)그걸length로 나누면되나)
		 	2) aver의 각 요소에서 평균값(87.2)를 뺀다
		 	   ex. 85 - 87.2  = -2.2
		 	       90 - 87.2  =  2.8
		 	       93 - 87.2  =  5.8 
		 	       86 - 87.2  = -1.2
		 	       82 - 87.2  = -5.2
		 		   → 음수와 양수가 섞여있음
		 	3) 뺀 값을 전부 양수로 바꾼다 → 편차  (절대값함수, 편차 값 저장할 변수도 필요)
		 						 2.2
		 						 2.8
		 						 5.8
		 						 1.2
		 						 5.2
		 	4) 위 편차들의 평균값을 구한다 → 표준편차 (1번처럼 풀이)
		 	   (2.2 + 2.8 + 5.8 + 1.2 + 5.2)/5 = 3.44
		*/

	}//main end
}//class end
