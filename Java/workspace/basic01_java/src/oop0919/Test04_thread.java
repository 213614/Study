package oop0919;

class MyThread3 implements Runnable{

	private int num;
	private String name;
	
	public MyThread3() {}
	public MyThread3(int num, String name) {
		this.num = num;
		this.name = name;
	}//end
	
	@Override
	public void run() {
		for(int i=0; i<=num; i++) {
			System.out.println(name + ":" + i);
		}
	}//run() end
	
}//MT3.cla end

public class Test04_thread {

	public static void main(String[] args) {
		/*	
			 interface Runnable{}
			 class Thread implements Runnable{}
		*/
		// 3. Runnable interface 이용하여 스레드 구현
		//    (스레드 구현 시 이미 class를 상속받은게 있다면 이 방법을 이용한다)
		
		
		Thread t1 = new Thread(new MyThread3(1000,"♡"));
		Thread t2 = new Thread(new MyThread3(1000,"♡♡"));
		Thread t3 = new Thread(new MyThread3(1000,"♡♡♡"));
		
		t1.start();
		t2.start();
		t3.start();
		
	}//main() end
}//class end
