package net.sungjuk;

public class SungjukDTO {
	// Data Transfer Object = DTO = 전송 객체 (= Value Object, VO라고 하기도한다)
	// ★★★★★ getter / setter을 사용하는 클래스를 DTO클래스(=보호클래스)라 한다 아아아아아주중요!
	
	// sungjuk 테이블의 칼럼명을 기준으로 칼럼 하나하나당 접근 가능한 멤버변수(field)를 만든다(=선언한다)
	// 테이블의 칼럼명을 변수명으로 사용한다 
	private int snum; 
	private String uname;
	private int kor;   
	private int eng;  
	private int mat;   
	private int aver;  
	private String addr;  
	private String wdate;

	public SungjukDTO() {} //default constructor

	// private 멤버 변수 각각에 대한 getter/setter 함수 작성 (Source → Generate getter/setter···.)
	public int getSnum() {
		return snum;
	}

	public void setSnum(int snum) {
		this.snum = snum;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMat() {
		return mat;
	}

	public void setMat(int mat) {
		this.mat = mat;
	}

	public int getAver() {
		return aver;
	}

	public void setAver(int aver) {
		this.aver = aver;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	// ↓ toString()함수를 이용하여 DTO 클래스에 에러가 있는지 없는지 확인한다 (Source → Generate toString()···.)
	@Override
	public String toString() {
		return "SungjukDTO [snum=" + snum + ", uname=" + uname + ", kor=" + kor + ", eng=" + eng + ", mat=" + mat
				+ ", aver=" + aver + ", addr=" + addr + ", wdate=" + wdate + "]";
	}
	
	
	
	
	
	
}//class end
