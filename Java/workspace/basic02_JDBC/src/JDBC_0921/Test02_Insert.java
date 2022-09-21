package JDBC0921;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test02_Insert {

	public static void main(String[] args) {
		// sungjuk 테이블 행 추가 연습
		
		try {
			
			String url 		="jdbc:oracle:thin:@localhost:1521:xe\r\n";
			String user 	= "system";		
			String password = "1234";
			String driver   = "oracle.jdbc.driver.OracleDriver"; 	
			
			Class.forName(driver);		
			
			Connection con = DriverManager.getConnection(url, user, password);
			// → 이 변수가 최종적인 값을(url,id,pw) 가지고 있음(리턴형 Connection) 
			System.out.println("오라클DB 서버 연결 성공");
			
			// ★4. SQL문 작성 (※ 마지막에 세미콜론; 넣지 않도록 주의!) → 가장 중요한 단계
			StringBuilder sql = new StringBuilder();
			sql.append(" INSERT INTO sungjuk(snum,uname,kor,eng,mat,addr,wdate)");
			sql.append(" VALUES (sungjuk_seq.nextval, '손흥민', 99,98,97,'Seoul',sysdate)");
						//→ jdbc.sql문에서 작성했던걸 복붙한다(그냥 오타 검수 및 작성용)
						// ※ 자바에서 append로 작성할때는 명령어 구분인 공백문자가 빠지기때문에 
						//   줄 시작마다 그냥 공백을 넣고 작성하는 버릇을 들이면 좋다! 
						//   (ex. ~te *)v* alues (~ 로 명령어 두줄이 붙어서 작성되면 values가 안먹힘!
						// ※ 구분을 위해 명령어는 대문자로 작성하자 
			
			// 5. SQL문 형식으로 변환
			// →  아직 String값이라서 sql로 변환해줘야함
			// con(최종값을 가지고있는 변수)에 가서 변환 및 실행하는 것
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			
			// 6. SQL문 실행
			int cnt = pstmt.executeUpdate();
						  //→ insert/update/delete에 사용하는 함수 
			
			System.out.println("실행 결과 : " + cnt);
			// 수정된 행의 갯수가 반환된다(0으로 반환되면 실행이 제대로 이뤄지지 않고 오류난 것)
			
			
			
		} catch(Exception e) {
			System.out.println("Failed" + e);
		}//try end

	}//main() end
}//class end
