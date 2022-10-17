package net.member;

public class MemberDTO {	// Data Transfer Object 전송 객체

	// field
	private String id;    	
	private String passwd; 		
	private String mnam;   
	private String tel;     
	private String emai;    
	private String zipcod;
	private String address;
	private String address2;
	private String job;
	private String mlevel;
	private String mdate;

	public MemberDTO() {} //default constructor 

	// getter·setter method
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getMnam() {
		return mnam;
	}

	public void setMnam(String mnam) {
		this.mnam = mnam;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmai() {
		return emai;
	}

	public void setEmai(String emai) {
		this.emai = emai;
	}

	public String getZipcod() {
		return zipcod;
	}

	public void setZipcod(String zipcod) {
		this.zipcod = zipcod;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getMlevel() {
		return mlevel;
	}

	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	// toString : 오류확인
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", passwd=" + passwd + ", mnam=" + mnam + ", tel=" + tel + ", emai=" + emai
				+ ", zipcod=" + zipcod + ", address=" + address + ", address2=" + address2 + ", job=" + job
				+ ", mlevel=" + mlevel + ", mdate=" + mdate + "]";
	}

}//DTO end
