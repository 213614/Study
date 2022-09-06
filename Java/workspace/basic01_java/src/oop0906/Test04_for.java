package oop0906;

public class Test04_for {

	public static void main(String[] args) {
		// 반복문 
		
		// 1. for
		for(int a=1; a<=3; a++) {
			
			System.out.println("Java");
			
		}// for end
		
		// for문에 선언된 변수는 for문 안에서만 사용 가능
		//System.out.println(a); → error! 
		
		int b=0;
		for(b=1; b<=3; b++) {
			
			System.out.println("Python");
			
		}// for end
		
		//for문 밖에서 선언됐기때문에 사용가능 
		System.out.println(b);

//------------------------------------------------------------------------------------------
		
		// 2. while
		int i = 0;
		while (i<=3) {
			
			System.out.println("SEOUL");
			i++;
			
		}//while end
	
//------------------------------------------------------------------------------------------
		
		// 3. do ~ while
		int j=0;
		do {
			
			System.out.println("JEJU");
			j++;
			
		}while(j<=3);
		
//-----------------------------------------------------------------------------------------
		
		// 4. break 와 continue 
		for (int a=1; a<10; a++) {
			
			if (a==5) {
				break;		// a가 반복되다가 5가 되면 반복문을 빠져나온다 (1~4까지만 반복)
			}//if end
			
			System.out.println(a + " ");
			
		}//for end
		
		System.out.println("-------------------------");
		
		for(int a=1; a<10; a++) {
			
			if(a==5) {
				continue;	// a가 반복되다가 5가 되어도 반복을 계속한다 (1~9까지 반복)
			}//if end
			
			System.out.println(a+" ");
	
		}//for end

	}// main()end

}//class end
