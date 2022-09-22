package JDBC_0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test05_selectLike {

	public static void main(String[] args) {
		// LIKE 연산자 연습 
		// Q. 이름에 '나' 라는 문자 있는 행 조회
		
		String col = "uname";		// 검색 칼럼 = key field
		String word = "나";	 		// 검색어 = keyword
		
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
		
					// 검색어가 존재하는가 먼저 조건을 돌린다 
					if (word.length()>0) {
						// = 검색어의 길이가 0보다 큰가요? = 검색어가 존재하나요? 
						
						String where = " WHERE " + col + " LIKE '%" + word + "%' ";
						// = where uname like '%나%'
						
						sql.append(where);
						
					}//if end
		
					sql.append(" ORDER BY snum DESC ");
								
					pstmt = con.prepareStatement(sql.toString());

					rs = pstmt.executeQuery(); 			
					if (rs.next()) {
						System.out.println("자료 있음");
							do {
								  System.out.print(rs.getInt("snum") + " ");
								  System.out.println(rs.getString("uname") + " ");
								  // do-while (반복문)처리 안하면 가장 첫번째 값만(처음으로 커서가 가리키는 값만) 출력됨~! 
							}while(rs.next()); 		
					
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
