package oop0915;

class Unit {
	int cuurentHP;
	int x,y;
	
}//Unit end

interface Movable {
	void move(int x, int y);
}//Mov.int end

interface Attackable{
	void attack (Unit u);
}//Att.int end


// 인터페이스간의 상속 = extends , 다중상속 가능(class-extends는 다중상속안됨)
interface Fightable extends Movable, Attackable {}//Fig.int end


class Fight extends Unit implements Fightable{
	// 클래스간의 상속은 단일 상속만 가능
	// 클래스-클래스-인터페이스 = 교차 상속 가능 
	// Override 필수 (추상메소드니까 당연~)
	
	@Override
	public void move(int x, int y) {}
	@Override
	public void attack(Unit u) {}

}//Fig.cla end


class Tetris extends Unit implements Movable,Attackable {

	@Override
	public void attack(Unit u) {}
	@Override
	public void move(int x, int y) {}
	
}

public class Test07_interface {

	public static void main(String[] args) {
		/*	 (런 안할거임 공부용)
		 
		  	 ● 클래스와 인터페이스의 상속
		  	 
		  	 	  자식 		  부모 
		  	 -   class       class   : extends    : 다중상속 X
		  	 - 	 class     interface : implements : 다중상속 O
		  	 - interface   interface : extends    : 다중상속 O
		  	 		
		  	 -   class   class,interface          : 교차·다중상속 O 
		  	 → class 자식클래스 extends 부모클래스 implements 부모인터페이스,부모인터페이스2 {}    		  

		*/
	}//main() end
}//class end
