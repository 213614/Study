package oop0920;

import java.io.BufferedReader;
import java.io.FileReader;

public class Test03_input {

	public static void main(String[] args) {
		// 3. 메모장 파일의 내용을 엔터 단위로(=한줄씩) 부르기
		String filename = "I:\\java202207\\workspace\\basic01_java\\src\\oop0919\\Buyer.java";
		FileReader fr = null;
		BufferedReader br = null;
		
		try {	
			// 3-1. 파일 가져오기
			fr = new FileReader(filename);
			
			// 3-2. 파일 내용 읽기
			br = new BufferedReader(fr);
			
			// 행번호
			int num = 0; 
			
			while(true) {
				// 3-3. 줄바꿈(엔터)를 기준으로 한줄씩 불러오기 = 한줄 읽고 커서가 다음으로 움직임
				// readLine(); = '\n'(줄바꿈)을 기준으로 불러온다. null 도달하면 파일의 가장 마지막인 것 
				String line = br.readLine();
				if (line == null) {
					break;
				}
				
				/* Q. 10행마다 "----" 추가
				for (int i=0; i<150; i+=10) {
					if (num == i) 
					 	{ System.out.println("--------------------------"); }
				}*/
				// 강사님
				if (num % 10 == 0 ) {System.out.println("---------------");}

				System.out.printf("%d %s \n", num++, line);
				// %d = 정수형으로 형변환  |  %s = 문자열로 형변환
				
			}//while end
			
		} catch(Exception e) {
			
			System.out.println("파일 불러오기 실패 " + e);
			
		} finally {
					// 자원 반납시 (close시) 파일 크기 주의! → 큰것부터 닫는다 (Buffered > FileReader)
					try {
						if(br != null) { br.close(); }
					} catch (Exception e) {}
					
					try {
						if(fr != null) { fr.close(); }
					} catch (Exception e) {}
		}
		
		
		
		
	}//main() end
}//class end
