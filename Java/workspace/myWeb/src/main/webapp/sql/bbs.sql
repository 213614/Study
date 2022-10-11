-- bbs.sql
-- 답변형 및 댓글형 게시판

-- cmd 콘솔창 예쁘게 출력 = col 칼럼명 for 20자
set linesize 1000;
col wname for a10;	
col subject  for a10;
col content  for a10;
col passwd  for a10;




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

-- 



