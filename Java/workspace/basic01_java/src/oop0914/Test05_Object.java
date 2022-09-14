package oop0914;

class Jeju extends Object {
	@Override
	public String toString() {
		return "제주도";
	}
} //Jeju.class end

class Suwon extends Object {
	private String id="itwill";
	private String pw="1234";
	
	// 내가 준 값이 맞는 변수에 제대로 들어갔는지 수시로 확인해야한다 
	// 그런 용도로 override toString을 사용한다 
	@Override
	public String toString() {
		return "Suwon　　[id = " + id + ", pw = " + pw +"]";
	}// Suwon [id = itwill, pw = 1234] 로 출력 → private이지만 이렇게하면 값을 확인 할 수 있음
	
} //Suwon.class end

// extends Object 생략가능 
class Incheon {
	private String name = "인천광역시";
	private String phone = "789-4566";
	/*
	@Override
	public String toString() {
		return "Incheon [name = " + name + ", ☏ " + phone + "]";
	}
	*/
	@Override
	public String toString() {
		return "Incheon [name = " + name + ", phone = " + phone + "]";
	  //return "Incheon [name=" + name + ", phone=" + phone + ", toString()=" + super.toString() + "]";
	  //불 필요한 값 삭제
	}

} //Incheon.class end

public class Test05_Object {

	public static void main(String[] args) {
		/*
			 ● Object class 
			 - 자바의 최상위 조상 클래스 
			 - 자바 기본 패키지(java.lang)에 선언되어있다
			 - 자바의 모든 클래스는 무.조.건 Object 클래스를 상속받는다 
			 → public class Test05_Object 'extends Object' {}
			 								→ 상속이 생략된 것 
			 - 자바의 모든 클래스는 Object클래스의 후손이다 (무조건 상속)
		*/
		
		Jeju je = new Jeju();
		System.out.println(je.toString());
		
		Suwon su = new Suwon();
		System.out.println(su.toString());

		Incheon in = new Incheon();
		System.out.println(in.toString());
		
		// 함수이름(toString)을 생략가능 
		System.out.println(je);
		System.out.println(su);
		System.out.println(in);
		
		
		
	}//main() end
}//class end
