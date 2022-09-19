package oop0919;

				// 자바에서 제공되는 Thread 클래스를 상속받아 사용한다
class MyThread2 extends Thread {
				// class는 단일상속만 가능하기때문에 이미 다른 클래스를 상속받은 경우
				// Thread의 부모인 Runnable을 implements한다. 
	
	private int num;
	private String name;
	
	public MyThread2() {}
	public MyThread2(int num, String name) {
		this.num = num;
		this.name = name;
	}//end
	
	// start는 run을 호출하는 코드만 짜여져있기때문에(run();) 오버라이드 할 필요가 없다. 
	// ※ 단 *호출*시에는 start로 호출해야함
	@Override
	public void run() {
		for(int i=0; i<=num; i++) {
			System.out.println(name + ":" + i);
		}
	}//run() end 
	
}//MT2.cla end

public class Test03_thread {

	public static void main(String[] args) {
		// 2. 스레드를 사용한 경우 
		// → JVM(자바가상머신)이 스레드 관리자에 등록하고, start()메소드가 run()을 호출한다
		// ex. 실시간 채팅, 실시간 예매(현장/네이버/인터파크에 나눠서 예매하는 것처럼)
		
		
		MyThread2 t1 = new MyThread2(1000,"★");
		MyThread2 t2 = new MyThread2(1000,"★★");
		MyThread2 t3 = new MyThread2(1000,"★★★");
		
		t1.start();
		t2.start();
		// ★과 ★★이 섞여서 나온다. (먼저 실행된 코드가 cpu를 단독으로 점유하지 않고 뒤에 적힌 코드와 
		//					   동시다발적으로 실행된다 = 실시간 채팅)
		t3.start();
		
	}//main() end
}//class end
