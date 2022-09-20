package oop0920;

import java.io.FileWriter;
import java.io.PrintWriter;

public class Test04_Output {

	public static void main(String[] args) {
		// 메모장에다 출력하기 (char기반)
		
		// 출력파일(sungjuk.txt)이 없어도 오류가 나지 않는다
		// 출력파일이 *없*다면 파일이 새로 생성됨(create)
		// 출력파일이 *있*다면 덮어쓰기(overwrite) or 추가(append) 
		String name = "I:\\java202207\\sungjuk.txt";
		
		FileWriter   fw = null;
		PrintWriter out = null;
		
		try {	
				// true  : append (이미 있는 내용에 out.println이 추가된다)
				// false : overwrite (out.println의 내용으로 덮어씌워진다)
				fw = new FileWriter(name, false);
				
				// autoFlush : true 버퍼클리어 = 무조건 값을 true로 줘야함 
				// 데이터가 이동되는 길(=버퍼)은 공용공간이기때문에 false로하면 버퍼에 남아있는 쓰레기값도 끌고감
				// true로 버퍼를 청소하는 것
				out = new PrintWriter(fw, true);
			
				// oop0906.Test01_format.java 참조
				// out.printf(name, args);
				// print f(ormat) 
				
				out.println("무궁화,95,90,100");
	            out.println("홍길동,100,100,100");
	            out.println("라일락,90,95,35");
	            out.println("개나리,85,70,75");
	            out.println("진달래,35,40,60");
	            // ,로 구분된 메모장 파일은 .csv로 저장 가능
	            
	            System.out.println("sungjuk.txt 데이터 파일 완료");
			
		} catch(Exception e) {
			
			System.out.println("파일 불러오기 실패 " + e);
			
		} finally {
					// 자원 반납시 (close시) 파일 크기 주의! → 큰것부터 닫는다 (PrintW > FileW)
					try {
						if(out != null) { out.close(); }
					} catch (Exception e) {}
					
					try {
						if(fw != null) { fw.close(); }
					} catch (Exception e) {}
		}
		
			
	}//main() end
}//class end
