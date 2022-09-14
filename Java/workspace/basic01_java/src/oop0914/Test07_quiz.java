package oop0914;


public class Test07_quiz {

	public static void main(String[] args) {
		// Q. 주민등록번호의 각 숫자의 합 (character class, charAt() 활용)
		// → 8+9+1+2+3+0+1+2+3+4+5+6+7
		String jumin = "8912301234567";
		int sum = 0; 
		
		for(int i=0; i<jumin.length(); i++) {
			sum += Integer.parseInt(jumin.substring(i,(i+1)));
		}
		
		System.out.println(sum);
			
		// Q. 대소문자를 서로 바꿔서 출력 (character class, charAt() 활용)
		// → gONE wITH tHE wIND
		String str = "Gone With The Wind";
		char c = 0;
		/* 뭔진모르겠는데 무한반복오류남
		for(int i=0; i<str.length(); i++) {
				c = str.charAt(i);
			if (Character.isUpperCase(c)) {
				str += Character.toLowerCase(c);
			} else if (Character.isLowerCase(c)) {
				str += Character.toUpperCase(c); 
			}
		}// for end
		*/
		
		for (int i=0; i<str.length(); i++) {	
				c = str.charAt(i);
			if (c >='A' && c <='Z') {		// ↓ 이렇게 적으면 됨..좀 더 붙잡고풀자
						System.out.printf("%c", c+32);
			} else if(c >='a' && c <='z'){
					System.out.printf("%c", c-32);
			} // if end
		}
	

	}//main() end
}//class end
