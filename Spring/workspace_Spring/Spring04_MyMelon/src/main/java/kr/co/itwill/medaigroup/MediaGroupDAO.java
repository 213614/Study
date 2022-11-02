package kr.co.itwill.medaigroup;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

// ● DAO 객체 생성하는 어노테이션들
//   ○ @Service    : DB에 접근하는 모든 코드  
//   ○ @Repository : DB - CRUD에 관련된 코드(DAO), 모델 클래스로 지정. 스프링 컨테이너가 자동으로 객체 생성해준다 
@Repository	
public class MediaGroupDAO {
	
	// ↓ 이미 생성된 객체를 끌어와서 사용하기 위해 필요한 어노테이션
	@Autowired 
	private JdbcTemplate jt; 	// application.properties에 적어둔 JDBC(오라클DB 아이디,비밀번호 등)을 관리해주는 클래스 
								// = DBOpen dbopen = new DBOpen; (IN Eclipse)
	
	StringBuilder sql = null;
	
	
	public MediaGroupDAO() {
		System.out.println("--------MediaGroupDAO() 객체 생성");
	}// default constructor
	
	
	// 비지니스 로직 구현
	public int create(MediaGroupDTO dto) {
		int cnt = 0;
		
		try {
				sql = new StringBuilder();
				sql.append(" INSERT INTO mediagroup (mediagroupno,title) ");
				sql.append(" VALUES (mediagroup_seq.nextval, ?) ");
				
				cnt = jt.update(sql.toString(), dto.getTitle());
				
		} catch(Exception e) {
			System.out.println("등록 실패 : " + e);
		}//try end
		
		return cnt;
	}//cre() end
	
	/*
	public List<MediaGroupDTO> list() {
		
		List<MediaGroupDTO> list = null;
		
		try {
				sql = new StringBuilder();
				
				sql.append(" SELECT mediagroupno, title ");
				sql.append(" FROM mediagroup ");
				sql.append(" ORDER BY mediagroupno DESC ");
				
				// oop0915_Test08_Anonymous 참조
				RowMapper<MediaGroupDTO> rowMapper = new RowMapper<MediaGroupDTO>() {
					
					@Override
					public MediaGroupDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
						MediaGroupDTO dto = new MediaGroupDTO();
						
						dto.setMediagroupno(rs.getInt("mediagroupno"));
						dto.setTitle(rs.getString("title"));
						
						return dto;
					}//mapRow() end
				};//rowMapper end
				
				list = jt.query(sql.toString(), rowMapper);
				
		} catch(Exception e) {
			System.out.println("목록 불러오기 실패 : " + e);
		}//try end
		
		return list;
	}//li() end
	*/
	
	
	// 페이징 가능한 list() 
	public List<MediaGroupDTO> list(int start, int end) {
			
			List<MediaGroupDTO> list = null;
			
			try {
					sql = new StringBuilder();
					
					sql.append("  ");
					sql.append(" SELECT AA.* ");
					sql.append(" FROM ( ");
					sql.append(" 		SELECT ROWNUM as rnum, BB.* ");
					sql.append(" 		FROM ( ");
					sql.append(" 				SELECT mediagroupno, title ");
					sql.append(" 				FROM mediagroup ");
					sql.append(" 				ORDER BY mediagroupno DESC ");
					sql.append(" 			  )BB ");
					sql.append(" 	   )AA ");
					sql.append(" WHERE AA.rnum >= " + start + " AND AA.rnum <= " + end);
					
					RowMapper<MediaGroupDTO> rowMapper = new RowMapper<MediaGroupDTO>() {
						
						@Override
						public MediaGroupDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
							
							MediaGroupDTO dto = new MediaGroupDTO();
							
							dto.setMediagroupno(rs.getInt("mediagroupno"));
							dto.setTitle(rs.getString("title"));
							
							return dto;
						}//mapRow() end
					};//rowMapper end
					
					list = jt.query(sql.toString(), rowMapper);
					
			} catch(Exception e) {
				System.out.println("목록 불러오기 실패 : " + e);
			}//try end
			
			return list;
		}//li() end
	
	
	
	
	
	public int totalRowCount() {
		
		int cnt = 0;
		
		try {
				sql = new StringBuilder();
				sql.append(" SELECT COUNT(*) FROM mediagroup ");
				
				cnt = jt.queryForObject(sql.toString(), Integer.class);
													  // 리턴 자료형 
				
		} catch(Exception e) {
			System.out.println("행 갯수 불러오기 실패 : " + e);
		} //try end
		
		return cnt;
	}//totalcnt() end
	
}//DAO end
