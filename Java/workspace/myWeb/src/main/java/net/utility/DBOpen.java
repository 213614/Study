package net.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {
	
	// 오라클 DB 연결 Method
	public Connection getConnection() {
		Connection con = null;
		try {	
			
			String url 		= "jdbc:oracle:thin:@localhost:1521:xe\r\n";
			String user 	= "system";		
			String password = "1234";
			String driver   = "oracle.jdbc.driver.OracleDriver"; 	
			Class.forName(driver);	
			con = DriverManager.getConnection(url, user, password);

		}catch(Exception e) {
			System.out.println("오라클 연결 실패 : "+ e);
		}//try end
		
		return con;
	}//getCon() end
	
}//class end
