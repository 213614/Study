package oop0913;

public class Test04_ox {

	public static void main(String[] args) {
		// Q. 성적 프로그램에 ox 표시하기
		// → Jumsu클래스 생성 후 실습 

		/*
		 				** 시험결과 **
			====================================
			번호  이름   1  2  3  4  5  점수  등수      
			------------------------------------
			1   홍길동  O  X  O  O  O   80   2    
			2   무궁화  O  O  O  O  O  100   1
			3   라일락  X  X  X  X  O   20   5
			4   진달래  X  O  X  O  O   60   3
			5   봉선화  O  O  X  X  X   40   4
			------------------------------------ 

			- 맞은문제 O, 틀린문제 X표시 (answer[i]=답 이면 ox[i]=O/X대입?)
			- 점수: O당 20점씩 (for문 - if문; O면 score += 20;)
			- 등수: 점수를 기준으로 높은사람이 1등 (sort)
			- 동점자가 없다는 가정  
		*/

		/* 
	       1. 한명을 대상으로 성적구하기(참조용)
		Jumsu student = new Jumsu (1, "홍길동", 3, 4, 3, 3, 3);
		student.compute();
		student.disp();
		*/
		
		// 2. 다섯명의 성적 구하기
		Jumsu[] student = {
							  new Jumsu (1, "홍길동", 3, 4, 3, 3, 3)
							 ,new Jumsu (2, "무궁화", 3, 3, 3, 3, 3)
							 ,new Jumsu (3, "라일락", 1, 2, 4, 4, 3)
							 ,new Jumsu (4, "진달래", 2, 3, 1, 3, 3)
							 ,new Jumsu (5, "봉선화", 3, 3, 4, 1, 1)
		};
		// 2-1. OX와 점수계산
		int size = student.length;
		
		for(int i=0; i<size; i++) {
			student[i].compute();
		}
		
		// Q. student배열의 score를 기준으로 등수 구하기 (참조: JS\section_0809\04_성적프로그램.html)
        for(int i=0; i<size; i++){
            for(int j=0; j<size; j++){
                if(student[i].score < student[j].score){
                    student[i].rank += 1;
                }
            }
        }
        
        /* 강사님
        for(int a=0; a<size; a++) {
        	for(int b=0; b<size; b++) {
        		if (student[a].score < student[b].score) {
        			student[a].rank = student[a].rank + 1; 
        		}
        	}
        }
        */
		
        // 출력 (rank때문에 따로)
        System.out.println("     ** 시험결과 **	");
        System.out.println("==========================");
        System.out.println("번호 이름 1 2 3 4 5 점수 등수");
        System.out.println("--------------------------");
		
        for(int i=0; i<size; i++) {
			student[i].disp();
		}
		
        System.out.println("--------------------------");
		
	}//main()end
}//class end
