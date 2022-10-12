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
				sql.append(" INSERT INTO tb_bbs (bbsno, wname, subject, content, passwd, ip, grpno) ");
				sql.append(" VALUES (bbs_seq.nextval, ?, ?, ?, ?, ?, (SELECT nvl(max(bbsno),0)+1 FROM tb_bbs)) ");
				
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, dto.getWname());
				pstmt.setString(2, dto.getSubject());
				pstmt.setString(3, dto.getContent());
				pstmt.setString(4, dto.getPasswd());
				pstmt.setString(5, dto.getIp());
				
				cnt = pstmt.executeUpdate();
				
		}catch(Exception e) {
			System.out.println("추가 실패 : " + e);
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
			 		
			 		dto.setBbsno(rs.getInt("bbsno"));
			 		dto.setWname(rs.getString("wname"));
			 		dto.setSubject(rs.getString("subject"));
			 		dto.setContent(rs.getString("content"));
			 		dto.setPasswd(rs.getString("passwd"));
			 		dto.setReadcnt(rs.getInt("readcnt"));
			 		dto.setRegdt(rs.getString("regdt"));
			 		dto.setGrpno(rs.getInt("grpno"));
			 		dto.setIndent(rs.getInt("indent"));
			 		dto.setAnsnum(rs.getInt("ansnum"));
			 		dto.setIp(rs.getString("ip"));
			 		
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
				sql.append(" WHERE bbsno = ? AND passwd = ? ");

				pstmt = con.prepareStatement(sql.toString());
				
				pstmt.setString(1, dto.getWname());
				pstmt.setString(2, dto.getSubject());
				pstmt.setString(3, dto.getContent());
				pstmt.setInt   (4, dto.getBbsno());
				pstmt.setString(5, dto.getPasswd());
				
				cnt = pstmt.executeUpdate();
				
		}catch(Exception e) {
			System.out.println("수정 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt);
		}
		
		return cnt;
	}//upproc()end
	
}//class end
