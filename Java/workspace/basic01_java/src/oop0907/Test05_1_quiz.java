package oop0907;

public class Test05_1_quiz {
//강사님 코드 	
	public static double sd(int[] aver) {
		int size = aver.length; 	// 요소 5개
		
		// aver의 각 요소 누적의 합 
		double hap=0.0;
		for(int i=0; i<size; i++) {
			hap=hap+aver[i];
		}
		
		// aver 배열 요소들의 평균 구하기 (87.2)
		double avg = hap/size;
	 
		double sum = 0.0;	 // 편차들의 총 합
		for (int i=0; i<size; i++) {
			// aver 각 요소 - avg(각 요소들의 평균)
			double d = aver[i]-avg;
			
			// 위의 값을 양수로 변환(편차)
			d = Math.abs(d);
			
			// d(편차)를 누적하여 더한다
			sum += d;
		}
		
		// 표준 편차
		return sum/size;
	}
	
	
	public static void main(String[] args) {
		// 강사님 코드
		// Q1. 표준편차(Standard deviation) 구하기
				int[] aver= {85, 90, 93, 86, 82};
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

	}

}
