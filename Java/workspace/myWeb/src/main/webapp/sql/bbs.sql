


-- bbs.sql
-- 답변형 및 댓글형 게시판

-- cmd 콘솔창 예쁘게 출력 = col 칼럼명 for 20자
set linesize 1000
col wname for a10
col subject  for a10
col content  for a10
col passwd  for a10
col ip  for a10;


-- table 삭제
drop table tb_bbs;

-- table 생성
create table tb_bbs(
  bbsno    number(5)       not null 			-- 일련번호 -99999~99999
 ,wname    varchar2(20)    not null 			-- 작성자
 ,subject  varchar2(100)   not null 			-- 글제목
 ,content  varchar2(2000)  not null 			-- 글내용
 ,passwd   varchar2(10)    not null 			-- 글비밀번호
 ,readcnt  number(5)       default 0 not null 	-- 글조회수
 ,regdt    date            default   sysdate  	-- 글작성일
 ,grpno    number(5)       not null  			-- 글 그룹번호
 ,indent   number(5)       default 0 			-- 들여쓰기
 ,ansnum   number(5)       default 0 			-- 글순서
 ,ip       varchar2(15)    not null  			-- 사용자 요청 PC의 IP
 ,primary key(bbsno)                 			-- bbsno 기본키 
);

-- 시퀀스 생성
create sequence bbs_seq;

-- 명령어 완료
commit;

--→ 비밀번호가 DB와 일치하면 그때 삭제가능
--→ 비밀번호는 필수 작성 사항이라 JS에서 비번 썼는지 if문해서 true만 서버로 submit

--------------------------------------------------------------------------------------

-- 새 글쓰기
bbsno 						    : 시퀀스를 이용하여 일련번호 발생 
wname, subject, content, passwd : 사용자가 직접 값을 입력
readcnt, regdt, indent, ansnum	: default값이 존재
grpno, indent, ansnum			: 답변형 게시판이라 존재하는 칼럼(공부용)
ip								: 요청 PC의 IP저장 → request.get~함수를 이용하여 꺼내오기(basic04\form\09_ok.jsp참조)
grpno							: max(bbsno)+1; 

-- 그룹 번호(grpno) 생성
select max(bbsno) from tb_bbs;		-- 아직 데이터가 없으므로 null
select max(bbsno)+1 from tb_bbs;	-- null값은 연산 불가
-- 값이 null이면 임의의 값(내가 지정한 값)으로 바꾸는 함수 사용→ nvl(칼럼,지정 값)
select nvl(max(bbsno),0) from tb_bbs;
-- 최종 그룹 번호 ↓
select nvl(max(bbsno),0)+1 from tb_bbs;

-- 행 추가
INSERT INTO tb_bbs (bbsno, wname, subject, content, passwd, ip, grpno)
VALUES (bbs_seq.nextval, ?, ?, ?, ?, ?, (SELECT nvl(max(bbsno),0)+1 FROM tb_bbs));

-- 전체 목록
SELECT bbsno, wname, subject, readcnt, regdt 
FROM tb_bbs
ORDER BY grpno DESC, ansnum ASC;

-- 상세보기
SELECT * FROM tb_bbs WHERE bbsno = ?;

-- 행 삭제
DELETE FROM tb_bbs WHERE bbsno = ? AND passwd = ?;

-- 행 수정
UPDATE tb_bbs
SET wname = ?
   ,subject = ?
   ,content = ?
   ,ip = ?
WHERE bbsno = ? AND passwd = ?; 

-- 조회수 증가 (onclick시?) → 실제론 이렇게 작성 안하고 함수로 처리한다  
UPDATE tb_bbs 
SET readcnt = readcnt+1
WHERE bbsno = ? ; 

--------------------------------------------------------------------------------------

-- [답변쓰기 알고리즘] 
-- → INSERT INTO : 멤버테이블이였다면 그냥 회원가입이다 = 테이블을 어떻게 쓸것인가에 따른것이지 코드 자체는 똑같다 
-- ① 새글 쓰기 : 최초의 부모글
-- ② 답변 쓰기 : 자식글 

-- 답변에 필요한 칼럼들
- grpno  : 그룹번호 → 다른 그룹들과 구분만 되면 되기때문에 굳이 max(bbsno)+1를 사용하지 않아도 된다
		 : 댓글의 부모글과 그룹번호는 동일하게 간다 
- indent : 들여쓰기 → 부모글의 indent(들여쓰기) +1 → 리플 이미지를 indent 수 만큼 달아준다
- ansnum : 댓글순서 → 부모글의 ansnum(댓글순서) +1 → 후에 최신 댓글들이 달리면서 +1씩 증가하여 글 순서 재조정한다 = UPDATE SET VALUES 

-- ex. 새글쓰기 
                     max(bbsno)+1
bbsno     subject 		grpno	    indent	    ansnum
번호 			제목			그룹번호		들여쓰기		댓글순서
 1		 제주도가고싶다		  1 		  0           0 
 2	        서울			  2        	  0  	      0
 3	        부산			  3        	  0  	      0
					  → 현재 bbsno의 max값(=2)에다가 + 1 = 3

-- ex. 답변쓰기
bbsno     subject 		grpno	    indent	    ansnum
번호 			제목			그룹번호		들여쓰기		댓글순서
 1		 제주도가고싶다		  1 		  0           0 
 2	        서울			  2        	  0  	      0
	      → 종로			  2        	  1  	      1  	
	      →→ 관철동         2           2           2	      
      	  →→→ 보신각        2           3           3	  
	      →→ 인사동         2           2           3→4 (관철동에 보신각이라는 최신 댓글이 달리면서 갖고있던 ansnum+1)
	      										  --2→3 (종로에 관철동이라는 최신댓글이 달리면서 갖고있던 ansnum+1 : 순서가 밀림)
   	      → 강남			  2        	  1  	      4→5 (관철동에 보신각이라는 최신 댓글이 달리면서 갖고있던 ansnum+1)
   	      										  --3→4 (종로에 관철동이라는 최신댓글이 달리면서 갖고있던 ansnum+1 : 순서가 밀림)          
												  --2→3 (종로에 대댓글인 인사동이 달리면서 갖고있던 ansnum+1+1이 되어 순서가 밀림)
												  --1→2 (최신 댓글인 종로가 달리면서 갖고있던 ansnum+1로 순서가 밀린다)
	      →→ 도곡동         2           2           6 (강남(부모)의 댓글로 부모의 ansnum + 1 한다)
	      →→ 역삼동         2           2           6→7 (강남에 도곡동이라는 최신댓글때문에 갖고있던 ansnum+1 : 순서가 밀림)
	      →→ 마포구         2           2           7→8 (도곡동이라는 댓글때문에 순서대로 다 하나씩 뒤로 밀림)	      										
												     
※ ORDER BY grpno DESC ansnum ASC;로 최신 글/댓글은 다 최상단으로 정렬한다 = 그룹번호는 내림차순(큰수부터) 그 안에서 리댓순서는 내림차순(작은수부터)

-- 글 순서(ansnum) 재조정 sql문
UPDATE tb_bbs
SET ansnum = ansnum + 1
WHERE grpno = ? AND ansnum = ?
-- grpno가 부모와 같은 애들중에 ansnum이 새댓글과 같거나 큰 행만 순서 재조정

-- ex.역삼동,마포구 ansnum재조정 sql문
UPDATE tb_bbs
SET ansnum = ansnum + 1
WHERE grpno = 2 AND ansnum >= 6;

--------------------------------------------------------------------------------------

-- [검색]

-- ①. 제목+내용에서 '파스타'가 있는지 검색
SELECT *
FROM tb_bbs
WHERE subject LIKE '%파스타%' OR content LIKE '%파스타%';
--  AND : 제목에 파스타가 있고 내용에도 파스타가 있는 게시글
--★ OR  : 제목에 파스타가 있거나 내용에 파스타가 있는 게시글

-- ②. 제목에서 '파스타'가 있는지 검색
SELECT *
FROM tb_bbs
WHERE subject LIKE '%파스타%';


-- ③. 내용에서 '파스타'가 있는지 검색
SELECT *
FROM tb_bbs
WHERE content LIKE '%파스타%';


-- ④. 작성자에서 '파스타'가 있는지 검색
SELECT *
FROM tb_bbs
WHERE wname LIKE '%파스타%';





















