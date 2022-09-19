package oop0919;

import java.io.*;

public class Test05_File {

	public static void main(String[] args) {
		/*
			  ● File class
			  → 변수에 파일(외부문서)을 담을 수도 있다
			  → 파일과 관련된 정보를 알 수 있다
			  → 파일명·파일크기·확장명·파일타입 등···.
			  ★ 파일이 존재하지않으면 오류가 나기때문에 반드시 Exception처리를 해줘야한다
		*/
		
		try {
			   // 오류 발생이 예상되는 코드 작성
			
			   // 경로명+파일명
			
			   // 경로명으로 \기호를 사용하려면 \\ 두번씩 사용해야 한다.
			   //String pathname = "I:\\java202207\\공지사항.txt";
			   // 경로명으로 \대신 /기호도 가능(이건 한번만 사용 가능)
			   String pathname = "I:/java202207/공지사항.txt";
			   
			   File file = new File(pathname);
			   //file 클래스에 파일 담기
			   
			   if (file.exists()) {
				   System.out.println("파일이 존재합니다.");
				   
				   String filename = file.getName();
				   System.out.println("파일명 : " + filename);
				   
				   long filesize = file.length();
				   System.out.println("파일 크기 " + filesize + "Byte");
				   System.out.println("파일 크기 " + filesize/1024 + "KB" );
				   System.out.println("파일 크기 " + filesize/1024/1024 + "MB" );
				   
				   /*
				   // 파일 삭제 → 일시적 삭제가 아니라 실제 파일이 지워지므로 복사본 챙겨놓기(삭제시 휴지통으로 이동됨)
				   if(file.delete()) {
					   System.out.println(filename + " 파일 삭제 성공");
				   }else {
					   System.out.println(filename + " 파일 삭제 실패");
				   }//if end
				   */
				   
				   // 파일명과 확장명을 분리하여 출력하기
				   int lastdot = filename.lastIndexOf(".");		//마지막 .의 위치값
				   String name = filename.substring(0, lastdot);
				   String ext  = filename.substring(lastdot+1);
				   
				   System.out.println("파일명 : " + name);
				   System.out.println("확장명 : " + ext);
				   
			   }else {
				   System.out.println("파일이 존재하지 않습니다.");
			   }// if end
			   
		}catch(Exception a) {
			// 예외가 발생하면 처리할 코드 착성
			System.out.println(a);
		}
		System.out.println("END");
		
		
		
	}//main() end
}//class end
