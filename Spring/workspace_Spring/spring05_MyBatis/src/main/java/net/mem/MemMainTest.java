package net.mem;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemMainTest {
	
	
	public static void main (String[] args) {
	
		// MyBatis Framework 기반 JDBC 연습 
		
		try {
				/*
					  ● Factory : 공장
					  → 어떤 특정 정보를 주면 객체로 생성해준다
					  → 객체 생성 : new 연산자 (POJO방식), Bean(useBean)
					  
					  ○ 실행 순서
					    ①. DB 연결을 위한 환경 설정 파일 가져오기 (JDBC.xml)
					    ②. DB 연결을 하기위해 팩토리빈(factory bean)으로 객체 생성하기
					    ③. 쿼리문 생성 및 변환
					    ④. 쿼리문 실행 (쿼리문이 작성된 파일을 연결하는 것)
					       ⑴. 행 추가
				*/
			
				// ①. DB 연결을 위한 환경 설정 파일 가져오기 (JDBC.xml)
				String resource = "config/JDBC.xml";
				InputStream is = Resources.getResourceAsStream(resource); 
					// → resource에 담아둔 xml파일을 파일로써 불러옴 (resource에는 그냥 경로만 저장된 문자열일뿐이다)
				
				// ②. DB 연결을 하기위해 팩토리빈(factory bean)으로 객체 생성하기
				//    = DBOpen + DAO 
				SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(is);
				System.out.println("------ DB 연결 성공");
				
				// ③. 쿼리문 생성 및 변환
				// → PreparedStatementr와 비슷한 기능
				SqlSession sql = ssf.openSession(true);
				
//----------------------------------------------------------------------------------------------------------
				
				// ④. 쿼리문 실행 (쿼리문이 작성된 파일을 연결하는 것)
				//    ⑴. 행 추가
				//                          ↓ namespace="mem"이라는 Mapper에 id="insertRow"라는 쿼리문에 해당 값을 넣어주라
				//int result = sql.insert("mem.insertRow", new MemDTO("김연아", 26));
				//System.out.println("행 추가 결과 : " + result);
				
				/*
				//    ⑵. 전체 목록
				List<MemDTO> list = sql.selectList("mem.selectAll");
				for (int i = 0; i<list.size(); i++) {
					MemDTO dto = list.get(i);
					
					System.out.print(dto.getNum()  + " ");
					System.out.print(dto.getName() + " ");
					System.out.print(dto.getAge()  + " ");
					System.out.println();
				}// for end
				*/
				
				//    ⑶. 행 수정
				//    → WHERE num = 6 행의 이름, 나이 수정
				//                        ↓ namespace="mem"이라는 Mapper안에 id="updateRow"라는 쿼리문에 해당 값을 넣어주라
				//int result = sql.update("mem.updateRow", new MemDTO(6, "진달래", 10));
				//System.out.println("행 수정 결과 : " + result);
				
				//    ⑷. 행 삭제 
				//    → WHERE age >= 30 행 삭제 
				//int result = sql.delete("mem.deleteRow", 30);
				//System.out.println("행 삭제 결과 : " + result);
				
				//    ⑸. 검색 목록
				//    → WHERE name like '%화%' 행 검색
				List<MemDTO> list = sql.selectList("mem.search","화");
				for (int i = 0; i<list.size(); i++) {
					MemDTO dto = list.get(i);
					
					System.out.print(dto.getNum()  + " ");
					System.out.print(dto.getName() + " ");
					System.out.print(dto.getAge()  + " ");
					System.out.println();
				}// for end
				
				//    ⑹. 상세보기
				//    → WHERE num = 3 행 상세보기
				MemDTO dto = sql.selectOne("mem.selectRead", 5);
				
				System.out.print(dto.getNum()  + " ");
				System.out.print(dto.getName() + " ");
				System.out.print(dto.getAge()  + " ");
				System.out.println();
				
				// 전체 행 개수 
				System.out.println("전체 행 개수 : " + sql.selectOne("mem.rowCount"));
				
				
				
				
		} catch (Exception e) {
			System.out.println("실패 : " + e);
		}
		
		
	}

}// main() end
