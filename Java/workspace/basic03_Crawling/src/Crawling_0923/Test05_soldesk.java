package Crawling_0923;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test05_soldesk {

	public static void main(String[] args) {
		// Q. 솔데스크 웹페이지에서 공지사항 제목만 크롤링 후 soldesk.txt파일에 저장
		// https://soldesk.com/board/board_bagic/board_list.asp?scrID=0000000173&pageNum=8&subNum=1&ssubNum=1&page=1&bd_num=&act=list&s_string=
		

		try {
			   // 파일로 출력할 준비 
			   String filename = "I:\\java202207\\soldesk.txt";
			   FileWriter   fw = new FileWriter(filename, false);
			   PrintWriter out = new PrintWriter(fw, true);
			   
			   // 페이지 불러오기 
			   String url = "https://soldesk.com/board/board_bagic/board_list.asp"; 
			   
			   
			   for(int page=1; page<=8; page++) {
   
				   String params =  "?scrID=0000000173&pageNum=8&subNum=1&ssubNum=1&page=" 
						   		   + page 
						   		   + "&bd_num=&act=list&s_string=";
				   
				   Document doc = Jsoup.connect(url+params).get();

				   Elements elements = doc.select(".td_left");
				   
				   /*
			    	  솔데스크처럼 제목과 날짜를 한 태그 안에 다 몰아놔서 아래처럼 출력이 될 때
			          2021-09-14 IT 취업교육 온라인 설명회 
			          ★→ 날짜데이터는 빼고 제목만 가지고 오고싶다면 .remove();를 사용한다
			          = element에 담아서 출력 전에 element*s*.select("지우고싶은 정보(셀렉터 . or # 필수)").remove();
				    */ 
				   // <span class="td_m_date">2021-09-14</span> 삭제 
				   elements.select(".td_m_date").remove();
				   
				   for ( Element element : elements ) { 
					   System.out.println(element.text());
					   out.println(element.text());		// soldesk.txt에 출력 
				   }//for end
				  
				   
				   /*
				    	  솔데스크처럼 제목과 날짜를 한 태그 안에 다 몰아놔서 아래처럼 출력이 될 때
				          2021-09-14 IT 취업교육 온라인 설명회 
				          → 날짜데이터는 빼고 제목만 가지고 오고싶다면 .remove();를 사용한다
				   */ 
				   
				   
			   }//for end
			   
			   out.close();
			   fw.close();
			   
			   System.out.println("-------------------------soldesk.txt 공지사항");
			  
			   
			   
			   
		} catch(Exception e) {
			System.out.println("크롤링 실패 " + e);
		}//try end
	
	}//main() end
}//class end
