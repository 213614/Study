package oop0920;

import java.io.FileReader;

public class Test02_input {

	public static void main(String[] args) {
		// 2. char 기반 → 2바이트 할당 → 한글 안깨짐 
		String filename = "I:/java202207/workspace/basic01_java/src/oop0920/data.txt";
		FileReader fr = null; 	// 초기값은 null
		
		try {
			
			fr = new FileReader(filename);
			while(true) {
				int data = fr.read(); //char기반이라 2바이트를 불러옴
				if (data == -1) {
					break;
				}
				//System.out.println(data);	  → int 리턴이라 숫자로 출력됨
				System.out.printf("%c", data);
				//FileReader는 char기반(2바이트할당)이라서 int→char로 형변환(%c)해도 한글이 깨지지 않는다 
			}
			
		} catch(Exception e) {
			
			System.out.println("파일 불러오기 실패 " + e);
			
		} finally {
			
					try {
						if(fr != null) { fr.close(); }
					} catch (Exception e) {}
		}
		
		
	}//main() end
}//class end
