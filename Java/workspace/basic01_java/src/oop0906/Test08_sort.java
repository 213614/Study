package oop0906;

public class Test08_sort {

	public static void main(String[] args) {
		/*
		 	● 정렬 Sort
		 		○ 오름차순 ascending
		 			: 1 → 10 / A → z / ㄱ → ㅎ
		 		○ 내림차순 descending
		 			: 10 → 1 / z → A / ㅎ → ㄱ 
		 		
		 		○ 삽입정렬 insertion sort  (기본)
		 		○ 선택정렬 selection sort  ★많이씀
		 		○ 버블정렬 bubble sort		 ★많이씀
		 	
		 		- selection sort의 알고리즘 
		 		임의의 숫자 9 8 7 6 5 → 오름차순 정렬 → 5 6 7 8 9
		 			: 첫번째 숫자(9)가 그 다음에 오는 수(8)와 크기 비교하여 정렬한다 
		 			= 9-8/9-7/9-6/9-5 : 첫 수(9)가 다음에 오는 수보다 작으면 맨 뒤로 이동
		 			= 9 8 7 6 5 : 9는 뒤에 오는 수들보다 크므로 정렬이 제대로 되지 않는다 
		 			: 정렬이 완벽히 되지 않으면 두번째 수(8)와 그 다음에 오는 수(7)와 크기 비교
		 			= 8-9/8-8/8-7/8-6/8-5 
		 			= 8 9 7 6 5 : 8이 9제외 다른 수들보다는 크므로 정렬 실패
		 			: 그 다음 수가 기준
		 			
		 			9 8 6 7 5
		 			8 9 7 6 5
		 			7 9 8 6 5
		 			6 9 8 7 5 
		 			5 9 8 7 6
		 			-------------- step 1 : 첫번째 수(9)가 기준
		 			5 8 9 7 6 
		 			5 7 9 8 6 
		 			5 6 9 8 7 
		 			-------------- step 2 : 두번째 수(8)가 기준
		 			5 6 8 9 7
		 			5 6	7 9 8
		 			-------------- step 3 : 세번쨰 수(7)가 기준
					5 6 7 8 9 
					-------------- step 4 : 네번째 수(6)가 기준 : 성공 
		 			
		 			→ 앞에서부터 정렬이 순차적으로 되어온다 
		 			→ 총 요소-1 단계에서 정렬이 완료된다 (5개요소면 4단계에서 완료)
		 */

		int[] su = {9, 8, 7, 6, 5};
		// 등수,로또번호와 비슷한 풀이 
		
		
	}// main end
}// class end