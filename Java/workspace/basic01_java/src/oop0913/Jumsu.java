package oop0913;

public class Jumsu {
	// 한 사람에게 필요한 정보(공통된 정보)를 담고 그 이후 사람들은 객체 배열로 처리
	
	// 멤버변수 field
	private int no;						// 번호
	private String name;				// 이름
	private char[] ox = new char[5];	// OX(배열로잡기)
	
	// 답안지 제출용 변수도 있어야함(그래야 맞고틀리고를 표시하니까)
	private int[] answer = new int[5];
	
	public int score;					// 점수 
	public int rank;					// 등수
	
	
	// 생성자 함수 constructor
	public Jumsu() {} // 기본생성자
	public Jumsu(int no, String name, int a0, int a1, int a2, int a3, int a4) {
		this.no 	   = no;
		this.name 	   = name;
		this.answer[0] = a0;
		this.answer[1] = a1;
		this.answer[2] = a2;
		this.answer[3] = a3;
		this.answer[4] = a4;
		this.rank 	   =  1;
	}//end
	
	
	// 멤버 함수 method
	public void compute() {
		// 정답 
		int[] dap = {3, 3, 3, 3, 3};
		
		// Q. 정답(dap)과 제출한 답안지(answer)를 비교하여 OX를 구한 후 맞은 개수의 따라 점수+20 지급  
		for (int i=0; i<answer.length; i++) {
				if (answer[i] == dap[i]) {
					score += 20;
					ox[i] = 'O';
				} else { 
					ox[i] = 'X';
				}//if end
		}//for end
		
		// 강사님
		/*
				if(dap[0] == answer[0])
				if(dap[1] == answer[1])
				if(dap[2] == answer[2])
				if(dap[3] == answer[3])
				if(dap[4] == answer[4])
	
		for (int i=0; i<5; i++) {
			if (dap[i] == answer[i]) {	// 일치
				ox[i] = 'O';
				score = score + 20;
			}else {	// 불일치 
				ox[i] = 'X';
			}//if end
		}//for end
		*/
		
	}//compute() end
	
	public void disp() {	// 출력
		System.out.print(no    + " ");
		System.out.print(name  + " ");
		System.out.print(ox[0] + " ");
		System.out.print(ox[1] + " ");
		System.out.print(ox[2] + " ");
		System.out.print(ox[3] + " ");
		System.out.print(ox[4] + " ");
		System.out.print(score + " ");
		System.out.print(rank  + " ");
		System.out.println();
	}// disp()
	
}//class end
