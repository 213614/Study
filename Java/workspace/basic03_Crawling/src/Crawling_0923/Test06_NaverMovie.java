package Crawling_0923;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test06_NaverMovie {

	public static void main(String[] args) {
		// 네이버 관람평 페이지 크롤링
		// ex. "엄마 까투리:도시로 어쩌고" 관람평을 공감순으로 정렬 후 크롤링하기(1페이지만)
		
		try {
				// 네이버 영화 관람평 페이지 주소 (공감순정렬)
				String url = "https://movie.naver.com/movie/bi/mi/pointWriteFormList.naver";
				String params = "?code=218816";		 // 영화 코드 넘버
				params += "&type=after&onlyActualPointYn=N&onlySpoilerPointYn=N";
				params += "&order=sympathyScore";	 // 공감순
				params += "&page=1";				 // 페이지 넘버
				
				Document doc = Jsoup.connect(url+params).get();
				//System.out.println(doc.toString());
				
				/*
				// 관람평 하나하나가<span id="_filtered_ment_0"></span>에 둘러쌓여있다(맨 뒤 숫자를 반복문으로 처리)
				for (int ment=0; ment<=9; ment++) {
						
					Elements elements = doc.select("#_filtered_ment_"+ ment);
					
					for ( Element element : elements ) { 
						   System.out.println(element.text());
					   }//for end
				}//for end
				*/
				
//-----------------------------------------------------------------------------------------------
				
				/*
				   평점 개별적 내용이아니라 관람평 전체가 담겨있는 class로 접근하기(모든 관람평이 동일한 class안에 담겨져있음) 
				   <div class = "score_reple"><span id=""></span></div>
				   
				   반복문이 필요 없는 이유 : id는 한가지 이상에게 동일하게 줄 수 없기 때문에 무조건 1개씩이라 반복문으로 돌렸어야
				   했지만 class는 여러개가 한 반에 들어가 있는 모양이라 공통되게 코딩되어있다. 그러므로 반복문 필요치않음 
				*/
				
				Elements elements = doc.select(".score_reple p");
				// 불필요한 요소 제거 
				elements.select(".ico_viewer").remove();

					for (Element element : elements) {
						System.out.println(element.text());
					}
					

		} catch(Exception e) {
			System.out.println("크롤링 실패 " + e);
		}//try end
		
		
		

	}//main() end 
}//class end
