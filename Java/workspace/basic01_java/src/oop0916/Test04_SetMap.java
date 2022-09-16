package oop0916;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

public class Test04_SetMap {

	public static void main(String[] args) {
		// 2. Set 계열
		
		Set set = new HashSet();
		set.add(3);
		set.add(2.4);
		set.add('R');
		set.add("Busan");
		set.add(new Integer(7));
		
		System.out.println(set.size());
		
		// index값이 살아있는건 그냥 get으로 순서값을 넣어서 호출할 수 있다 (list,배열)
		// 하지만 Set계열은 순서값이 없기때문에 커서 cursor가 (pointer in C) 특정 요소를(3, 2.4, 'R' 등) 가리키고 있어야한다
		// 커서는 그 다음 요소를 가르킬 수 있다 = for문으로 가능 = 다음 요소 - 다음 요소 - 요소가없을때까지 
		// if - 커서가 있어?(=요소가 있어?) {}
		// index값이 있어도 cursor를 사용할 수 있다
		
		// cursor : 가리킬 특정 요소가 있으면 true | 없으면 false로 반환 
		// cursor을 이용하여 요소를 접근하는 경우
		// 1. 커서를 만든다 (.iterator();가 커서를 만드는 함수)
		Iterator iter = set.iterator();
		while (iter.hasNext()) {
			 //= 다음 커서가 존재하나요 (= 다음 요소가 존재하나요)
			 
			 // 현재 시점에서 커서(iter)가 가리키는 요소 가져오기
			 Object obj = iter.next();
			 System.out.println(obj);
			 // add한 순서대로 나오지 않는다 (순서가 없으니까)
			 
		}//while end
		
//---------------------------------------------------------------------------------------------------
		
		// 3. Map 계열 : 순서가 없다 → key(이름표) value(값)
		// JSON → {key:value, key:value} | 딕셔너리(python) | NoSQL 등에서 많이 사용하는 문법
		// 변수명.put("key", value); → .add가 아닌 *.put*임 주의
		
		// 3-1. Hashmap
		HashMap map = new HashMap();
		
		map.put("one", 3);
		map.put("two", 2.4);
		map.put("three", 'R');
		map.put("four", "손흥민");
		map.put(5, "five");
		map.put('A', 7);
		map.put("한글", 'K');
		
		System.out.println(map.size());
		System.out.println(map.get("four"));	// "손흥민"
		System.out.println(map.get(5));			// "five"
		System.out.println(map.get('A'));		// 7
		System.out.println(map.get("한글"));		// 'K'
		
		map.put("four", "김연아");
		System.out.println(map.get("four"));	// "김연아"
		// → 새롭게 지정된 값으로 바뀐다
		
		// 3-2. Properties class → 환경 구축 시 많이 사용됨 
		// 생긴건 hashmap과 동일, email 데이터를 Properties 많이 받음
		Properties db = new Properties();
		db.put("url", "http://localhost:1521");
		db.put("username", "itwill");
		db.put("password", "12341234");
		
		System.out.println(db.get("url"));
		System.out.println(db.get("username"));
		System.out.println(db.get("password"));
		
//-----------------------------------------------------------------------------------------------
		
		// Q. = 을 기준으로 왼쪽은 key, 오른쪽은 value로 분리해서 hm에 새로 저장하라 
		//    map의 key값들 중에서 "read.do"를 호출해서 net.bbs.Read라는 값 출력하기
		HashSet command=new HashSet();
        command.add("list.do=net.bbs.List");
        command.add("read.do=net.bbs.Read");
        command.add("write.do=net.bbs.Write");
		
		System.out.println(command.size());  //3
		
		HashMap hm = new HashMap();
		
		// = 을 기준으로 문자를 잘라서 앞은 hm.put(i, j)이런식으로 반복문?
		
		/*
		String a = command.toString();

		String [] b = a.split("=");
		String c = b.toString();
		String[] d = c.split(",");
		
		System.out.println(d);
		*/
	
		
		Iterator cs = command.iterator();
		
		while(cs.hasNext()) {
			 Object ob = cs.next();
			 	//System.out.println("--"+ob);
			 String a = ob.toString();
			 	//System.out.println(a);
			 String[] b = a.split("=");
			 //for(int i=0; i<b.length; i++) {System.out.println("-"+b[i]);}
	
			 String key = b[0];
			 String value = b[1];
			 //System.out.println("--"+key);
			 //System.out.println("---"+value);
			 
			 hm.put(key, value);
			 
		}//while end
	
		
		/*
		// 강사님
		// 1. 커서 생성
		Iterator cur = command.iterator();
		
		// 2. 커서가있을때까지 반복
		while(cur.hasNext()) {
			// 3. 커서가 가리키는 요소를 가져와서 문자열로 형변환
			Object o = cur.next();
			String line = (String) o;	// 다형성
			
			// 4. "="를 기준으로 문자열 분리하기
			// → split(),substring(),StringTokenizer class
			String[] word = line.split("=");
			String key   = word[0]; 	// = 앞 문자열	
			String value = word[1];		// = 뒤 문자열
			//System.out.println(key);
			//System.out.println(value);
			
			// 5. hm에 저장
			hm.put(key, value);
		}
		*/
		System.out.println(hm.get("read.do"));
	
		
	}//main() end
}//class end
