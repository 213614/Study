package JDBC_0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test03_1_practice {

	public static void main(String[] args) {
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
					sql.append(" SELECT addr ");
					sql.append(" , round(avg(kor),3) kor ");
					sql.append(" , round(avg(eng),3) eng ");
					sql.append(" , round(avg(mat),3) mat ");
					sql.append(" FROM sungjuk ");
					sql.append(" GROUP BY addr ");
					sql.append(" HAVING addr = 'Seoul' ");
					
					
					
					
					pstmt = con.prepareStatement(sql.toString());
					
					rs = pstmt.executeQuery(); 			
					if (rs.next()) {
						System.out.println("자료 있음");
						
						System.out.println("주소 : " 		+ rs.getString(1) + " ");
						System.out.println("국어 평균 : "  + rs.getDouble(2) + " ");
						System.out.println("영어 평균 : "  + rs.getDouble(3) + " ");
						System.out.println("수학 평균 : "  + rs.getDouble(4) + " ");
						
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
