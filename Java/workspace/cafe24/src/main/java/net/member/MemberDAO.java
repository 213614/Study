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
		        sql.append(" INSERT INTO member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate) ");
		        sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, 'D1', now()) ");
				
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
				
			    String to 	   = email;
			    String from    = "webmaster@itwill.co.kr";
			    String subject = "[MyWeb] 임시 비밀번호 발급 안내";
			    String content = "";
			    
			    content = Utility.convertChar(content);
			    
				content = "<br>" + id + "님에게 발급된 임시 비밀번호입니다. <br><br>";
				content += "<strong style='font-size:30px;'>";
				content += generatedString;
				content += "</strong><br><br>";
				content += "※ 임시 비밀번호로 로그인 한 후, 회원 정보 수정에서 비밀번호 수정바랍니다.";
				
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
	
	/* 아이디,비밀번호 찾기 강사님 함수 */
	public boolean T_findid(MemberDTO dto) {
		boolean flag = false;	// 아래 try문이 정상적으로 실행됐을때만 true로 변환한다.
		
		try {
			  con = dbopen.getConnection();
			
			  sql = new StringBuilder();
			  
			  // 이름과 이메일이 일치하는 아이디 조회
			  sql.append(" SELECT id  ");
			  sql.append(" FROM member ");
			  sql.append(" WHERE mname = ? AND email = ? ");
			  
			  pstmt = con.prepareStatement(sql.toString());
			  pstmt.setString(1, dto.getMname());
			  pstmt.setString(2, dto.getEmail());
			  
			  rs = pstmt.executeQuery();
			  if(rs.next()) {
				  // 이름과 이메일이 일치하는 회원이라면 → 임시 비밀번호와 아이디를 이메일로 전송해준다
				  String id = rs.getString("id"); 			   // 아이디 불러오기
				  
				  // 임시 비밀번호 10자리 문자열 생성 : 대문자 + 소문자 + 숫자  : 배열에 몰아넣기(원하는 글자 추가 가능 : 특문 추가)
				  String [] ch = {
						  "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","V","Q","R","S","T","U","V","W","X","Y","Z"
						 ,"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"
						 ,"0","1","2","3","4","5","6","7","8","9"
						 ,"!","~","&","%","$","#","@","^","*"
				  }; //ch[0]~ch[70] 
				  
				  // ch배열에서 랜덤하게 10글자 뽑아서 가져오기
				  StringBuilder imsiPW = new StringBuilder(); 	// 임시 비밀번호 변수 
				  for(int i=0; i<10; i++) {
					  int num = (int)(Math.random()*ch.length);
					  imsiPW.append(ch[num]);
				  }// for end
				  
				  // 위에서 생성된 임시 비밀번호로 테이블 수정하기 
				  // sql은 delete해도되고 다시 new S~로 메모리할당 새로 해도 됨
				  sql = new StringBuilder();
				  sql.append(" UPDATE member ");
				  sql.append(" SET passwd = ? ");
				  sql.append(" WHERE mname = ? AND email = ? ");
	
				  pstmt = con.prepareStatement(sql.toString());
				  pstmt.setString(1, imsiPW.toString());
				  pstmt.setString(2, dto.getMname());
				  pstmt.setString(3, dto.getEmail());
				  
				  int cnt = pstmt.executeUpdate();
				  if (cnt == 1) {
					  //임시 비밀번호로 테이블 수정이 되었다면 아이디+비밀번호 이메일로 전송
					  String content = "※ 임시 비밀번호로 로그인 한 후, 회원 정보 수정에서 비밀번호를 수정해주세요.";
					  content += "<hr>";
					  content += "<table border='1'>";
					  content += "	<tr>";
					  content += "		<th> 아이디 </th>";
					  content += "		<td>" + id + "</td>";
					  content += "	</tr>";
					  content += "	<tr>";
					  content += "		<td> 임시 비밀번호 </td>";
					  content += "		<td>"+ imsiPW.toString() +"</td>";
					  content += "	</tr>";
					  content += "</table>";
					  
					  String mailServer = "mw-002.cafe24.com";
					  Properties props = new Properties();
					  props.put("mail.smtp.host", mailServer );
					  props.put("mail.smtp.auth", true);
					  Authenticator myAuth = new MyAuthenticator();	
					  Session sess = Session.getInstance(props, myAuth);
					  
					  InternetAddress [] address = { new InternetAddress(dto.getEmail()) } ;
					  Message msg = new MimeMessage(sess);
					  msg.setRecipients(Message.RecipientType.TO, address);
					  msg.setFrom(new InternetAddress("webmaster@itwill.co.kr"));
					  msg.setSubject("[myweb] 아이디/비밀번호 입니다.");
					  msg.setContent(content, "text/html; charset=UTF-8");
					  msg.setSentDate(new Date());
					  Transport.send(msg);
					  
					  flag=true; // 여기까지 모두 완료했다면 true로 바꿔서 반환(성공시 true)
				  }//if end
				  
			  } else {
				  flag = false;     //기본 설정이 false라 상관없지만 적어줌 
			  }//if end
			  
			  
		}catch(Exception e) {
			System.out.println("아이디/비번찾기 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		
		return flag;
	}//T_findid() end
	
	public MemberDTO read (String id) {
		MemberDTO dto = null;
		
		try {
				  con = dbopen.getConnection();
					
				  sql = new StringBuilder();
				  sql.append(" SELECT * ");
				  sql.append(" FROM member ");
				  sql.append(" WHERE id = ? ");
				 
				  pstmt = con.prepareStatement(sql.toString());
				  pstmt.setString(1, id);
				  
				  rs = pstmt.executeQuery();
				  
				  if(rs.next()) {
					  
					  dto = new MemberDTO();
					  dto.setId      (rs.getString("id"));
					  dto.setPasswd  (rs.getString("passwd"));
					  dto.setMname   (rs.getString("mname"));
					  dto.setTel     (rs.getString("tel"));
					  dto.setEmail   (rs.getString("email"));
					  dto.setZipcode (rs.getString("zipcode"));
					  dto.setAddress1(rs.getString("address1"));
					  dto.setAddress2(rs.getString("address2"));
					  dto.setJob     (rs.getString("job"));
					  dto.setMlevel  (rs.getString("mlevel"));
					  dto.setMdate   (rs.getString("mdate"));

				  }else { dto = null; }//if end
	
		}catch(Exception e) {
			System.out.println("회원 정보 불러오기 실패 : " + e);
		}finally{
			DBClose.close(con, pstmt, rs);
		}//try end
			
		return dto;
	}//read() end
	
	public int ModifyUpdateProc(MemberDTO dto) {
		int cnt = 0;
		
		try {
				con = dbopen.getConnection();
				
				sql = new StringBuilder();
				sql.append(" UPDATE member  ");
				sql.append(" SET passwd = ? ");
				sql.append("    ,mname = ? ");
				sql.append("    ,email = ? ");
				sql.append("    ,tel = ? ");
				sql.append("    ,zipcode = ? ");
				sql.append("    ,address1 = ? ");
				sql.append("    ,address2 = ? ");
				sql.append("    ,job = ? ");
				sql.append(" WHERE id = ? ");

				
				pstmt = con.prepareStatement(sql.toString());
				
				pstmt.setString(1, dto.getPasswd());
				pstmt.setString(2, dto.getMname());
				pstmt.setString(3, dto.getEmail());
				pstmt.setString(4, dto.getTel());
				pstmt.setString(5, dto.getZipcode());
				pstmt.setString(6, dto.getAddress1());
				pstmt.setString(7, dto.getAddress2());				
				pstmt.setString(8, dto.getJob());
				pstmt.setString(9, dto.getId());
				
				cnt = pstmt.executeUpdate();
				
		} catch(Exception e) {
			System.out.println("수정 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		}//try() end
		
		return cnt;
	}//MUP() end
	
	public int withdrawProc (MemberDTO dto) {
		int cnt = 0;
		
		try {
				con = dbopen.getConnection();
				
				sql = new StringBuilder();
				sql.append(" UPDATE member ");
				sql.append(" SET mlevel = 'F1' ");
				sql.append(" WHERE id = ? AND passwd = ? ");			
				
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPasswd());
				
				cnt = pstmt.executeUpdate();
				
		}catch(Exception e) {
			System.out.println("탈퇴 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		}//try end
		
		return cnt;
	}//withP() end
	
}//DAO end
