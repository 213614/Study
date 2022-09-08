package oop0908;

import java.util.StringTokenizer;

public class Test03_String {

	public static void main(String[] args) {
		/*
		 	   문자열 클래스
		 	   JS.string 공부했던거 참조  
		*/
		String str="Happy";
		String name = new String("Happy");
		
		if(str==name) {
			System.out.println("같다");
		}else {
			System.out.println("다르다");
		}
 		// 같은 내용이 들어갔으니 같다라고 나와야하지만 "다르다"라고 출력된다.  
		// → 문자열의 내용을 비교하는 경우 == 연산자가 아닌 equals()함수를 이용해야한다.
		if (str.equals(name)) {
			System.out.println("같다");
		} else {
			System.out.println("다르다");
		}
		
		//문자열의 갯수가 0인가?
		if(str.isEmpty()) {
			System.out.println("빈 문자열");
		}else {
			System.out.println("아님");
		}
		
//------------------------------------------------------------------------------------
		
		// 특정 문자를 기준으로 문자열 분리하기 : str.split("e"); ← 안에 있는 문자를 기준으로 분리됨, 공백문자도 가능
	
		str = new String("Gone With The Wind");
		// 1.
		
		String[] word = str.split(" ");
		for (int i=0; i<word.length; i++) {
			System.out.println(word[i]);
		}
 	
		// 2. 생성자 함수 사용 
		StringTokenizer st = new StringTokenizer(str, " ");

		while(st.hasMoreTokens()){
			String tk_next = st.nextToken();
			System.out.println(tk_next);
		}
		
		// 강사님
		while(st.hasMoreTokens()) { // 문자열에서 왼쪽에서 오른쪽으로가면서 지정한 문자를 기준으로 분리한다 
									// → 더이상 나눌게 없을때까지 (있으면 true 없으면 f)
			System.out.println(st.nextToken());	// 토큰한 문자열(분리한 문자열) 가져오기 
		}// while end 
	  	
//------------------------------------------------------------------------------------

		// 문자열 연산 속도 
		// String < StringBuffer < StringBuilder (가장빠름)
		// 버퍼랑 빌더는 큰 차이 없음
		
		// 문자열 연산
		String s1 = "";
		System.out.println(s1.length());        // 0 (""는 0개 " "은 1개)
		
		s1 = s1+"one";  // s1변수에 one이라는 문자열을 추가한후 다시 s1변수에 담는다
		System.out.println(s1.length()+s1);		// 3(글자개수)one
		
		s1 = s1+"two";  	
		System.out.println(s1.length()+s1);		// 6onetwo
	
		s1 = s1+"three";  
		System.out.println(s1.length()+s1);		// 11onetwothree

		// 모든 문자열 지우기(빈 문자열 대입)
		s1="";
		System.out.println(s1.length()+s1); 	// 0
		
//------------------------------------------------------------------------------------
		
		StringBuilder s2 = new StringBuilder();
		
		s2.append("Seoul");
		System.out.println(s2.length()+s2.toString());	// 5(글자개수)Seoul
		
		s2.append("Jeju");
		System.out.println(s2.length()+s2.toString());	// 9SeoulJeju
		
		s2.append("Busan");
		System.out.println(s2.length()+s2.toString());	// 14SeoulJejuBusan
		
		// 모든 문자열 지우기
		s2.delete(0, s2.length());		    // 0번째부터 마지막글자까지 지우기
		System.out.println(s2.length());    // 0
		
//------------------------------------------------------------------------------------		
		
		StringBuffer s3 = null;  	// 메모리할당 하지않음(null)
		//System.out.println(s3.length());  	// !NullPointerException
		
		
	}//main() end
}//class end
