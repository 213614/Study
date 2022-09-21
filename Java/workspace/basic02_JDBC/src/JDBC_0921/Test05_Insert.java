package JDBC0921;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test05_Insert {

	public static void main(String[] args) {
		// 변수를 이용한 sungjuk 테이블 행 추가 연습 → 현업에서 가장 많이 사용됨
		
		try {
			
			String url 		="jdbc:oracle:thin:@localhost:1521:xe\r\n";
			String user 	= "system";		
			String password = "1234";
			String driver   = "oracle.jdbc.driver.OracleDriver"; 	
			
			Class.forName(driver);		
			
			Connection con = DriverManager.getConnection(url, user, password);
			// → 이 변수가 최종적인 값을(url,id,pw) 가지고 있음(리턴형 Connection) 
			System.out.println("오라클DB 서버 연결 성공");
			
//-------------------------------------------------------------------------------------------
				
			String name = "박지성";
			int 	kor=99
				  , eng=98
				  , mat=100 
				  ;
			String addr="Seoul";
			
			
			StringBuilder sql = new StringBuilder();
			sql.append(" INSERT INTO sungjuk(snum, uname, kor, eng, mat, addr, wdate) ");
			sql.append(" VALUES (sungjuk_seq.nextval, ?, ?, ?, ?, ?, sysdate) ");
			//										  ↑ ?를 넣으면 원하는 값을 넣을 수 있다 = 특정 값으로 대입할 수 있는 표식
			//										  ※ '?' | "?" 는 일반 문자취급이니 따옴표 넣으면 안됨 주의! 
			
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			// ★ 물음표의 개수(5개), 순서(이름-국어-영어···.),자료형(String,int)이 일치해야 한다 ★
			// = 테이블 설계시 칼럼의 자료형(varchar,int···.)과 변수의 자료형이 일치해야한다. 
			// varchar(sql) - String(java)  |  int(sql) - int(java)
			
			pstmt.setString(1, name);    // 1 = 첫번째 물음표에, name 변수를 담는다는 뜻
										 		// ※ 시작이 1이니 주의하자! (0이아님)
			pstmt.setInt(2, kor);		 // 2 = 두번째 물음표에 kor을 대입 
			pstmt.setInt(3, eng);		 // 3 = 세번째 물음표에 kor을 대입 
			pstmt.setInt(4, mat);		 // 4 = 네번째 물음표에 kor을 대입 
			pstmt.setString(5, addr);    // 5 = 다섯번째 물음표에 addr을 대입
			
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt==0) {
				System.out.println("수정 실패");
			} else {
				System.out.println("수정 성공");
			}//if end
			
			// 자원 반납(순서 주의)
			pstmt.close();
			con.close();
		
			
			
		} catch(Exception e) {
			System.out.println("Failed" + e);
		}//try end

		
		
		
		
	}//main() end
}//class end
