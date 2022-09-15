package oop0915;

import oop0915.WebProgram.Language;
import oop0915.WebProgram.Smart;

class WebProgram{ // 웹페이지를 작성할때 사용하는 언어 : .jsp(java) | .py(python) | .asp(MS) | .php 
	// field
	String title = "Java Program";
	
	
	//Inner class : 클래스 내부에서 선언된 클래스 
	class Language {
		String basic = "JAVA, HTML, CSS, JavaScript";
		void disp() {
			System.out.println("기초수업 : " + basic);
		}
	}//Lan.inn end
	
	class Smart {
		String basic = "Objective-C, Java OOP, C#";
		void disp() {
			System.out.println("기초수업 : " + basic);
		}
	}//Lan.inn end
	
	
	// method
	public void print() {
		Language lang = new Language();
		lang.disp();
		
		Smart sm = new Smart();
		sm.disp();
	}//print() end
	
}//WP.cla end

public class Test09_innerclass {

	public static void main(String[] args) {
		/*
			  ● Innner class ; 내부 클래스 
			    → 자주 사용하지는 않음 
			    
			    → 클래스 내부에 선언된 클래스 
			    → 클래스 내에서만 쓰려고 선언한거지만 외부 접근도 가능하긴함 
		*/

		WebProgram web = new WebProgram();
		web.print();
		/* 
		   ※ (주의) : 내부 클래스여도 빈공간에서 Ctrl+Space로 보인다 하지만 보여진다고해서 
		             main에서 작성하면(이너 클래스를 해당 클래스 밖에서 작성하면) 오류남
		             = 내부 클래스는 *직접* 접근할 수 없다
		             → 외부에서부터 접근하는식으로 간접 접근 가능
		*/
		// 내부 클래스는 *직접* 접근할 수 없다
		// Language lang = new Language();	  → !error	
		// Smart sm = new Smart();			  → !error	
		
		// 내부클래스는 외부에서부터 접근하는식으로 *간접* 접근 가능
		Language lang = new WebProgram().new Language();
		lang.disp();
		
		Smart sm = new WebProgram().new Smart();
		sm.disp();
		
//---------------------------------------------------------------------------------------------
		
		/*
		 	 안드로이드 : 구글사에서 만든 모바일 전용 OS(운영체제)
		 	 → 에 들어가는 응용앱을 작성하려면 R 클래스를 꼭 마주칠꺼임 (개발자가 작성하는 것이 아니라 기본제공)
		 	    class R {
		 	    	class id{
		 	    		String btn = "버튼";
		 	    	}
		 	   }
		 	
		 	 → 접근 방식 : R.id.btn
		*/
		
		
	}//main() end
}//class end
