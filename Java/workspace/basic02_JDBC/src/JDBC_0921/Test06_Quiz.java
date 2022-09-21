package JDBC0921;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test06_Quiz {

	public static void main(String[] args) {
		// Q. snum = 22행의(박지성) 데이터를 아래의 내용으로 수정하라 
		int snum = 22;
		String uname = "JSPark";
		int 	kor = 90
			   ,eng = 85
			   ,mat = 100
			   ;
		int tot = (kor+eng+mat);
		int aver = tot/3;
		String addr = "Suwon";
		
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
			sql.append(" SET uname = ?, kor = ?, eng = ?,mat = ?,tot = ?, aver = ?, addr = ? ");
			sql.append(" WHERE snum = ? ");
			
			PreparedStatement pstmt = con.prepareStatement(sql.toString()); // SQL문 변환 작업
			
			pstmt.setString(1, uname);
			pstmt.setInt   (2, kor);
			pstmt.setInt   (3, eng);
			pstmt.setInt   (4, mat);
			pstmt.setInt   (5, tot);
			pstmt.setInt   (6, aver);
			pstmt.setString(7, addr);
			pstmt.setInt   (8, snum);
			
			/*
			// 강사님 → 이렇게하면 행 삭제시 용이하다(한줄을 그냥 지워버리면 되니까)
			StringBuilder sql = new StringBuilder();
			sql.append(" UPDATE sungjuk ");
			sql.append(" SET uname = ? ");
			sql.append(" ,kor=? ");
			sql.append(" ,eng=? ");
			sql.append(" ,mat=? ");
			sql.append(" ,tot=? ");
			sql.append(" ,aver=? ");
			sql.append(" ,addr=? ");
			sql.append(" WHERE snum = ? ");
			*/
			
			//  Mybatis Framework는 자바와 sql문을 분리해서 sql문을 엑셀파일로 따로 관리한다 
			//→ 실행시키지않아도 sql문에서 오류가 있다면 자바와 연동되지않는다 
			//  Spring Framework는 자바와 sql을 묶어놓음?
			
//-------------------------------------------------------------------------------------------
			
			
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
