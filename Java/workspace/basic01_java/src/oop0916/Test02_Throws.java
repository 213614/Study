package oop0916;

class Test {
	/*
	// 1. 각각의 try~catch문을 직접 이용한 예외처리 → 코드가 너무 길어지기때문에 추천하지는 않는다(사용하지않는것은 아님)
	public void view() {
		try {
				int a = 3/0;
			
		}catch(Exception e) {
			System.out.println(e);
		}//end
	}//view() end
	
	public void disp() {
		try {
				int a = Integer.parseInt("KOREA");
			
		}catch(Exception e) {
			System.out.println(e);
		}//end
	}//disp() end
	*/
	
	// 2. throws를 이용한 예외처리 = 코드가 좀 더 간략해짐, 함수 옆에 함께 작성해야함
	public void view() throws Exception {
		int a = 3/0;
	}//view() end
	
	public void disp() throws NullPointerException, NumberFormatException {
		int a = Integer.parseInt("KOREA");
	}//disp() end
	
	
	// OS가 개입해서 문제가 발생하지않도록 조정하는 기법 = 함수 안에 함께 작성해야한다
	public synchronized void login() {
			// 로그인 함수는 여러사람이 동시다발적으로 사용하기때문에 오류 발생 가능성이 크다 (트래픽초과 등)
			// 모든 오류를 웹서버가 잡지 못한다 그럴땐 OS(운영체제)가 좀 잡아줘야함 = synchronized
		
	}//login() end
	
}//Test.cla end

public class Test02_Throws {

	public static void main(String[] args) {
		/*
		 	  ● Exception - Throws문(; 던지다 - 받는건 try~catch문으로)
		 	  	  - 메소드(함수) 호출 시 예외처리를 한꺼번에 모아서 처리
		 	  
		 	  → try ~ catch(~ finally)문이 너무 많이오면 코드가 길어지기때문에 throws를 사용한다
		 	    (많이 사용하지는 않는다)
		*/
		
		// ★ throws가 있는 함수는 호출할때 try-catch문으로 호출한다.
		try {
				Test t = new Test();
				t.view();
				t.disp();
		} catch(Exception e) {
			System.out.println(e);
		}//end
		
		
		
	

		
		
	}//main() end
}//class end
