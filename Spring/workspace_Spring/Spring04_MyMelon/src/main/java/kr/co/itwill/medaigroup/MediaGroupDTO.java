package kr.co.itwill.medaigroup;

public class MediaGroupDTO {

	
	// field
	private int mediagroupno;      
	private String title;
	
	
	// default constructor
	public MediaGroupDTO() {}

	
	// getter·setter
	public int getMediagroupno() {
		return mediagroupno;
	}

	public void setMediagroupno(int mediagroupno) {
		this.mediagroupno = mediagroupno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	
	// to String()
	@Override
	public String toString() {
		return "MediaGroupDTO [mediagroupno=" + mediagroupno + ", title=" + title + "]";
	}
	
	
}//DTO end
