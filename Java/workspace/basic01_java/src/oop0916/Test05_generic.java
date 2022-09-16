package oop0916;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Vector;

class Mountain {
	String name;
	int height;
	
	public Mountain() {}
	public Mountain(String name, int height) {
		this.name = name;
		this.height = height;
	}
	
}//class end




public class Test05_generic {

	public static void main(String[] args) {
		/*
		 	  ● 제네릭 generic
		 	    - 요소를 수집하는 경우 원하는 특정 자료형으로 제한할 수 있다
		 	    ○ <E>		Element
		 	    ○ <K,V>		Key, Value
		 	    ○ <T>
		 	    ○ <?>
		 	    - 사용자 정의로도 만들 수 있다
		 	    - 교재 Chapter 참조자료형
		 */
		
		// int형만 num배열에 대입 가능하다 
		int[] num = new int[3];
		
		//      ↓ int,char같은 기본 자료형은 못오고 클래스만 올 수 있다 = Vector<int> !error!
		Vector<String> vec = new Vector<>();
		//							    ↑ 앞 제네릭이 잘 적혀있으면 뒤는 생략 가능
		vec.add("개나리");
		vec.add("진달래");
		vec.add(new String("무궁화"));
		// vec.add(3);						!error :
		// vec.add(2.4);					!error :
		// vec.add(new Character('R'));		!error : String형이(문자열) 아닌 값은 들어갈 수 없다
		
		for(int i=0; i<vec.size(); i++) {
			String str = vec.get(i);
			System.out.println(str);
		}
	
//---------------------------------------------------------------------------------------------
		
		ArrayList<Integer> list = new ArrayList<>();
		list.add(3);
		list.add(new Integer(5));
		// list.add(2.4);					!error :
		// list.add("KOREA");				!error : Integer형이(정수) 아닌 값은 들어갈 수 없다
		
//---------------------------------------------------------------------------------------------
		
		HashSet<Double> dou = new HashSet<>();
		dou.add(1.2);
		dou.add(3.5);
		// dou.add(2);			 !error : 
		// dou.add("KOREA");     !error :
		// dou.add('e');         !error : Double형이(실수) 아닌 값은 들어갈 수 없다
		
//---------------------------------------------------------------------------------------------
		
		HashMap<String, Character> map = new HashMap<>();
		map.put("one", 'R');
		map.put("two", new Character('r'));
		// map.put("", "");		!error : 
		// map.put(1,2.5);      !error : key값에는 String형만(문자열), value값에는 Character형만(문자) 들어갈 수 있다
		
		System.out.println(map.get("one"));		// R
		
//---------------------------------------------------------------------------------------------
		
		Mountain m1 = new Mountain("한라산", 1950);
		Mountain m2 = new Mountain("관악산", 1500);
		Mountain m3 = new Mountain("북한산", 1000);
		
		ArrayList<Mountain> item = new ArrayList<>();
		//           ↑ class면 되니까 개발자가 작성한 클래스도 들어갈 수 있다 = 이런 용도로 더 자주 쓰인다
		item.add(m1);
		item.add(m2);
		item.add(m3);
		// item.add(5);				    !error : 
		// item.add('m');               !error : 
		// item.add(new Integer(1));    !error : 
		// item.add("백두산");		    !error : Mountain 클래스에 들어있는 값이 아닌 다른 값은 오지 못한다
		
		System.out.println(item.size()); // 3
		
		for(int i=0; i<item.size(); i++) {
			Mountain m = item.get(i);
			System.out.println(m.name);
			System.out.println(m.height);
		}//for end
		// ↑ 모은 정보를 가져다가 다른곳에서 활용하려면 모았던 순서 반대로 하면 된다 
		// = 선물을 받아서 풀어보려면 포장 순서(박스에 물건담고 포장하고 리본달고)와 반대로 하는 것처럼 (리본풀고 포장지뜯고 박스열고)
		
		
		
		
		
	}//main() end
}//class end
