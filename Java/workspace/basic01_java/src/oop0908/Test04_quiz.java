package oop0908;

public class Test04_quiz {


	public static void main(String[] args) {
		// String 관련 연습문제
		
		/* 
		 	Q1. 이메일 주소에 @문자 있으면
            	@글자 기준으로 문자열을 분리해서 출력하고
            	@문자 없다면 "이메일주소 틀림" 메세지를 출력하시오        
            
              	출력결과
              	webmaster
              	itwill.co.kr
              	
              	-- contains = 그 글자가 있는가?
              	-- indexOf  = 해당 글자의 인덱스 번호가 0 이상인가(=그 글자가 있는가?)
              	
              	if (email.indexOf("@") >= 0){
					String[] w = email.split("@");
					for (int i=0; i<w.length; i++) {
						System.out.println(w[i]);
					}
				} else {
					System.out.println("틀린 이메일 주소ㅇㅇㅇ입니다.");
				}
        */
		String email = new String("webmaster@itwill.co.kr");
		
		// .contains() 활용
		// 참조 : https://fruitdev.tistory.com/72
		if(email.contains("@")){
			String[] w = email.split("@");
			for (int i=0; i<w.length; i++) {
				System.out.println(w[i]);
			}//for end
		} else {
			System.out.println("잘못된 이메일 주소입니다.");
		}//if end 
		
		
		// 강사님
		if (email.indexOf("@")==-1) {	// indexOf()는 찾는 문자열이 없으면 -1값으로 반환해준다
										// -1과 같으면 @이 없다는 뜻
			System.out.println("잘못된 이메일 주소입니다.");	
		} else {
			System.out.println("성공");
			
			int pos = email.indexOf("@");
			//System.out.println(pos);		// 9
			
			//String id = email.substring(0, 9);		// 0 ~ 8+1
			// 문자열을 메모리에 저장할때 꼬릿말을 위한 공간확보가 하나 더 필요함 +1
			// ex.| S | K | Y |   |   
			//      0   1   2   3  
			//String server = email.substring(10);
			
			String id = email.substring(0, pos);
			String server = email.substring(pos+1);
			
			System.out.println(id);
			System.out.println(server);
		}

		System.out.println("-----------------------------------------");
		
		/*   
		 		Q2. 이미지 파일만 첨부 (.png .jpg .gif)
          
            	출력결과 
        		파일명 : sky2022.09.08
        		확장명 : png
        		→ 확장명을 뽑아낼수있으면 게시판같은거에 if문 활용해서 알맞지 않은 확장자는 
        		  잘못된 파일이라고 alert로 띄울 수 있음
        		
        		lastIndexOf(".") 뒤에서 첫번쨰 . 의 인덱스값을 알려줌 
        		
        		// ↓ 이러면 경로가 추가됐을때 잘리는게 밀림
        		String re1 = path.substring(19, 32); 	
				System.out.println("파일명 : " + re1);
        		// ↓ 이러면 파일명이 길이가 변하면 .의 인덱스값이 밀리기때문에 잘리는 내용도 변함
        		String re2 = path.substring(33);	
				System.out.println("확장명 : " + re2);
		*/
		String path = new String("i:/frontend/images/sky2022.09.08.png");
		
		// ★ lastIndexOf();를 써야 경로 추가, 파일명 변경이 되어도 파일명과 확장명을 바르게 뽑아낼 수 있음
		int s = path.lastIndexOf("/");
		//System.out.println(s);    	    	// 18 → 가장 마지막 /의 인덱스값 
		int idx = path.lastIndexOf(".");	
		//System.out.println(idx);				// 32 → 가장 마지막 .의 인덱스값 
		
		String re1 = path.substring(s+1, idx);	// 마지막 /의 다음 문자부터 마지막 . 앞 문자까지 = 파일명
		System.out.println("파일명 : " + re1);
		
		String re2 = path.substring(idx+1);		// 마지막 . 이후부터 끝글자까지 = 확장자명
		System.out.println("확장명 : " + re2);
		
		
		// 강사님
		// 마지막 "/"의 순서값
		int lastSlash = path.lastIndexOf("/");
		//System.out.println(lastSlash);			// 18
		
		// 전체 파일명
		String file = path.substring(lastSlash+1);
		System.out.println("전체 파일명 : " + file);
		
		// file에서 마지막 "."의 순서값
		int lastDot = file.lastIndexOf(".");
		//System.out.println(lastDot);  			// 13
		
		// 확장명
		String ext = file.substring(lastDot+1);
		System.out.println("확장명 : " + ext);
		
		// 확장명을 전부 소문자로 치환 (확장명이 대소문자 섞여있으면 if문 복잡해지니까 전부 소문자치환하고 맞는 확장명인지 검사)
		ext = ext.toLowerCase();
		if(ext.equals("png") || ext.equals("jpg") || ext.equals("gif")) {
			System.out.println("파일 전송이 완료되었습니다.");
		} else {
			System.out.println("이미지 파일만 전송 가능합니다. (.png/.jpg /.gif)");
		}
		// → syso대신 함수로 보내서 JS에서 해당 함수로 가면 alert로 띄울 수 있음
		
	}//main() end
}//class end
