package JDBC_0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test04_selectAVG {

	public static void main(String[] args) {
		// Q. 주소가 서울인 행들의 국영수 평균값을 구하시오
		//    (단, 소수점은 반올림해서 둘째자리값까지 표현)sungjuk 테이블에서 전체 행 조회 (=목록)
		
		// → 강사님 코드 ←   |  내껀 Test03_1_practice 
		String addr = "Seoul";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
					
					String url 		="jdbc:oracle:thin:@localhost:1521:xe\r\n";
					String user 	= "system";		
					String password = "1234";
					String driver   = "oracle.jdbc.driver.OracleDriver"; 	
					
					Class.forName(driver);		
					
					con = DriverManager.getConnection(url, user, password);
					System.out.println("오라클DB 서버 연결 성공");
					
					StringBuilder sql = new StringBuilder();
					sql.append(" SELECT ROUND(AVG(kor),2) as avg_kor ");
					sql.append(" 	  , ROUND(AVG(eng),2) as avg_eng ");
					sql.append("      , ROUND(AVG(mat),2) as avg_mat ");
					sql.append(" FROM sungjuk ");
					sql.append(" WHERE addr = ? ");
					
					pstmt = con.prepareStatement(sql.toString());
					pstmt.setString(1, addr);

					
					rs = pstmt.executeQuery(); 			
					if (rs.next()) {
						System.out.println("자료 있음");
						
						// 칼럼 순서로 접근
						System.out.printf("국어 평균 : %.2f \n"    , rs.getDouble(1));
						System.out.printf("영어 평균 : %.2f \n" 	, rs.getDouble(2));
						System.out.printf("수학 평균 : %.2f \n\n"    , rs.getDouble(3));
						
						// 칼럼명으로 접근
						System.out.printf("국어 평균 : %.2f \n"    , rs.getDouble("avg_kor"));
						System.out.printf("영어 평균 : %.2f \n" 	, rs.getDouble("avg_eng"));
						System.out.printf("수학 평균 : %.2f \n"    , rs.getDouble("avg_mat"));
						
						
						
						
					} else { System.out.println("자료 없음"); }
					
					
		
		
		} catch(Exception e) {
					System.out.println("Failed : " + e);
		} finally {
					try {
						if(rs != null) { rs.close(); }
					}catch(Exception e) {}	
					try {
						if(pstmt != null) { pstmt.close(); }
					}catch(Exception e) {}	
					try {
						if(con != null) { con.close(); }
					}catch(Exception e) {}	
		}//try end


	}//main() end
}//class end
