--pds.sql
--포토 갤러리 게시판

--테이블 생성
CREATE TABLE tb_pds (
   pdsno      NUMBER         NOT NULL
  ,wname      VARCHAR2(100)  NOT NULL
  ,subject    VARCHAR2(250)  NOT NULL
  ,regdate    DATE           NOT NULL
  ,passwd     VARCHAR2(15)   NOT NULL
  ,readcnt    NUMBER         DEFAULT 0
  ,filename   VARCHAR2(250)  NOT NULL   --파일명
  ,filesize   NUMBER         DEFAULT 0  --파일크기
  ,PRIMARY KEY(pdsno)
);

--시퀀스 생성
CREATE sequence pds_seq;

--행 추가
--→ pdsno 				 : 시퀀스(PK)
--→ wname·subject·passwd : 사용자 입력(<form/>)
--→ regdate 			 : 등록일(sysdate)
--→ readcnt 			 : 조회수(bbsReply참조)
--→ filename·filesize 	 : 첨부파일 관련 정보 

INSERT INTO tb_pds(pdsno,wname,subject,passwd,filename,filesize,regdate)
VALUES (pds_seq.nextval, ?, ?, ?, ?, ?, sysdate);

-- 전체 목록
SELECT pdsno, wname, subject, filename, filesize, readcnt, regdate 
FROM tb_pds
ORDER BY regdate DESC ;		
-- 최신글을 제일 상단으로 


-- 상세보기
SELECT * FROM tb_pds WHERE pdsno = ? 


-- 행 삭제 : 글 번호와 비밀번호가 일치하면 테이블 행 삭제 + storage폴더에 해당 파일도 함께 삭제 
DELETE FROM tb_pds WHERE pdsno = ? AND passwd = ?


-- 행 수정
UPDATE tb_pds
SET wname = ?
   ,subject = ?
   ,filename= ?
   ,filesize= ?
WHERE pdsno = ? AND passwd = ?






