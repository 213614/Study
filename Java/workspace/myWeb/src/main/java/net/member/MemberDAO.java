package net.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import net.utility.DBClose;
import net.utility.DBOpen;
import net.utility.MyAuthenticator;
import net.utility.Utility;

public class MemberDAO {	 // Data Access Object : DB 접근 객체 
	
	private DBOpen dbopen 		    = null;
	private Connection con 			= null;
	private PreparedStatement pstmt = null;
	private ResultSet rs 			= null;
	private StringBuilder sql 		= null;

	public MemberDAO() {
		dbopen = new DBOpen();
	}//end 
	
	// 비지니스 로직 구현
	public String loginProc(MemberDTO dto) {
		
		String mlevel = null;
		
		try {
				con = dbopen.getConnection();
				
				sql = new StringBuilder();
				sql.append(" SELECT mlevel ");
				sql.append(" FROM member ");
				sql.append(" WHERE id = ? ");
				sql.append(" AND passwd = ? ");
				sql.append(" AND mlevel IN ('A1','B1','C1','D1') ");
				
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPasswd());
				
				rs = pstmt.executeQuery(); 						
				if (rs.next()) {
					mlevel = rs.getString("mlevel");
				}//if end

		}catch(Exception e) {
			System.out.println("로그인 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		
		return mlevel;
	}//loginProc() end
	
	
	public int duplecateID(String id) {
		int cnt = 0;
		
		try {
				con = dbopen.getConnection();
				
				sql = new StringBuilder();
				sql.append(" SELECT COUNT(id) AS cnt "); 
				sql.append(" FROM member "); 
				sql.append(" WHERE id = ? "); 
				// 탈퇴한 회원들의 아이디는 where mlevel in(~)로 사용하면 됨 → 이건 업무마다 달라서 회사에서 알려줄꺼임 
				
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					cnt = rs.getInt("cnt");
				}//if end
	
		}catch(Exception e) {
			System.out.println("아이디 중복 확인 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return cnt;
	}//duID() end
	
	public int duplecateEmail(String email) {
		int cnt = 0;
		
		try {
				con = dbopen.getConnection();
				
				sql = new StringBuilder();
				sql.append(" SELECT COUNT(email) AS cnt "); 
				sql.append(" FROM member "); 
				sql.append(" WHERE email = ? "); 
				
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, email);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					cnt = rs.getInt("cnt");
				}//if end
	
		}catch(Exception e) {
			System.out.println("아이디 중복 확인 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return cnt;
	}//duID() end
	

	public int membercreate(MemberDTO dto) {
		
		int cnt = 0;
		
		try {	
				// DB 연결 
				con = dbopen.getConnection();
			
				sql = new StringBuilder();
				sql.append(" INSERT INTO member (id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate) ");
				sql.append(" VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'D1', sysdate) ");
				
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPasswd());
				pstmt.setString(3, dto.getMname());
				pstmt.setString(4, dto.getTel());
				pstmt.setString(5, dto.getEmail());
				pstmt.setString(6, dto.getZipcode());
				pstmt.setString(7, dto.getAddress1());
				pstmt.setString(8, dto.getAddress2());
				pstmt.setString(9, dto.getJob());
				
				cnt = pstmt.executeUpdate();
				
		}catch(Exception e) {
			System.out.println("회원 가입 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt);
		}//try end

		return cnt;
	}//membercreate() end
	
	public MemberDTO findID(String mname, String email) {
		
		MemberDTO dto = null;
		
		try {
				con = dbopen.getConnection();
				
				sql = new StringBuilder();
				sql.append(" SELECT id  ");
				sql.append(" FROM member ");
				sql.append(" WHERE mname = ? AND email = ? ");
				
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, mname);
				pstmt.setString(2, email);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					dto = new MemberDTO();
					
					dto.setId(rs.getString("id"));
					
				}else {
					dto = null;
				}//if end
				
		}catch(Exception e) {
			System.out.println("아이디 찾기 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return dto; 
	}//findID() end
	
	public String Random() {
		int num = 48; 	 //숫자 아스키넘버시작 (48-57 = 0-9)
		int alpha = 122; //알파벳 아스키넘버 끝 (65-90 = A-Z , 97-122 = a-z)
		int randomlength = 10; //10자리
		
		Random random = new Random();
		
		String generatedString = random.ints(num, alpha+1)
									   .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
									   .limit(randomlength)
									   .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	                                   .toString();
		
		return generatedString;
		
	}//random() end
	
	public int findPW(String id, String email) {
		
		int cnt = 0; 
		String generatedString = Random();
		
		try {
				con = dbopen.getConnection();
				
				sql = new StringBuilder();
				sql.append(" UPDATE member  ");
				sql.append(" SET passwd = ?  ");
				sql.append(" WHERE id = ? AND email = ? ");

				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, generatedString);
				pstmt.setString(2, id);
				pstmt.setString(3, email);
				
			
				// 해당 비밀번호 메일로 전송해주기 
				String mailServer = "mw-002.cafe24.com";	
				Properties props = new Properties();
				props.put("mail.smtp.host", mailServer );
				props.put("mail.smtp.auth", true);
				
				Authenticator myAuth = new MyAuthenticator();	
				
				Session sess = Session.getInstance(props, myAuth);
				
			    String to 	  = email;
			    String from    = "hansam0385@gmail.com";
			    String subject = "임시 비밀번호 발급 안내";
			    String content = "";
			    
			    content = Utility.convertChar(content);
			    
				content = id + "님에게 발급된 임시 비밀번호입니다. <br><br>";
				content += "<strong style='font-size:30px;'>";
				content += generatedString;
				content += "</strong>";
				
				InternetAddress [] address = { new InternetAddress(to) };
				
				Message msg = new MimeMessage(sess);
				
				msg.setRecipients(Message.RecipientType.TO, address);
				msg.setFrom(new InternetAddress(from));
				msg.setSubject(subject);
				msg.setContent(content, "text/html; charset=UTF-8");
				msg.setSentDate(new Date());
				
				Transport.send(msg);
				
				cnt = pstmt.executeUpdate();
				
		}catch(Exception e) {
			System.out.println("비밀번호 찾기 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return cnt; 
	}//findPW() end
	
}//DAO end
