package oop0916;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class Test03_List {

	public static void main(String[] args) {
		/*
		 	  ● Java Collection Framework (교재 chapter13)
		 	    - 자료를 모아서 저장할 수 있는 클래스 및 인터페이스
		 	    ex. 댓글을 DB에서 10권을 불러와야한다고 친다면 1권씩 불러서 프론트단으로 던지는게 아니라
		 	    	10권을 한번에 던지는 것이 더 효율적이다 = 이럴때 list를 쓴다
		 	    	
		 	    ○ List 	: 순서(Index)가 존재한다(배열이랑 비슷하다고 생각하면 됨), Index는 0부터 시작 
		 	    		- List		   : 비슷한 이름이 많으니 인터페이스인지 클래스인지 잘 확인하고 호출하기 
		 	    		- Vector       : 메모리를 많이 잡아먹음 = 좀 무거움
		 	    		- ArrayList ~  : 벡커의 가벼운 버전이라 더 자주 사용함  
		 	    		
		 	    ○ Set   : 순서가 없다. 
		 	    		- Set
		 	    		- HashSet ~ 
		 	    		
		 	    ○ Map	: 모아놓은 자료에 각자 이름을 부여해서 그 이름만 호출하면 됨 = 자주 사용함 (JSON in JS)
		 	            : 순서가 없다(지정해놓은 이름으로 호출) key와 value값으로 구성되어 있음
		 	            - Map
		 	            - HashMap
		 	            - Properties
		 	            - HashTable ~   
		 	            
		 	    → 족보 확인 
		 	    interface List {} 
		 	    
		 	    class Vector 	  implements List {}
		 	    class ArrayList   implements List {} 
		 	    
		 	    interface Set{}
		 	    class HashSet     implements Set {}
		 	    
		 	    interface Map {}
		 	    class HashMap 	  implements Map {}
		 	    class Properties  implements Map {}
		 	    class HashTable	  implements Map {}
		 	    
		 	    → 다형성
		 	    List li = new Vector()
		 	    List li = new ArrayList()
		 	    
		 	    Set set = new HashSet()
		 	    
		 	    Map map = new HashMap()
		 	    Map map = new Properties()
		 	    Map map = new HashTable()
		 	    
		 	    다형성 : = 기준으로 왼쪽의 자료형은 부모의 클래스명 오른쪽은 new 다음으로 자식의 클래스명이 온다
		*/
		
		// 배열 : 자료를 모아놓을 수 있다. 단, =을 기준으로 양쪽이 자료형이 같아야한다
		int[] num = new int[100];
		
		// 1. List 계열
		// Vector<E> : 배열과 거의 동일하다 
		//        ↑ = Element, 지워도됨(경고표시는 나오는데 상관x) → <>를 제네릭이라고 부른다 
		Vector vec = new Vector();
		vec.add(3);
		vec.add(2.4);
		vec.add('R');
		vec.add("KOREA");
		vec.add(new Integer(5));
		vec.add(new Double(6.7));
		
		//Integer inte = new Integer(5)		: Old Version
		//Integer inte = 5 					: New Version
		
		System.out.println(vec.size());     // 6 → 요소의 총 개수(3, 2.4, R, KOREA, 5, 6.7)  
		
		for (int i=0; i<vec.size(); i++) {
			System.out.println(vec.get(i));
		}//for end
		
		System.out.println("#" + vec.get(2));	// #R : 두번째 요소 'R'
		
		vec.remove(0);   				 // 0번째 요소 제거! 
		System.out.println(vec.size());  // 5 = 0번째 요소(3)제거했으니까 요소 총 5개 
		
		vec.removeAllElements(); 		 // 모든 요소 제거
		System.out.println(vec.size());  // 0 = 모든 요소 제거했으니까 0개 
		
		//        ↓ Vector의 요수의 개수가 0개인지 물어보는 함수
		if (vec.isEmpty()) {
			System.out.println("Empty");
		} else {
			System.out.println("Full");
		}//if end

		
		System.out.println("------------------------------");
		
		
		// 1-1. 다형성을 이용하여 객체 생성 
		List li = new ArrayList();
		li.add(5);
		li.add(6.7);
		li.add('M');
		li.add("Seoul");
		
		System.out.println(li.size());	// 요소의 총 개수 = 4
		
		// Q. li가 가지고 있는 요소를 remove()를 이용하여 모두 삭제한다 
		// → 사고력 연습 문제 
	
		for(int i=0; i<li.size(); i++) {
				li.remove(i--);
		} 
		
		System.out.println(li.size()); // 0 
		
		/*
		// 강사님
		for (int i=li.size()-1; i>=0; i--) {
			li.remove(i);
		}
		
		System.out.println(li.size());
		*/
		
	}//main() end
}//class end
