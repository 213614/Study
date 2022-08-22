-- 파일 → 새로만들기 → 데이터베이스 계층 → 데이터베이스 파일
-- i:\java202207\database\20220822_03_성적 테이블
-- 테이블은 오라클서버에 저장되므로 같은 이름으로 연습할거면 drop으로 지우고 해야함
//////////////////////////////////////////////////////////////////

-- 기존 sungjuk 테이블 삭제
drop table sungjuk;
commit;

-- sungjuk 테이블 생성
create table sungjuk(
    snum    int           not null       -- 일련번호
    ,uname  varchar (50)  not null   
    ,kor    int           not null    
    ,eng    int           not null
    ,mat    int           not null
    ,tot    int           null      
    ,aver   int         
    ,addr   varchar (50)                  -- 주소
    ,wdate  date                          -- 등록일:년월일시분초(날짜형 데이터타입이 따로있음:date)
);                                        -- '연/월/일' (or '연-월-') '시:분:초' → 날짜형 데이터는 문자열 형태로 표현

select*from sungjuk;

-- 'sungjuk' 테이블 입력 데이터 
insert into sungjuk(snum, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval,'솔데스크', 90, 85, 95, 'Seoul',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'무궁화',40,50,20,'Seoul',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'진달래',90,50,90,'Jeju',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'개나리',20,50,20,'Jeju',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'봉선화',90,90,90,'Seoul',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'나팔꽃',50,50,90,'Suwon',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'선인장',70,50,20,'Seoul',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'소나무',90,60,90,'Busan',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'참나무',20,20,20,'Jeju',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'홍길동',90,90,90,'Suwon',sysdate);

insert into sungjuk(snum,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'무궁화',80,80,90,'Suwon',sysdate);

commit;
select count(*)from sungjuk;
select*from sungjuk;

//////////////////////////////////////////////////////////////////

-- Q1. 전체행에 대해서 총점(tot), 평균(aver)을 구하시오
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3;

-- Q2. 이름에 '나' 글자가 있는 행을 조회하시오
select uname
from sungjuk
where uname like '%나%';

-- Q3. 주소가 서울, 제주 행을 조회하시오
select uname, addr
from sungjuk
where addr like 'Seoul' or addr like 'Jeju'
order by addr;          -- 주소를 오름차순 정렬 

--◆ 강사님 코드 
select uname, addr
from sungjuk
where addr='Seoul' or addr='Jeju';

select uname, addr
from sungjuk
where addr in ('Seoul','Jeju');

-- Q4. 국영수 세과목 모두 90점이상 행이 몇개인지 조회하시오
select count(*)
from sungjuk
where kor>=90 and eng>=90 and mat>=90;

--◆ 강사님 코드 
select count(*) as cnt갯수      -- 칼럼명 변경(as생략가능/한글도가능)
from sungjuk
where kor>=90 and eng>=90 and mat>=90;

-- Q5. 주소별로 정렬해서 조회하시오. 주소가 같다면 일련번호 순으로 다시 정렬해서 조회하시오
select snum, uname, addr
from sungjuk
order by addr asc, snum;












