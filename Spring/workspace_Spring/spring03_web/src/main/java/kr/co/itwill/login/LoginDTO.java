package kr.co.itwill.login;

public class LoginDTO {
	
	// field
	private String id;
	private String pw;
	
	public LoginDTO() {}// default constructor
	
	// getter · setter 
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	// toString() 생략 : 사용하지 않을거임


}// DTO end
