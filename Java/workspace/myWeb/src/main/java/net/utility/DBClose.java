package net.utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBClose {

	// DB 연결 자원 반납 
	// ★DBClose.close() : static함수 호출 방법 (static:호출이 빠르다. 연산이 컨티뉴된다)
	public static void close(Connection con){ 
		
		try {
			if(con !=null) { con.close(); }
		}catch(Exception e){}
		
	}//close() end 
	
	public static void close(Connection con, PreparedStatement pstmt){ 
		
		try{
			if(con !=null) { pstmt.close(); }
		}catch(Exception e){}
		
		try{
			if(con !=null) { con.close(); }
		}catch(Exception e){}
		
	}//close() end 
	
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs){ 	
	
		try {
			if(rs != null) { rs.close(); }
		}catch(Exception e){}
		
		try{
			if(con !=null) { pstmt.close(); }
		}catch(Exception e){}
		
		try{
			if(con !=null) { con.close(); }
		}catch(Exception e){}
		
	}//close() end 
	
}//class end
