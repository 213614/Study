package oop0919;

class MyThread1 {
	private int num;
	private String name;

	public MyThread1() {}
	public MyThread1(int num, String name) {
		this.num = num;
		this.name = name;
	}//end
	
	public void start() {
		run();				//→ start를 통해 run호출
	}//start() end
	public void run()	{
		for(int i=0; i<=num; i++) {
			System.out.println(name + ":" + i);
		}
	}//run() end
	
}//MT1.cla end

public class Test02_thread {

	public static void main(String[] args) {
		/*
		 		● Thread class ; 스레드 
		 		 → 하나의 프로그램이나 하나의 메소드가 CPU자원을 전부 점유하는 것을 막을 수 있다
		 		 ex. 실시간 채팅창 
		*/
		
		// 1. 스레드를 사용하지 않는 경우 → 먼저 동작중인 프로그램이 완료될 때까지 무한 실행 대기
		MyThread1 t1 = new MyThread1(1000,"★");
		MyThread1 t2 = new MyThread1(1000,"★★");
		MyThread1 t3 = new MyThread1(1000,"★★★");
		
		t1.start();
		t2.start();		
		// ★★은 별 하나가 1000개 다 찍힐 때까지 동작하지 않고 대기한다(★:1000 → ★★:0)
		t3.start();
		// 앞의 별들 2000개가 모두 출력 될 때까지 실행대기
		
		
		// → Test03_thread 
		
		
		
		
		
	}//main() end
}//class end
