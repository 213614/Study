package Crawling_0923;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test04_Choongang {

	public static void main(String[] args) {
	
		// 참조 : https://www.choongang.co.kr/html/sub07_01_n.php
		// 중앙 정보 처리 학원 웹페이지 - 공지사항 게시판 제목만 크롤링해서 파일로 저장하기 
	
		try {
			   // 파일로 출력할 준비 
			   String filename = "I:\\java202207\\Choongang.txt";
			   FileWriter   fw = new FileWriter(filename, true);
			   PrintWriter out = new PrintWriter(fw, true);
			   
			   // 페이지 불러오기 
			   String url = "https://www.choongang.co.kr/html/sub07_01_n.php"; 
			   		   
			   for(int page=1; page<=11; page++) {
				   
				   String params = "?page=" + page + "&mod=&idx=";
				   Document doc = Jsoup.connect(url+params).get();

				   Elements elements = doc.select(".board_default_list > .default_title");
				   for ( Element element : elements ) { 
					   System.out.println(element.text());
					   out.println(element.text());		// Choongang.txt에 출력 
				   }//for end
				   
			   }//for end
			   
			   out.close();
			   fw.close();
			   
			   System.out.println("-------------------------Choongang.txt 공지사항");
			  
			   
			   
			   
		} catch(Exception e) {
			System.out.println("크롤링 실패 " + e);
		}//try end
	
		
		
		
		
		
		
		

	}//main()end
}//class end
