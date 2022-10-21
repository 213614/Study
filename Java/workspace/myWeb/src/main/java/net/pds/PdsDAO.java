package net.pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

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

	
}//DAO end
