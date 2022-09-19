package oop0919;

import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.Vector;

// 상품을 구매할 수 있는 관련 클래스 
public class Order {
	// field
	private int Mymoney = 1000;		// 나의 총 재산
	private int MyMileage = 0; 		// 나의 마일리지 점수(bonusPoint 누적값)
	private int i = 0;
	
	// 상품을 구매했을 때 어떠한 상품을 구매했는지 저장(총 마일리지 점수를 위해)
	private Vector<Product> item = new Vector<>();

	
	// constructor
	public Order() {}
	
	
	// method

	public void buy(Product a) {
		
		//item[i++] = a;
		item.add(a);		// 구매 상품 저장 
		
		this.Mymoney = this.Mymoney - a.price;
		this.MyMileage = this.MyMileage + a.bonusPoint;

		// Q. 상품을 가진 금액보다 많이 구매 시 잔액 부족 출력하기 
		if(Mymoney<a.price) {
			System.out.println("잔액 부족");
			return;
		}
		
	}//buy() end	
	public void disp() {
		
		if(item.isEmpty()) {
			System.out.println("구매 상품이 없습니다.");
			return;		// 아래 명령어들을 작동시키지않고 호출 위치로 되돌아감
		}
		
		// 구매한 상품 목록
		StringBuilder shoplist = new StringBuilder();
		
		// 사용 금액
		int hap = 0;
		
					//item.length();
		for (int n=0; n<item.size(); n++) {
			if (item.get(n) == null) {
				// null = 구매한 상품이 더이상 없으면 for문 빠져나오기 
				break;	
			}
			shoplist.append(item.get(n).toString()+" "); // 상품명
			hap += item.get(n).price;
				 //item[n]
		}
		
		/*
		// 강사님
		for (int n=0; n<item.size(); n++) {
			Product p = item.get(n);		   // 상품 하나씩 가져오기
			shoplist.append(p.toString()+" "); // 상품명
			hap += p.price;
		}
		*/
		
		System.out.println("구매 목록 : " + shoplist);
		System.out.println("총 결제 금액 : " + hap + "원");
		System.out.println("잔액 : " + this.Mymoney + "원");
		System.out.println("마일리지 : " + this.MyMileage);
		
	}//disp() end

	
	public void refund(Product a) {
		// 반품이니까 금액은 다시 더하고, 마일리지는 빼야함
		item.remove(a);
			
		this.Mymoney = this.Mymoney + a.price;
		this.MyMileage = this.MyMileage - a.bonusPoint;
		
		System.out.println(a + "이 반품되어 " + a.price + "원이 환불됩니다.");
		
		/*
		// 강사님
		if(item.remove(a)) {
			System.out.println(a.toString() + "이 반품되었습니다.");
			this.Mymoney = this.Mymoney + a.price;
			this.MyMileage = this.MyMileage - a.bonusPoint;
		}else {
			System.out.println("구매 내역에 상품이 존재하지 않습니다.");
		}
		*/
	}//refund() end
	
}//Buyer.cla end
