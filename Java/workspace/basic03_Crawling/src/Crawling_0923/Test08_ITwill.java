package Crawling_0923;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test08_ITwill {

	public static void main(String[] args) {
		
		try {
			   // 파일로 출력할 준비 
			   String filename = "I:\\java202207\\ITwill.txt";
			   FileWriter   fw = new FileWriter(filename, false);
			   PrintWriter out = new PrintWriter(fw, true);
			   
			   // 페이지 불러오기 
			   String url = "https://www.itwill.co.kr/cmn/board/BBSMSTR_000000000071/bbsList.do"; 
			   
			   for (int i=1; i<=4; i++) {
				   
				   String params = "?pageIndex=";
				   
				   Document doc = Jsoup.connect(url+params+i).get();

				   Elements elements = doc.select(".bgcol01 a");
				   

				   //elements.select(".td_m_date").remove();
				   
				   for ( Element element : elements ) { 
					   System.out.println(element.text());
					   out.println(element.text());		
				   }//for end
				  
			   }

			   
			   out.close();
			   fw.close();
			   
			   System.out.println("-------------------------soldesk.txt 공지사항");
			  
			   
			   
			   
		} catch(Exception e) {
			System.out.println("크롤링 실패 " + e);
		}//try end
	
	}//main() end
}//class end
