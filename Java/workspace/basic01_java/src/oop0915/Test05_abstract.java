package oop0915;

abstract class Travel {				// 추상클래스
	
	void view() {} 					// 일반메소드
	abstract String travelWhere();  // 추상메소드
	
}//Tra.cla end

class TypeA extends Travel{
	
	@Override
	String travelWhere() {
		return "제주도 올레길";
	}
	
	
}//A.cla end

class TypeB extends Travel{
	
	@Override
	String travelWhere() {
		return "여의도 벚꽃축제";
	}
	
	
}//B.cla end

class TypeC extends Travel{
	
	@Override
	String travelWhere() {
		return "지리산 둘레길";
	}
	
	
}//C.cla end



public class Test05_abstract {

	public static void main(String[] args) {
		/*
		 	 ● 추상 클래스와 다형성
		*/
		
		Travel tour = new TypeA();
		System.out.println(tour.travelWhere());		// 제주도 올레길
		
		tour = new TypeB();
		System.out.println(tour.travelWhere());		// 여의도 벚꽃축제
		
		tour = new TypeC();
		System.out.println(tour.travelWhere());		// 지리산 둘레길 
		
		
		
		

	}//main() end
}//class end
