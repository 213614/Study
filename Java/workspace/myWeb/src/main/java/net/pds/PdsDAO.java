package net.pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;
import net.utility.Utility;

public class PdsDAO {

	private DBOpen dbopen 		    = null;
	private Connection con 			= null;
	private PreparedStatement pstmt = null;
	private ResultSet rs 			= null;
	private StringBuilder sql 		= null;
	
	public PdsDAO() {
		dbopen = new DBOpen();
	}//default constructor 

	public int create (PdsDTO dto) {
		
		int cnt = 0;
		
		try {	
				con = dbopen.getConnection();
			
				sql = new StringBuilder();
				sql.append(" INSERT INTO tb_pds(pdsno,wname,subject,passwd,filename,filesize,regdate) ");
				sql.append(" VALUES (pds_seq.nextval, ?, ?, ?, ?, ?, sysdate) ");
								
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, dto.getWname());
				pstmt.setString(2, dto.getSubject());
				pstmt.setString(3, dto.getPasswd());
				pstmt.setString(4, dto.getFilename());
				pstmt.setLong  (5, dto.getFilesize());
				
				cnt = pstmt.executeUpdate();
				
		}catch(Exception e) {
			System.out.println("작성 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt);
		}//try end

		return cnt;
	}//create() end
	

	
	public ArrayList<PdsDTO> list() {
		
		ArrayList<PdsDTO> list = null;
	
		try {
				con = dbopen.getConnection();
				
				StringBuilder sql = new StringBuilder();
				sql.append(" SELECT pdsno, wname, subject, filename, readcnt, regdate ");
				sql.append(" FROM tb_pds ");
				sql.append(" ORDER BY regdate DESC ");
				
				pstmt = con.prepareStatement(sql.toString()); 
				
				rs = pstmt.executeQuery(); 		
				
				if (rs.next()) {
					list = new ArrayList<>();
					
					do {
							PdsDTO dto = new PdsDTO();
							dto.setPdsno   (rs.getInt("pdsno"));
							dto.setWname   (rs.getString("wname"));
							dto.setSubject (rs.getString("subject"));
							dto.setFilename(rs.getString("filename"));
							dto.setReadcnt (rs.getInt("readcnt"));
							dto.setRegdate (rs.getString("regdate"));
					
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
	
	
	public PdsDTO read(int pdsno) {
		
		PdsDTO dto = null;
		
		try {
			 	con = dbopen.getConnection();
			
			 	StringBuilder sql = new StringBuilder();
			 	
			 	sql.append(" SELECT pdsno, wname, subject, regdate, passwd, readcnt, filename, filesize ");
			 	sql.append(" FROM tb_pds");
			 	sql.append(" WHERE pdsno = ? ");
			
			 	pstmt = con.prepareStatement(sql.toString());
			 	pstmt.setInt(1, pdsno);
			 	
			 	rs = pstmt.executeQuery();
			 	
			 	if(rs.next()) {
			 		
			 		dto = new PdsDTO();
			 	
			 		dto.setPdsno(rs.getInt("pdsno"));
			 		dto.setWname(rs.getString("wname"));
			 		dto.setSubject(rs.getString("subject"));
			 		dto.setRegdate(rs.getString("regdate"));
			 		dto.setPasswd(rs.getString("passwd"));
			 		dto.setReadcnt(rs.getInt("readcnt"));
			 		dto.setFilename(rs.getString("filename"));
			 		dto.setFilesize(rs.getLong("filesize"));

			 		
			 	}else { dto = null; }//if end
	
		}catch(Exception e) {
			System.out.println("상세보기 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		
		return dto; 
	}//read() end
	

	public void incrementCnt(int pdsno) {
		
		try {
				con = dbopen.getConnection();
			
				StringBuilder sql = new StringBuilder();
				
				sql.append(" UPDATE tb_pds ");
				sql.append(" SET readcnt = readcnt+1 ");
				sql.append(" WHERE pdsno = ? ");
				
			 	pstmt = con.prepareStatement(sql.toString());
			 	pstmt.setInt(1, pdsno);
			 	pstmt.executeUpdate();
				
		}catch(Exception e) {
			System.out.println("조회수 증가 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt);
		}
		
	}//inc() end

	
	public int delete(int pdsno, String passwd, String saveDir ) {
					// DB에 저장된 파일 정보뿐만아니라 storage폴더에 저장된 실제 파일까지 삭제해야함
					// → oop0919_Test05_File.java 참조 : file변수에 담아서 file.delete();
					// 우린 Utility.deleteFile(해당 파일이 있는 폴더명, 해당 파일명) 사용 
		int cnt = 0;
		
		try {
				
				// ①. 삭제하고자 하는 파일명을 가져온다 (DB에 저장되어있음)
				//    → 테이블 delete 하기전에 가져와야함
				String filename = "";		//파일명 저장 변수
				PdsDTO oldDto = read(pdsno);
				if(oldDto != null) {
					filename = oldDto.getFilename(); 
				}//if end
			
				con = dbopen.getConnection();
				// 위에 read함수에도 db연결이 있기때문에 이게 read보다 위에 있으면 오류가 난다 
				
				// ②. 테이블에 행 삭제 후 실제 파일경로에서 파일 지우기 
				StringBuilder sql = new StringBuilder();		
				sql.append(" DELETE FROM tb_pds ");
				sql.append(" WHERE pdsno = ? AND passwd = ? ");	
			
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(1, pdsno); 
				pstmt.setString(2, passwd);
				
				cnt = pstmt.executeUpdate();
				if(cnt == 1) {
				// cnt=1 → 테이블에서 행 삭제 성공 → 그러므로 storage에서 실제 파일도 삭제
					Utility.deleteFile(saveDir, filename);
				}//if end
				
				
		} catch(Exception e) {
			System.out.println("삭제 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		}//try end
		
		return cnt;
	}//del() end
	
	public int UpdateProc(PdsDTO dto) {
		int cnt = 0;
		
		try {
			con = dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" UPDATE tb_pds ");
			sql.append(" SET wname = ? ");
			sql.append("    ,subject = ? ");
			sql.append("    ,filename= ? ");
			sql.append("    ,filesize= ? ");
			sql.append(" WHERE pdsno = ? AND passwd = ? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getFilename());
			pstmt.setLong(4, dto.getFilesize());
			pstmt.setInt(5, dto.getPdsno());
			pstmt.setString(6, dto.getPasswd());
			
			cnt = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("수정 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt);
		}//try end
		
		return cnt;
	}//upProc() end
	
	
}//DAO end
