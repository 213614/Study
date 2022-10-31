package net.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class BbsDAO {

	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;
	private BbsDTO dto;
	
	public BbsDAO() {
		dbopen = new DBOpen();
	}
	 
	public int create (BbsDTO dto) {
		
		int cnt = 0;
		
		try {	
				// DB 연결 
				con = dbopen.getConnection();
			
				sql = new StringBuilder();
				// mariaDB
				sql.append(" INSERT INTO tb_bbs(wname,subject,content,grpno,passwd,ip,regdt)");
			    sql.append(" VALUES(?, ?, ?, (SELECT ifnull(max(bbsno),0)+1 FROM tb_bbs as TB),?,?,now())");
			      
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, dto.getWname());
				pstmt.setString(2, dto.getSubject());
				pstmt.setString(3, dto.getContent());
				pstmt.setString(4, dto.getPasswd());
				pstmt.setString(5, dto.getIp());
				
				cnt = pstmt.executeUpdate();
				
		}catch(Exception e) {
			System.out.println("작성 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt);
		}//try end

		return cnt;
	}//create() end
	
	
	public ArrayList<BbsDTO> list() {
		
		// DB에서 가져온 데이터(rs)를 한번에 모아서(ArrayList)
		ArrayList<BbsDTO> list = null;
	
		try {
				con = dbopen.getConnection();
				
				StringBuilder sql = new StringBuilder();
				sql.append(" SELECT bbsno, wname, subject, readcnt, regdt, indent ");
				sql.append(" FROM tb_bbs ");
				sql.append(" ORDER BY grpno DESC, ansnum ASC ");
				
				pstmt = con.prepareStatement(sql.toString()); 
				
				rs = pstmt.executeQuery(); 		
				
				if (rs.next()) {
					// 커서가 존재한다 = 자료가 존재한다 
					// 전체 행을 저장할 수 있는 list(위에서만든ArrayList)를 객체 선언해줌(메모리할당해줌)
					list = new ArrayList<>();
					
					do {
							// 커서가 가리키는 한 행(줄) = 한 사람의 모든 정보를 저장한다 
							BbsDTO dto = new BbsDTO();
							dto.setBbsno(rs.getInt("bbsno"));
							dto.setWname(rs.getString("wname"));
							dto.setSubject(rs.getString("subject"));
							dto.setReadcnt(rs.getInt("readcnt"));
							dto.setRegdt(rs.getString("regdt"));
							dto.setIndent(rs.getInt("indent"));
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
	
	
   public int count() {
	     
	   	int cnt=0;
	      
	   	try {
	         con = dbopen.getConnection();
	         
	         sql=new StringBuilder();
	        
	         sql.append(" SELECT COUNT(*) as cnt ");
	         sql.append(" FROM tb_bbs ");
	         
	         pstmt=con.prepareStatement(sql.toString());                        
	         
	         rs=pstmt.executeQuery();
	         
	         if(rs.next()) {
	            cnt=rs.getInt("cnt");
	         }//if end
	         
	      } catch (Exception e) {
	         System.out.println("전체목록실패:" + e);
	      }finally {
	         DBClose.close(con, pstmt, rs);
	      }//end
	      return cnt;
	   }//count() end

   
	public BbsDTO read(int bbsno) {
		
		BbsDTO dto = null;
		
		try {
			 	con = dbopen.getConnection();
			
			 	StringBuilder sql = new StringBuilder();
			 	
			 	sql.append(" SELECT bbsno, wname, subject, content, passwd, readcnt, regdt, grpno, indent, ansnum, ip ");
			 	sql.append(" FROM tb_bbs ");
			 	sql.append(" WHERE bbsno = ? ");
			
			 	pstmt = con.prepareStatement(sql.toString());
			 	pstmt.setInt(1, bbsno);
			 	
			 	rs = pstmt.executeQuery();
			 	
			 	if(rs.next()) {
			 		
			 		dto = new BbsDTO();
			 		
			 		dto.setBbsno  (rs.getInt("bbsno"));
			 		dto.setWname  (rs.getString("wname"));
			 		dto.setSubject(rs.getString("subject"));
			 		dto.setContent(rs.getString("content"));
			 		dto.setPasswd (rs.getString("passwd"));
			 		dto.setReadcnt(rs.getInt("readcnt"));
			 		dto.setRegdt  (rs.getString("regdt"));
			 		dto.setGrpno  (rs.getInt("grpno"));
			 		dto.setIndent (rs.getInt("indent"));
			 		dto.setAnsnum (rs.getInt("ansnum"));
			 		dto.setIp     (rs.getString("ip"));
			 		
			 	}else { dto = null; }//if end
	
		}catch(Exception e) {
			System.out.println("상세보기 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		
		return dto; 
	}//read() end
	
	
	public void incrementCnt(int bbsno) {
		
		
		try {
				con = dbopen.getConnection();
			
				StringBuilder sql = new StringBuilder();
				
				sql.append(" UPDATE tb_bbs ");
				sql.append(" SET readcnt = readcnt+1 ");
				sql.append(" WHERE bbsno = ? ");
				
			 	pstmt = con.prepareStatement(sql.toString());
			 	pstmt.setInt(1, bbsno);
			 	pstmt.executeUpdate();
				
		}catch(Exception e) {
			System.out.println("조회수 증가 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt);
		}
		
	}//inc() end

	
	public int delete(BbsDTO dto) {
		int cnt = 0;
		
		try {
				con = dbopen.getConnection();
			
				sql = new StringBuilder();
				sql.append(" DELETE FROM tb_bbs ");
				sql.append(" WHERE bbsno = ? AND passwd = ? ");
				
				pstmt = con.prepareStatement(sql.toString());
			 
				pstmt.setInt(1, dto.getBbsno());
				pstmt.setString(2, dto.getPasswd());
			
				cnt = pstmt.executeUpdate();
				
		}catch(Exception e) {
			System.out.println("게시글 삭제 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return cnt;
	}//del() end
	
	
	public int updateproc(BbsDTO dto) {
		
		int cnt = 0;
		
		try {
				con = dbopen.getConnection();
				
				sql = new StringBuilder();
				
				sql.append(" UPDATE tb_bbs ");
				sql.append(" SET wname = ? ");
				sql.append("    ,subject = ? ");
				sql.append("    ,content = ? ");
				sql.append("    ,ip = ? ");
				sql.append(" WHERE bbsno = ? AND passwd = ? ");

				pstmt = con.prepareStatement(sql.toString());
				
				pstmt.setString(1, dto.getWname());
				pstmt.setString(2, dto.getSubject());
				pstmt.setString(3, dto.getContent());
				pstmt.setString(4, dto.getIp());
				pstmt.setInt   (5, dto.getBbsno());
				pstmt.setString(6, dto.getPasswd());
				
				cnt = pstmt.executeUpdate();
				
		}catch(Exception e) {
			System.out.println("수정 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt);
		}
		
		return cnt;
	}//upproc()end
	
	
	public int reply (BbsDTO dto) {
		
		int cnt = 0;
		
		try {
				con = dbopen.getConnection();
				
				sql = new StringBuilder();
				
				// ①. 부모글 정보 가져오기(select문)
				// → 부모글 그룹번호 / 부모글 들여쓰기 / 부모글 댓글순서
				int grpno  = 0;
				int indent = 0;
				int ansnum = 0;
				// 일단 자식의 그룹번호/들여쓰기/댓글순서의 값을 담을 변수 생성 
				
				sql.append(" SELECT grpno, indent, ansnum ");
				sql.append(" FROM tb_bbs ");
				sql.append(" WHERE bbsno = ? ");
			
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(1, dto.getBbsno());
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					// 부모글이 있다면 
					// 그룹번호 : 부모글 그룹번호 그대로 가져오기
					grpno = rs.getInt("grpno");
					// 들여쓰기 : 부모글 들여쓰기 +1
					indent = rs.getInt("indent")+1;
					// 댓글순서 : 부모글 댓글순서 +1
					ansnum = rs.getInt("ansnum")+1;
				}//if end
				
				// ※ 2단계 sql.append를 위해 위에 사용된건 지워야한다 (안그러면 오류남)
				sql.delete(0, sql.length()); 	// 0번째부터 마지막글자까지 지우기(1단계때 작성한 sql문 삭제)
				
				// ②. 글 순서 재조정 (update문)
				sql.append(" UPDATE tb_bbs ");
				sql.append(" SET ansnum = ansnum+1 ");
				sql.append(" WHERE grpno = ? AND ansnum >= ? ");
				
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(1, grpno);
				pstmt.setInt(2, ansnum);
				
				pstmt.executeUpdate();
				
				// ※ 3단계 sql.append를 위해 위에 사용된건 지워야한다 (안그러면 오류남)
				sql.delete(0, sql.length()); 	// 0번째부터 마지막글자까지 지우기(2단계때 작성한 sql문 삭제)
				
				// ③. 답변 글 추가 (insert문)
				//sql.append(" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno, indent, ansnum) ");
				//sql.append(" VALUES (bbs_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ? ) ");
				
				//mariaDB
				sql.append(" INSERT INTO tb_bbs(wname, subject, content, passwd, ip, grpno, indent, ansnum, regdt)");
			    sql.append(" VALUES(?,?,?,?,?,?,?,?,now())");
				
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, dto.getWname());
				pstmt.setString(2, dto.getSubject());
				pstmt.setString(3, dto.getContent());
				pstmt.setString(4, dto.getPasswd());
				pstmt.setString(5, dto.getIp());
				// ↓ ① ~ ③ 에서 만든 변수를 ?에 넣는다 (※dto.get~안됨!) 
				pstmt.setInt(6, grpno);		
				pstmt.setInt(7, indent);
				pstmt.setInt(8, ansnum);
				
				cnt = pstmt.executeUpdate();

		}catch(Exception e) {
			System.out.println("답변 작성 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return cnt; 
	}//reply() end

	
	public int count2 (String col, String word) {	// 검색된 글 개수 함수 
		int cnt = 0;
		
		try {
				con = dbopen.getConnection();
				
				sql = new StringBuilder();
				sql.append(" SELECT COUNT(*) AS cnt ");
				sql.append(" FROM tb_bbs ");
				
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
					}else if(col.equals("wname")) {
					      //=검색칼럼 : 작성자
						search += " WHERE wname LIKE '%" + word + "%' ";	
					}//if end
					
					sql.append(search);
				}//if end
				
				//※ LIKE 연산자 사용시 '%검색어%' 안에 공백문자( )들어가지 않도록 조심! = 공백문자까지 포함해서 찾게됨 
				
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
	}//cnt2() end
	
	
	public ArrayList<BbsDTO> list2(String col, String word) {	// 검색된 결과 게시글들 list

		ArrayList<BbsDTO> list = null;
	
		try {
				con = dbopen.getConnection();
				
				StringBuilder sql = new StringBuilder();
				sql.append(" SELECT bbsno, wname, subject, readcnt, regdt, indent ");
				sql.append(" FROM tb_bbs ");
				
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
						}else if(col.equals("wname")) {
						      //=검색칼럼 : 작성자
							search += " WHERE wname LIKE '%" + word + "%' ";	
						}//if end
						
						sql.append(search);
					}//if end
				
				sql.append(" ORDER BY grpno DESC, ansnum ASC ");
				
				pstmt = con.prepareStatement(sql.toString()); 
				
				rs = pstmt.executeQuery(); 		
				
				if (rs.next()) {
					// 커서가 존재한다 = 자료가 존재한다 
					// 전체 행을 저장할 수 있는 list(위에서만든ArrayList)를 객체 선언해줌(메모리할당해줌)
					list = new ArrayList<>();
					
					do {
							// 커서가 가리키는 한 행(줄) = 한 사람의 모든 정보를 저장한다 
							BbsDTO dto = new BbsDTO();
							dto.setBbsno(rs.getInt("bbsno"));
							dto.setWname(rs.getString("wname"));
							dto.setSubject(rs.getString("subject"));
							dto.setReadcnt(rs.getInt("readcnt"));
							dto.setRegdt(rs.getString("regdt"));
							dto.setIndent(rs.getInt("indent"));
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
	}//list2() end
	
	
	public ArrayList<BbsDTO> list3(String col, String word, int nowPage, int recordPerPage) {	
		// 페이징 함수 
		ArrayList<BbsDTO> list = null;

		// 페이지 당 출력할 글(행)의 개수 (10개를 기준)
		// 1page : WHERE r>= 1  AND r<=10;
		// 2page : WHERE r>= 11 AND r<=20;
		// 3page : WHERE r>= 21 AND r<=30;
		
		int startRow = ((nowPage-1) * recordPerPage) + 1 ;
        int endRow   = nowPage * recordPerPage;
        
		/*
			int startRow = 6;
			int endRow = 10;
		*/

		try {
				con = dbopen.getConnection();
				StringBuilder sql = new StringBuilder();
				
				word = word.trim(); 	// 검색어 좌우 공백 제거
			
				if(word.length()==0) {
				  // 검색어가 없을 경우 = 검색하지 않는 경우의 페이징 
				  sql.append(" SELECT *  ");
				  sql.append(" FROM (  ");
				  //sql.append(" 				SELECT bbsno, subject, wname, readcnt, indent, regdt, rownum AS r  ");
				  sql.append(" 		SELECT bbsno, grpno, subject, wname, readcnt, indent, regdt, @ROWNUM := @ROWNUM + 1 as rowNum  ");
				  sql.append(" 		FROM ( ");
				  sql.append(" 				SELECT bbsno, grpno, subject, wname, readcnt, indent, regdt ");
				  sql.append(" 				FROM tb_bbs, (SELECT @ROWNUM :=0) A ");
				  sql.append(" 				ORDER BY grpno DESC, ansnum ASC ");
				  //sql.append(" 		) ");
				  //sql.append(" ) ");
				  sql.append(" 		)AA ");
				  sql.append(" )BB ");
				  //sql.append(" WHERE r >="+ startRow +" AND r <=" + endRow);
				  sql.append(" WHERE rowNum >="+ startRow +" AND rowNum <=" + endRow );

				}else {
				  // 검색하는 결과 페이징 	
				  sql.append(" SELECT * ");
				  sql.append(" FROM ( ");
				  //sql.append(" 				SELECT bbsno, subject, wname, readcnt, indent, regdt, rownum AS r ");
				  sql.append(" 		SELECT bbsno, grpno, subject, wname, readcnt, indent, regdt, @ROWNUM := @ROWNUM + 1 as rowNum  ");
				  sql.append(" 		FROM ( ");
				  sql.append(" 				SELECT bbsno, grpno, subject, wname, readcnt, indent, regdt ");
				  sql.append(" 				FROM tb_bbs, (SELECT @ROWNUM :=0) A ");
				  
				  //sql.append(" 				WHERE ? LIKE '%?%' ");
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
												  }else if(col.equals("wname")) {
												          //=검색칼럼 : 작성자
													  	  search += " WHERE wname LIKE '%" + word + "%' ";	
												  }//if end
												
												  sql.append(search);
											 }//if end
										    
				  sql.append(" 				ORDER BY grpno DESC, ansnum ASC ");
				  //sql.append(" 		) ");
				  //sql.append(" ) ");
				  sql.append(" 		)AA ");
				  sql.append(" )BB ");
				  //sql.append(" WHERE r >="+ startRow +" AND r <=" + endRow);
				  sql.append(" WHERE rowNum >="+ startRow +" AND rowNum <=" + endRow );
				  
				}//if end

				pstmt = con.prepareStatement(sql.toString()); 
				
				rs = pstmt.executeQuery(); 		
				
				if (rs.next()) {
					// 커서가 존재한다 = 자료가 존재한다 
					// 전체 행을 저장할 수 있는 list(위에서만든ArrayList)를 객체 선언해줌(메모리할당해줌)
					list = new ArrayList<>();
					
					do {
							// 커서가 가리키는 한 행(줄) = 한 사람의 모든 정보를 저장한다 
							BbsDTO dto = new BbsDTO();
							dto.setBbsno(rs.getInt("bbsno"));
							dto.setWname(rs.getString("wname"));
							dto.setSubject(rs.getString("subject"));
							dto.setReadcnt(rs.getInt("readcnt"));
							dto.setRegdt(rs.getString("regdt"));
							dto.setIndent(rs.getInt("indent"));
							dto.setGrpno(rs.getInt("grpno"));
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
	}//list3() end

	
   public int replycnt(int grpno) {
	     
	   	int replycnt = 0;
	      
	   	try {
	         con = dbopen.getConnection();
	         
	         sql=new StringBuilder();
	        
	         sql.append(" SELECT reply ");
	         sql.append(" FROM ( ");
	         sql.append("     SELECT BB.subject, AA.reply , BB.grpno ");
	         sql.append("     FROM ( ");
	         sql.append("         SELECT grpno, count(*)-1 AS reply ");
	         sql.append("         FROM tb_bbs ");
	         sql.append("         GROUP BY grpno ");
	         sql.append("     )AA JOIN tb_bbs BB ");
	         sql.append("         ON AA.grpno = BB.grpno ");
	         sql.append("     WHERE BB.indent = 0 ");
	         sql.append("     ORDER BY BB.grpno DESC ");
	         sql.append(" )CC ");
	         sql.append(" WHERE grpno = ? ");

			 pstmt = con.prepareStatement(sql.toString());
			 pstmt.setInt(1, grpno);
			 
		     rs = pstmt.executeQuery();
		         
		     if(rs.next()) {
		    	 replycnt = rs.getInt("reply");
		     }//if end
	         
	      } catch (Exception e) {
	         System.out.println("댓글 조회 실패 :" + e);
	      }finally {
	         DBClose.close(con, pstmt, rs);
	      }//end
	   	
	      return replycnt;
	   }//replycnt() end
	
	
	
	
}//class end
