package net.sungjuk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class SungjukDAO {
	// db연결에 관련되어있는 비지니스 로직은 함수 단위로 만들어서 DAO 클래스 안에서 관리한다
	// DAO : Data Access Object 
	
	private DBOpen dbopen 		    = null;
	private Connection con 			= null;
	private PreparedStatement pstmt = null;
	private ResultSet rs 			= null;
	private StringBuilder sql 		= null;
	
	public SungjukDAO() {
		dbopen = new DBOpen();
	}//end
	
	public int insert(String uname, int kor, int eng, int mat, int aver, String addr) {
		// sql 행 추가 함수
		
		int cnt = 0; // 성공 또는 실패 여부 변환
		try {
				con = dbopen.getConnection();	//DBOpen클래스 안에있는 getConnection();함수 호출해서 db연결하기 
			
				StringBuilder sql = new StringBuilder();
				sql.append(" INSERT INTO sungjuk(snum,uname,kor,eng,mat,aver,addr,wdate) ");
				sql.append(" VALUES (sungjuk_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate) ");

				pstmt = con.prepareStatement(sql.toString()); // SQL문 변환 작업

				pstmt.setString(1, uname);
				pstmt.setInt   (2, kor);
				pstmt.setInt   (3, eng);
				pstmt.setInt   (4, mat);
				pstmt.setInt   (5, aver);
				pstmt.setString(6, addr);
		
				cnt = pstmt.executeUpdate();
				// cnt = 0이면 실패 
				
		}catch(Exception e) {
			System.out.println("행 추가 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt);
		}//try end
		
		return cnt;
	}//insert() end
	
	public int create(SungjukDTO dto) {
		int cnt=0;
		
		try {
			con = dbopen.getConnection();	//DBOpen클래스 안에있는 getConnection();함수 호출해서 db연결하기 
		
			StringBuilder sql = new StringBuilder();
			sql.append(" INSERT INTO sungjuk(snum,uname,kor,eng,mat,aver,addr,wdate) ");
			sql.append(" VALUES (sungjuk_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate) ");

			pstmt = con.prepareStatement(sql.toString()); // SQL문 변환 작업

			pstmt.setString(1, dto.getUname());
			pstmt.setInt   (2, dto.getKor());
			pstmt.setInt   (3, dto.getEng());
			pstmt.setInt   (4, dto.getMat());
			pstmt.setInt   (5, dto.getAver());
			pstmt.setString(6, dto.getAddr());
	
			cnt = pstmt.executeUpdate();
			// cnt = 0이면 실패 
			
			}catch(Exception e) {
				System.out.println("행 추가 실패 : " + e);
			}finally {
				DBClose.close(con, pstmt);
			}//try end
	
		return cnt;
	}//create() end
	
	public ArrayList<SungjukDTO> list() { // 검색창이면 매개변수 있어야함
		
		// DB에서 가져온 데이터(rs)를 한번에 모아서(ArrayList)
		// sungjukList.jsp에다가 넘겨준다 
		ArrayList<SungjukDTO> list = null;
		
		
		try {
				con = dbopen.getConnection();
				
				StringBuilder sql = new StringBuilder();
				sql.append(" SELECT snum, uname, kor, eng, mat, wdate ");
				sql.append(" FROM sungjuk ");
				sql.append(" ORDER BY snum DESC ");

				pstmt = con.prepareStatement(sql.toString()); 
				
				rs = pstmt.executeQuery(); 		
				
				if (rs.next()) {
					// 커서가 존재한다 = 자료가 존재한다 
					// 전체 행을 저장할 수 있는 list(위에서만든ArrayList)를 객체 선언해줌(메모리할당해줌)
					list = new ArrayList<>();
					
					do {
							// 커서가 가리키는 한 행(줄) = 한 사람의 모든 정보를 저장한다 
							SungjukDTO dto = new SungjukDTO();
							dto.setSnum(rs.getInt("snum"));
							dto.setUname(rs.getString("uname"));
							dto.setKor(rs.getInt("kor"));
							dto.setEng(rs.getInt("eng"));
							dto.setMat(rs.getInt("mat"));
							dto.setWdate(rs.getString("wdate"));
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
	}//list()end
	
	public SungjukDTO read(int snum) {
		
		SungjukDTO dto = null;
		
		try {
				con = dbopen.getConnection();
				
				StringBuilder sql = new StringBuilder();
				sql.append(" SELECT snum, uname, kor, eng, mat, aver, addr, wdate ");
				sql.append(" FROM sungjuk ");
				sql.append(" WHERE snum = ? ");

				pstmt = con.prepareStatement(sql.toString()); // SQL문 변환 작업
				pstmt.setInt(1, snum);
				
				rs = pstmt.executeQuery(); 		
				
				if (rs.next()) {
					
					dto = new SungjukDTO();
					dto.setSnum(rs.getInt("snum"));
					dto.setUname(rs.getString("uname"));
					dto.setKor(rs.getInt("kor"));
					dto.setEng(rs.getInt("eng"));
					dto.setMat(rs.getInt("mat"));
					dto.setAver(rs.getInt("aver"));
					dto.setAddr(rs.getString("addr"));
					dto.setWdate(rs.getString("wdate"));
				
				}else { dto = null; }//if end
				
		}catch(Exception e) {
			System.out.println("불러오기 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		
		return dto;
	}//read()end
	
	public int delete(int snum) {
		
		int cnt = 0;
		
		try {
				con = dbopen.getConnection();
			
				StringBuilder sql = new StringBuilder();
				sql.append(" DELETE FROM sungjuk ");
				sql.append(" WHERE snum = ? ");
				
				pstmt = con.prepareStatement(sql.toString()); // SQL문 변환 작업
				pstmt.setInt(1, snum);

				cnt = pstmt.executeUpdate();

		}catch(Exception e) {
			System.out.println("삭제 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//try end
		
		
		return cnt; 
	}//delete() end

}//class end
