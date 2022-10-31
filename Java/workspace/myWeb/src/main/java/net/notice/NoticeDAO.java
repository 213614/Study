package net.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class NoticeDAO {

	private DBOpen dbopen 		    = null;
	private Connection con 			= null;
	private PreparedStatement pstmt = null;
	private ResultSet rs 			= null;
	private StringBuilder sql 		= null;
	
	//default constructor 
	public NoticeDAO() { dbopen = new DBOpen(); }
	
	public int create (NoticeDTO dto) {
		
		int cnt = 0;
		
		try {	
				// DB 연결 
				con = dbopen.getConnection();
			
				sql = new StringBuilder();
				//sql.append(" INSERT INTO notice (noticeno, subject, content, regdt) ");
				//sql.append(" VALUES (noticeno_seq.nextval, ?, ?, sysdate) ");
				
				//maria DB
				sql.append(" INSERT INTO notice(subject , content, regdt) ");
				sql.append(" VALUES ( ? , ? ,now()) ");
				
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, dto.getSubject());
				pstmt.setString(2, dto.getContent());

				cnt = pstmt.executeUpdate();
				
		}catch(Exception e) {
			System.out.println("작성 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt);
		}//try end

		return cnt;
	}//create() end
	
	
	public ArrayList<NoticeDTO> list(String col, String word, int nowPage, int recordPerPage){
		
		ArrayList<NoticeDTO> list = null;
		
		int startRow = ((nowPage-1) * recordPerPage) + 1 ;
        int endRow   = nowPage * recordPerPage;
        

		try {
				con = dbopen.getConnection();
				StringBuilder sql = new StringBuilder();
				
				word = word.trim(); 	// 검색어 좌우 공백 제거
			
				if(word.length()==0) {
				  // 검색어가 없을 경우 = 검색하지 않는 경우의 페이징 
				  sql.append(" SELECT *  ");
				  sql.append(" FROM (  ");
				  sql.append(" 				SELECT noticeno, subject, content, regdt, @ROWNUM := @ROWNUM + 1 as rowNum  ");
				  sql.append(" 		FROM ( ");
				  sql.append(" 				SELECT noticeno, subject, content, regdt ");
				  sql.append(" 				FROM notice, (SELECT @ROWNUM :=0) A ");
				  sql.append(" 				ORDER BY noticeno DESC ");
				  sql.append(" 		)AA ");
				  sql.append(" )BB ");
				  sql.append(" WHERE rowNum >="+ startRow +" AND rowNum <=" + endRow);

				}else {
				  // 검색하는 결과 페이징 	
				  sql.append(" SELECT * ");
				  sql.append(" FROM ( ");
				  sql.append(" 				SELECT noticeno, subject, content, regdt, @ROWNUM := @ROWNUM + 1 as rowNum ");
				  sql.append(" 		FROM ( ");
				  sql.append(" 				SELECT noticeno, subject, content, regdt ");
				  sql.append(" 				FROM notice, (SELECT @ROWNUM :=0) A ");
										    if(word.length()>=1) {
												  String search = "";
												  if (col.equals("subject_content")) {
													  search += " WHERE subject LIKE '%" + word + "%' ";
													  search += " OR content LIKE '%" + word + "%' ";
												  }else if(col.equals("subject")) {
													  	  search += " WHERE subject LIKE '%" + word + "%' ";	
												  }else if(col.equals("content")) {
													  	  search += " WHERE content LIKE '%" + word + "%' ";
												  }//if end  	  
												  sql.append(search);
											 }//if end
										    
				  sql.append(" 				ORDER BY noticeno DESC ");
				  sql.append(" 		)AA ");
				  sql.append(" )BB ");
				  sql.append(" WHERE rowNum >="+ startRow +" AND rowNum <=" + endRow);
								  
				}//if end

				pstmt = con.prepareStatement(sql.toString()); 
				
				rs = pstmt.executeQuery(); 		
				
				if (rs.next()) {

					list = new ArrayList<>();
					
					do {

							NoticeDTO dto = new NoticeDTO();
							dto.setNoticeno(rs.getInt("noticeno"));
							dto.setSubject (rs.getString("subject"));
							dto.setContent (rs.getString("content"));
							dto.setRegdt   (rs.getString("regdt"));

							list.add(dto);

					}while(rs.next()); 	
					
					} else { 
						list = null;
					}//if end

			}catch(Exception e) {
				System.out.println("목록 불러오기 실패 : " + e);
			}finally {
				DBClose.close(con, pstmt, rs);
			}//try end
		
		
		return list;
	}//list() end
	

	
	public int count (String col, String word) {	// 검색된 글 개수 함수 
		int cnt = 0;
		
		try {
				con = dbopen.getConnection();
				
				sql = new StringBuilder();
				sql.append(" SELECT COUNT(*) AS cnt ");
				sql.append(" FROM notice ");
				
				if(word.length()>=1) {
				//=검색어가 존재한다면 
					String search = "";
					if (col.equals("subject_content")) {
					//=검색 칼럼 : 제목+내용
						search += " WHERE subject LIKE '%" + word + "%' ";
						search += " OR content LIKE '%" + word + "%' ";
					}else if(col.equals("subject")) {
					      //=검색칼럼 : 제목
						search += " WHERE subject LIKE '%" + word + "%' ";	
					}else if(col.equals("content")) {
					      //=검색칼럼 : 내용
						search += " WHERE content LIKE '%" + word + "%' ";	
					}//if end
					
					sql.append(search);
				}//if end
								
				pstmt = con.prepareStatement(sql.toString());
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					cnt = rs.getInt("cnt");
				}//if end
				
		}catch(Exception e) {
			System.out.println("검색 실패 : " + e );
		}finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		
		return cnt;
	}//cnt() end
	
	public NoticeDTO read (int noticeno) {
		
		NoticeDTO dto = null;
		
		try {
				con = dbopen.getConnection();
				
			 	StringBuilder sql = new StringBuilder();
			 	sql.append(" SELECT noticeno, subject, content, regdt ");
			 	sql.append(" FROM notice ");
			 	sql.append(" WHERE noticeno = ? ");
			 	
			 	pstmt = con.prepareStatement(sql.toString());
			 	pstmt.setInt(1, noticeno);
				
			 	rs = pstmt.executeQuery();
			 	
			 	if(rs.next()) {
			 		dto = new NoticeDTO();
			 		
			 		dto.setNoticeno(rs.getInt("noticeno"));
			 		dto.setSubject (rs.getString("subject"));
			 		dto.setContent (rs.getString("content"));
			 		dto.setRegdt   (rs.getString("regdt"));
			 		
			 	} else { dto = null; }//if end
			 	
			 	
		} catch(Exception e) {
			System.out.println("상세보기 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		
		return dto;
	}//read() end
	
	
	public int updateProc(NoticeDTO dto) {
		int cnt = 0;
		
		try {
				con = dbopen.getConnection();
				
				sql = new StringBuilder();
				sql.append("   ");
				sql.append(" UPDATE notice   ");
				sql.append(" SET subject = ?  ");
				sql.append("    ,content = ?  ");
				sql.append(" WHERE noticeno = ?   ");
				
				pstmt = con.prepareStatement(sql.toString());
				
				pstmt.setString(1, dto.getSubject());
				pstmt.setString(2, dto.getContent());
				pstmt.setInt   (3, dto.getNoticeno());
				
				cnt = pstmt.executeUpdate();
				
		} catch(Exception e) {
			System.out.println("수정 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		}//try end
		
		return cnt;
	}//update()end
	
	
	public int delete (NoticeDTO dto) {
		int cnt = 0;
		
		try {
			
				con = dbopen.getConnection();
				
				sql = new StringBuilder();
				sql.append(" DELETE FROM notice ");
				sql.append(" WHERE noticeno = ? ");
				
				pstmt = con.prepareStatement(sql.toString());
			 
				pstmt.setInt(1, dto.getNoticeno());
		
				cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시글 삭제 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		return cnt;
	}//del() end
}//DAO end
