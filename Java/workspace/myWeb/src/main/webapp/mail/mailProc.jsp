
<%@page import="javax.mail.Transport"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="net.utility.Utility"%>
<%@page import="javax.mail.Session"%>
<%@page import="net.utility.MyAuthenticator"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="../header.jsp" %> <!-- 경로는 그때그때 수정 -->

	<!-- 본문 시작 mailProc.jsp -->
	<h3> 전송결과 </h3><br>
<%
	try{
		  // ★★ import할때 패키지명 잘 신경쓰기! javax.mail 임! ★★
		
		  // ①. 사용하고자하는 메일 서버에서 인증받은 계정과 비밀번호 등록
		  // → MyAuthenticator 클래스 생성
		  
		  // ②. 메일 서버(POP3/SMTP)지정
		  String mailServer = "mw-002.cafe24.com";	// 강사님 cafe24 메일서버 
		  // → 인증받은 계정과 비밀번호가 뭔지 class Authenticator를 이용하여 알려주어야함 → 비밀번호는 오픈되면 안되니까 
		  Properties props = new Properties();
		  // Properties = HashMap → key:value : 객체생성파일(oop0916_Test04) 참조
		  props.put("mail.smtp.host", mailServer );
		  props.put("mail.smtp.auth", true);
		  
		  // ③. 메일서버에서 인증받은 계정+비밀번호 
		  Authenticator myAuth = new MyAuthenticator();		// 다형성
		  
		  // ④. 2-3단계가 유효한지 검증
		  Session sess = Session.getInstance(props, myAuth);
		  //out.print("메일 서버 인증 성공");
		  
		  // ⑤. 메일 보내기
		  request.setCharacterEncoding("UTF-8"); //한글변환
		  
		  String to 	 = request.getParameter("to").trim();
		  String from    = request.getParameter("from").trim();
		  String subject = request.getParameter("subject").trim();
		  String content = request.getParameter("content").trim();
		  
		  // ⑤-1. 엔터 및 특수문자 변환
		  content = Utility.convertChar(content);
		  
		  // ↓ 여기에 담은 content는 메일 보내기에 내용 적은것 밑에 자동으로 붙어간다 (꼬릿말)
		  content += "<hr>";
		  content += "<table border='1'>";
		  content += "	<tr>";
		  content += "		<th> 상품명 </th>";
		  content += "		<th> 가　격 </th>";
		  content += "	</tr>";
		  content += "	<tr>";
		  content += "		<td> 운동화 </td>";
		  content += "		<td><span style='color:red; font-weight:bold;'>15,000원</span></td>";
		  content += "	</tr>";
		  content += "</table>";
		  
		  // 이미지 출력하기 
		  content += "<hr>";
		  content += "<img src='http://localhost:9090/myweb/images/apeach.png'>";
		  // 							 ↑ 192.168.14.17(고유ip주소)로 보내면 이미지 깨진다
		  // 이미지 파일 자체를 첨부하여 보내는 것이 아닌 보여질수만 있도록 서버에 있는 이미지를 전송해주는 것뿐이다
		  
		  // 받는 사람 이메일 주소 → 받는 이가 여러명 일 수 있기때문에 배열로 넘긴다.
		  // ○ 수신인이 한명일 경우
		  InternetAddress [] address = { new InternetAddress(to) } ;
		  
		  /* 
		  	 ○ 수신인이 여러명일 경우
		  InternetAddress [] address = {  new InternetAddress(to1)
				  					     ,new InternetAddress(to2)
				  					     ,new InternetAddress(to3) 
				  					     , ···.} ;
		  */ 
		  
		  // 메일가 관련된 정보 작성 후 그 정보 전송(클래스가 있음)
		  // 계정+비밀번호가 담긴 세션을 이용해서 메세지 변수를 만든 후 거기다가 모든 메일 정보를 담아서 전송(transport)한다
		  Message msg = new MimeMessage(sess);
		  
		  // 수신자 (참조(CC), 숨은 참조도(BCC) 보낼 수 있다) 
		  msg.setRecipients(Message.RecipientType.TO, address);
		  //              ↑ 's'가 있어야함 주의! 
		  // 				Message.RecipientType.CC	: 참조
		  // 				Message.RecipientType.BCC  : 숨은 참조 : 참조된 수신자들의 이메일 주소가 가려진다 
		  
		  // 발신자
		  msg.setFrom(new InternetAddress(from));
		  
		  // 제목
		  msg.setSubject(subject);
		  
		  // 내용 (★content:내용이 중요하다)
		  msg.setContent(content, "text/html; charset=UTF-8");
		  
		  // 보낸 날짜
		  msg.setSentDate(new Date());
		  
		  // 전송
		  Transport.send(msg);
		  
		  out.print(to + "님에게 메일이 발송되었습니다.");
		  
		  
	}catch(Exception e){
		out.println("<p>메일 전송 실패 : " + e + "</p>");
	    out.println("<p><a href='javascript:history.back()'>다시시도</a></p>");	
	}//try end



%>
	
	
	<!-- 본문 끝 -->
	
<%@ include file="../footer.jsp" %> <!-- 경로는 그때그때 수정 -->