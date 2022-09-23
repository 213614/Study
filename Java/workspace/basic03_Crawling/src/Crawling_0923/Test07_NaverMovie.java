package Crawling_0923;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test07_NaverMovie {

	public static void main(String[] args) {
		// 네이버 관람평 페이지 크롤링
		// ex. "극장판 엄마 까투리: 도시로 간 까투리 가족" 관람평을 공감순으로 정렬 후 크롤링하기 (전체 페이지)
		//     → Katuri.txt에 저장하기 
		
		try {
			
			    String filename = "I:\\java202207\\Katuri.txt";
			    FileWriter   fw = new FileWriter(filename, false);
			    PrintWriter out = new PrintWriter(fw, true);
				  
			    // 네이버 영화 관람평 페이지 주소 (공감순정렬)
				String url = "https://movie.naver.com/movie/bi/mi/pointWriteFormList.naver";
				
				for(int page=1; page<=14; page++) {
				
				String params = "?code=218816";		 // 영화 코드 넘버
				params += "&type=after&onlyActualPointYn=N&onlySpoilerPointYn=N";
				params += "&order=sympathyScore";	 // 공감순
				params += "&page="+ page;
				/*
				 	  공감순     order=sympathyScore
            		  최신순     order=newest
            		  평점높은순  order=highest
            		  평점낮은순  order=lowest
				*/
				
				Document doc = Jsoup.connect(url+params).get();
				
					for (int ment=0; ment<=9; ment++) {
							
						Elements elements = doc.select("#_filtered_ment_"+ ment);
						
						for ( Element element : elements ) { 
							   System.out.println(element.text());
							   out.println(element.text());
						   }//for end
					}//for end
				}//for end

				/*강사님
				for(int p=1; p<=14; p++) {
					System.out.println("데이터 입력중");
					Document doc = Jsoup.connect(url+params+p).get();
					for(int ment=0; ment<=9; ment++) {
						Elements elements = doc.select("#_filtered_ment_"+ ment);
						for(Element element : elements) {
							out.println(element.text());
						}
					}
				}
				*/
				 out.close();
			     fw.close();
				   
		  	     System.out.println("-------------------------Katuri.txt");

		} catch(Exception e) {
			System.out.println("크롤링 실패 " + e);
		}//try end
		
		
		

	}//main() end 
}//class end
