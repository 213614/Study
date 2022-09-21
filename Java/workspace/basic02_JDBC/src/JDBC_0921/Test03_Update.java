package JDBC0921;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test03_Update {

	public static void main(String[] args) {
		// sungjuk 테이블 행 수정 연습
		
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
			
			StringBuilder sql = new StringBuilder();
			sql.append(" UPDATE sungjuk ");
			sql.append(" SET tot=kor+eng+mat ");
			sql.append("    ,aver=(kor+eng+mat)/3 ");
			sql.append(" WHERE snum=21 ");
			
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			
			int cnt = pstmt.executeUpdate(); 	// 실행된 행의 개수가 반환
			
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
