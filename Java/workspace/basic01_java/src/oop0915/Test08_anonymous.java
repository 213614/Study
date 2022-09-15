package oop0915;

interface IMessage {
	
	public void msgPrint(); // 추상메소드
	
}//IM.int end

class Message implements IMessage {
	
	@Override
	public void msgPrint() {
		System.out.println("Message class");
	}
	
}//Mes.cla end


public class Test08_anonymous {

	public static void main(String[] args) {
		/*
			 ● Anonymous class ; 익명 내부 객체
			   = 이름이 없는 객체(클래스)
			   → 추상클래스나 인터페이스를 잠깐씩(일회성으로) 메모리 할당하고 선언하고싶을때 사용한다
		*/
		
		// 인터페이스 직접 메모리 할당(객체 생성)불가
		// IMessage msg = new IMessage();    → !error
		
		// 1. implements class 구현 클래스
		Message msg = new Message();
		msg.msgPrint();
		
		// 2. 다형성
		IMessage imes = new Message();
		imes.msgPrint();
		
		// 3. 익명 객체 Anonymous object 
		//    → 필요한 곳에서 일시적으로 생성, 이벤트(in JS ; ex.onclick···.)가 발생할 때만 실행 
		//    → 모바일 응용 앱, JavaScript, jQuery등에서 많이 사용
		//    → ex. $("button").click(){}  = 버튼을 클릭했을때 {}이 작동된다
		//    ※ 클래스가 아닌데(main 함수 안에있으니까) 클래스처럼 생겼다~ 
		IMessage mess = new IMessage() {
			@Override
			public void msgPrint() {
				System.out.println("익명 내부 객체");
			}
		};
		
		mess.msgPrint();
		System.out.println(mess);
		
	}//main() end
}//class end
