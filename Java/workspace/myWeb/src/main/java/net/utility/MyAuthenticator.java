package net.utility;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator {
	// 사용하고자하는 메일 서버(=POP3=SMTP)에서 인증받은 계정 + 비밀번호 등록
	
	private PasswordAuthentication pa;
	
	//default constructor
	public MyAuthenticator() {
		pa = new PasswordAuthentication("soldesk@pretyimo.cafe24.com", "soldesk6901");
		//						("계정명","비밀번호");
	}//end
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
	// → private로 막아놨기때문에 override해서 클래스 호출시엔 pa(계정과비밀번호담아놓은변수)로 리턴 
	
}//class end
