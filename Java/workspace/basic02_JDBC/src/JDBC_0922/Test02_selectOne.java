package JDBC_0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test02_selectOne {

	public static void main(String[] args) {
		// sungjuk 테이블에서 한 행 출력 = 상세보기 (반복문으로 돌리면 목록) 
		
		int snum = 22;
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
					sql.append(" SELECT snum, uname, kor, eng, mat, addr, tot, aver, wdate ");
					sql.append(" FROM sungjuk ");
					sql.append(" WHERE snum = ? ");
					
					pstmt = con.prepareStatement(sql.toString());
					pstmt.setInt   (1, snum);
					
					rs = pstmt.executeQuery(); 			
					if (rs.next()) {
						System.out.println("자료 있음");
						
						// 1. 칼럼순
						System.out.println(rs.getInt(1));		// 첫번째 칼럼(select에서 첫번째) = snum
						System.out.println(rs.getString(2));	// 두번째 칼럼 = uname
						System.out.println(rs.getInt(3));		// kor
						System.out.println(rs.getInt(4));		// eng
						System.out.println(rs.getInt(5));		// mat
						System.out.println(rs.getString(6));	// addr
						System.out.println(rs.getInt(7));		// tot
						System.out.println(rs.getInt(8));		// aver
						System.out.println(rs.getString(9));	// wdate = 시간은 되도록이면 String으로 불러온다
						
						// 2. 칼럼명
						System.out.println(rs.getInt("snum"));
						System.out.println(rs.getString("uname"));
						System.out.println(rs.getInt("kor"));
						System.out.println(rs.getInt("eng"));
						System.out.println(rs.getInt("mat"));
						System.out.println(rs.getString("addr"));
						System.out.println(rs.getInt("tot"));
						System.out.println(rs.getInt("aver"));
						System.out.println(rs.getString("wdate"));
						
						// ★ select 해놓은 칼럼중에서만 get으로 불러올 수 있다 ★
						
					} else { System.out.println("자료 없음"); }//if end
					
					
		} catch(Exception e) {
					System.out.println("Failed" + e);
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
