package JDBC_0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test06_Quiz {

	public static void main(String[] args) {
		// Q. 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오
		
		String hakno = "g1001";	
		
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
					sql.append(" SELECT hakno, GW.gcode, gname ");
					sql.append(" FROM tb_sugang SU JOIN tb_gwamok GW ");
					sql.append(" ON SU.gcode = GW.gcode  ");
					sql.append(" WHERE SU.hakno = ? ");
					/*
					if (hakno.length()>0) {

						String where = " WHERE SU.hakno = '" + hakno +"'" ;
						sql.append(where); 
						
					}
					*/
					sql.append(" ORDER BY GW.gcode ");
					
					pstmt = con.prepareStatement(sql.toString());
					pstmt.setString(1, hakno);

					rs = pstmt.executeQuery(); 			
					if (rs.next()) {
						System.out.println("자료 있음");
			
						do {
							System.out.print(rs.getString(1) + "  ");
							System.out.print(rs.getString(2) + "  ");
							System.out.print(rs.getString(3) + "  ");
							System.out.println();
						}while(rs.next()); 		
						
					} else { System.out.println("자료 없음"); }
					
					
		
		
		} catch(Exception e) {
					System.out.println("Failed : " + e);
		} finally {
					// 자원반납
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
