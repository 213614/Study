package oop0919;

public class Product extends Object {	// 오브젝트 생략가능
	//field
	public int price;				// 상품가격
	public int bonusPoint;			// 마일리지 
		
	//constructor
	public Product() {}				// default constructor
	public Product(int price) {
		// this.멤버변수 = 지역변수;
		this.price = price;	
			
		// 상품 가격의 10%를 보너스 포인트로(마일리지) 책정
		this.bonusPoint = (int)(price*0.1);
	}//Product.con end
		

}//Product.cla end


// 각 class마다 price,bonusPoint(Product{}-public)가 있음 
class SmartTV extends Product{
		
	// 부모클래스의 price을 사용하는 방법
 	public SmartTV() {
 		super(100);		// 상품가격, price=100·bonusPoint=10이 적용된다
 		// ↑ Product(부모)의 생성자함수로 감 → 100이 int price로 대입
 	}
	
 	@Override
 	public String toString() {
 		return "스마트TV";	// 상품명 
 	}
		
}//TV.cla  end


class Laptop extends Product{
 	
	public Laptop() {
 		super(200);			// 상품가격, price=200·bonusPoint=20		
 	}
	
 	@Override
 	public String toString() {
 		return "노트북";		// 상품명 
 	}
 	
}//LT.cla  end


class Phone extends Product{
	
	public Phone() {
 		super(150);			// 상품가격, price=150·bonusPoint=15	
 	}
	
 	@Override
 	public String toString() {
 		return "핸드폰";		// 상품명 
 	}
	
}//PH.cla  end






