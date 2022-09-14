package oop0914;

public class Test06_idnumber {

	public static void main(String[] args) {
		// Q.주민등록번호 유효성검사 
		// jumin class 생성 후 실습 
		/*
		 	주민등록번호 가장 마지막 번호를 제외하고
		 	각 자리에 234567 - 892345를 각각 곱한 값을 모두 더한 후
		 	그 값을 11로 나누고 나머지 값을 다시 11에서 뺀 수가 가장 마지막 번호와 동일해야한다  
		 	→ 주|민|등-록|번|호(-마지막번호제외) * 2|3|4|5|6|7-8|9|2|3|4|5
		 	→ 각 곱한 값을 모두 더한다
		 	→ 전부 더한 값 ÷ 11 = 몫.. 나머지
		 	→ 11 - 나머지 == 주민등록번호 가장 마지막번호 
		 	→ 동일하면 올바른 주민등록번호
		*/
		
		Jumin id = new Jumin("8912301234567");
		
		if(id.validate()) {
			System.out.println("올바른 주민등록번호입니다.");
			id.disp(); 
		}else {
			System.out.println("잘못된 주민등록번호입니다.");
		}
	
		
	}//main() end
}//class end
