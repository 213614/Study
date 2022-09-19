package oop0919;

import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;

// 상품을 구매할 수 있는 관련 클래스 
public class Buyer {
	// field
	private int Mymoney = 1000;		// 나의 총 재산
	private int MyMileage = 0; 		// 나의 마일리지 점수(bonusPoint 누적값)
	private int i = 0;
	
	// 상품을 구매했을 때 어떠한 상품을 구매했는지 저장(총 마일리지 점수를 위해)
	// 구매 목록 배열 = 자료형 통일을 위해 list,set,map을 활용하기도한다
	// ★ 공통 부모인 Product를 다형성으로 이용하여 배열을 만들 수 있음
	Product[] item = new Product[10]; 
	/*
    	Product[] = 
		+------------+-------------+-------------+--------
		|  SmartTV   |    Laptop   |    Phone    |  ~~
		+------------+-------------+-------------+--------
		   item[0]        item[1]       item[2]      ~~
	*/
	
	
	// constructor
	public Buyer() {}
	
	
	// method
	// Test01_buyer에서 상품 진열 - 각 변수의 자료형이 다 다르기때문에 매개변수도 다 다르게해야함
	/* *메소드 Overloading(함수명중복가능)*해서 자료형별로 함수 만들기
	public void buy(SmartTV a) {}//buy() end
	public void buy(Laptop a) {}//buy() end
	public void buy(Phone a) {}//buy() end
	*/
	// 매개변수에 공통 부모를 넣으면 메소드를 따로 안만들어도 된다. 
	// = 자식클래스들이 부모한테 상속된 것(price,bP)을 크게 변경치 않고 사용했기때문에 가능
	public void buy(Product a) {	// ← 다형성
									// : Product → SmartTV | Laptop | Phone
		
		item[i++] = a;		// 구매 상품 저장 
		//멤버변수에 선언해놓은 i 활용, a를 item변수에 저장할때마다 i++ = item 배열에 a들이 저장됨
		this.Mymoney = this.Mymoney - a.price;
		// 가진 금액(기본1000) - 상품 가격 을 다시 가진 금액에 저장(점점 감소)
		// 들어온 a가 SmartTV면 Product()의 자식인 SmartTV()로 가서 계산된다 = 각각의 클래스로 간다
		this.MyMileage = this.MyMileage + a.bonusPoint;
		// 마일리지(기본 0) + 상품의 적립포인트 = 다시 마일리지에 저장(점점 증가)

		// Q. 상품을 가진 금액보다 많이 구매 시 잔액 부족 출력하기 
		if(Mymoney<a.price) {
			System.out.println("잔액 부족");
			return;
		}
		
	}//buy() end	
	public void disp() {
		
		// Q. 구매 목록과 총 결제 금액(구매 상품의 합계금)을 출력
		// item[]활용하기 
		//String a = item[i++].toString();
		String a = Arrays.toString(item);
		/* null값 제거..→ 구매 목록 : [스마트TV, 노트북, 핸드폰, null, null, null, null, null, null, null]
		if (a.isEmpty()) {
			System.out.println("null");
		}
		List<Product> a = Arrays.asList(item);
	    Iterator<Product> it = a.iterator();        
	    while (it.hasNext()) {            
	    	if (it.next() == null) {                
	    		it.remove();            
	    		}        
	    	} 
		List<Product> a = Arrays.asList(item);
	    a.removeIf(null);
	    */  
		//int c = 0; // 상품 합계금

		// 강사님
		// 구매한 상품 목록
		StringBuilder shoplist = new StringBuilder();
		
		// 사용 금액
		int hap = 0;
		
		for (int n=0; n<item.length; n++) {
			if (item[n] == null) {
				// null = 구매한 상품이 더이상 없으면 for문 빠져나오기 
				break;	
			}
			shoplist.append(item[n].toString()+" "); // 상품명
			hap += item[n].price;
		}
		
		
		
		System.out.println("구매 목록 : " + shoplist);
		System.out.println("총 결제 금액 : " + hap + "원");
		System.out.println("　잔액　 : " + this.Mymoney + "원");
		System.out.println("마일리지 : " + this.MyMileage);
		
	}//disp() end
	
	
	
	
	
}//Buyer.cla end
