package Crawling_0923;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class Test02_Choongang {

	public static void main(String[] args) {
	
		// 참조 : https://www.choongang.co.kr/html/sub07_01_n.php
		// 중앙 정보 처리 학원 웹페이지 - 공지사항 게시판 제목만 크롤링
	
		try {
			   String url = "https://www.choongang.co.kr/html/sub07_01_n.php"; 
			   		   
			   // 공지사항 페이지의 1~11페이지까지의 소스 가져오기
			   for(int page=1; page<=11; page++) {
				   
				   String params = "?page=" + page + "&mod=&idx="; //url에서 물음표 뒷부분을 담는다
				   // 페이지가 바뀌어도 페이지를 구성하는 구조는 똑같고 내용만(공지사항제목,게시글번호 등) 바뀐다
				   Document doc = Jsoup.connect(url+params).get();
				   System.out.println(doc.toString());	// 모든 공지사항 페이지소스 출력 
				   					   // ↑ Object class에서 상속받은거라 생략해도 무관하다
			   }//for end
			   
			  
			   
			   
			   
		} catch(Exception e) {
			System.out.println("크롤링 실패 " + e);
		}//try end
	
		
		
		
		
		
		
		

	}//main()end
}//class end
