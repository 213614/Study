package Crawling_0923;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test03_Choongang {

	public static void main(String[] args) {
	
		// 참조 : https://www.choongang.co.kr/html/sub07_01_n.php
		// 중앙 정보 처리 학원 웹페이지 - 공지사항 게시판 제목만 크롤링
	
		try {
			   String url = "https://www.choongang.co.kr/html/sub07_01_n.php"; 
			   		   
			   // 공지사항 페이지의 1~11페이지까지의 소스 가져오기
			   for(int page=1; page<=11; page++) {
				   
				   String params = "?page=" + page + "&mod=&idx="; //url에서 물음표 뒷부분을 담는다
				   Document doc = Jsoup.connect(url+params).get();
				   //System.out.println(doc.toString());	// 모든 공지사항 페이지소스 출력 
				
				   
				   // 요소 선택하기 (default_title)
				   /*
				    	    ↓ class면 .으로 호출  /  id면 #으로 호출 
				      <tr class = "board_default_list">
				        <td class="default_title">[22년 06월 07일] AI 빅데이터 세미나</td>
				      </tr>
				      
				      
				   */
				   //Elements elements = doc.select(".default_title");
				   Elements elements = doc.select(".board_default_list > .default_title");
				   //								→ b_d_l이라는 class안에 있는 de_title class을 불러온다는 뜻 : css때 셀렉터 방식 그대로 사용 가능)
				   
				   for ( Element element : elements ) {
					// ( 개별 : 덩어리 ) = 반복할때마다 덩어리에서 값을 1개씩 꺼내서 개별에 넣어준다는 뜻 → : 대신 in연산자 가능 
					   System.out.println(element.text());
				   }//for end
				   
			   }//for end
			   
			  
			   
			   
			   
		} catch(Exception e) {
			System.out.println("크롤링 실패 " + e);
		}//try end
	
		
		
		
		
		
		
		

	}//main()end
}//class end
