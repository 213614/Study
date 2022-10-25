package net.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {
	
	// 오라클 DB 연결 Method
	public Connection getConnection() {
		Connection con = null;
		try {	
			
			String url      = "jdbc:mysql://localhost/hsaem";
		    String user     = "hsaem";
		    String password = "gkstoatoaA!";
		    String driver   = "org.gjt.mm.mysql.Driver";
			Class.forName(driver);	
			con = DriverManager.getConnection(url, user, password);

		}catch(Exception e) {
			System.out.println("오라클 연결 실패 : "+ e);
		}//try end
		
		return con;
	}//getCon() end
	
}//class end
