-- 파일 → 새로만들기 → 데이터베이스 계층 → 데이터베이스 파일
-- i:\java202207\database\20220822_05_Group
-- 테이블은 오라클서버에 저장되므로 같은 이름으로 연습할거면 drop으로 지우고 해야함
//////////////////////////////////////////////////////////////////

    【 데이터 그룹화 Group 】

-- sungjuk_seq 시퀀스 삭제
drop sequence sungjuk_seq;

-- sungjuk 테이블에서 사용할 시퀀스 생성
create sequence sungjuk_seq;

-- sungjuk 테이블 삭제
drop table sungjuk;

-- sungjuk 테이블 생성
create table sungjuk (
    snum        int             primary key                        
    ,uname      varchar(50)     not null
    ,kor        int             check(kor between 0 and 100)
    ,eng        int             check(eng between 0 and 100)
    ,mat        int             check(mat between 0 and 100)
    ,addr       varchar(20)     check(addr in ('Seoul', 'Jeju', 'Busan', 'Suwon'))
    ,tot        int             default 0
    ,aver       int             default 0
    ,wdate      date            default sysdate
);

-- sungjuk 테이블 입력 데이터
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
select*from sungjuk;

//////////////////////////////////////////////////////////////////

    【 Distinct 】
        : 칼럼에 중복 값이 있으면 대표값 1개만 출력
        : distinct 칼럼명 

select addr from sungjuk order by addr;         -- 생략되면 기본 asc:오름차순
select addr from sungjuk order by addr desc;    -- desc:내림차순

select distinct(addr) from sungjuk;             -- 같은 주소를 기반으로 그룹화

select distinct(uname) from sungjuk;   
-- 데이터의 속성 파악 중요 → 'uname'은 중복된 데이터가 많지 않으므로 의미가 없음.
    
//////////////////////////////////////////////////////////////////    
    
     【 group by 】   
        : 칼럼에 동일한 내용을 가진 데이터끼리 그룹화시킴
        : group by 칼럼1, 칼럼2, 칼럼3 ···.
        :           1차 > 2차 > 3차 (order by처럼 계속해서 소그룹화)
        : 통계 · 집계용으로 group by를 많이 쓴다. (그룹화 후 통/집계)

-- 주소가 동일한 값을 그룹화 시키고 주소 조회 (= distinct와 결과값 동일 )
select addr      -- 그룹화 후 집계냈을 때 하나의 값만 올 수 있는걸 적는다
from sungjuk     -- = 그룹시키고 나올 수 있는 값이 1개만 가능한 값만 조회
group by addr;

-- !error! ORA-00979: GROUP BY 표현식이 아닙니다.
select addr, uname
from sungjuk
group by addr;
--  addr은 seoul/jeju/busan/suwon처럼 여러개의 데이터가 하나의 값으로 나올수있지만 
--  uname은 하나의 그룹에서 각자 다 다른값이 나오므로 select에 적으면 오류난다 (group by의 특징)

//////////////////////////////////////////////////////////////////   
select addr from sungjuk order by addr;     -- 원본 확인

-- Q1. 주소 별 인원수를 조회하시오 → 칼럼2 레코드4 논리적 테이블(개발자가 만든게아니라 조회하면서 자동으로 생성된 테이블)
-- 내 코드
select addr, count(*) as cnt    -- as 임시명 : 칼럼명 임시 부여 (as생략가능)
from sungjuk
group by addr
order by cnt desc;

-- 주소별 오름차순 조회
select addr
from sungjuk
group by addr
order by addr;

-- 주소별 인원수를 내림차순으로 정렬해서 조회 (내 코드와 동일)
--                                      해석순서
select addr, count(*) as cnt            -- 3
from sungjuk                            -- 1
group by addr                           -- 2
order by cnt desc;                      -- 4

//////////////////////////////////////////////////////////////////   

     【 집계 함수 】 

-- Q2. 주소별로 묶고 국어점수에 대해 집계하시오
             --   갯수,           최대값,        최소값,        합계,         평균 
select addr, count(*) as cnt, max(kor) max, min(kor) min, sum(kor) sum, avg(kor) aver   
from sungjuk                           
group by addr;   

-- 2-1. 위 테이블을 주소별로 오름차순 정렬 
select addr, count(*) as cnt, max(kor) max, min(kor) min, sum(kor) sum, avg(kor) aver   
from sungjuk                           
group by addr
order by addr;   

-- 2-2. 평균을 소수점 반올림 후 정수처리 
        ο round(값, 0) : 소수점 이하 값에서 반올림 후 소수점을 없앤다(0) / 0 대신 2를 넣으면 소숫점 두번째자리까지 표현된다. 3은 세번째 
--                                                                            ↓ 여기!       
select addr, count(*) as cnt, max(kor) max, min(kor) min, sum(kor) sum, round(avg(kor),2) aver
-- select 안에서 round 함수를 작성한다. round(값,0) 여기선 round(함수(칼럼명=값),0) 
from sungjuk                           
group by addr
order by addr;  

-- 국어 평균을 소수점없이 반올림 후 내림차순으로 정렬
select addr, count(*) as cnt, max(kor) max, min(kor) min, sum(kor) sum, round(avg(kor),0) aver
from sungjuk                           
group by addr
order by round(avg(kor),0) desc;  

-- 칼럼명 변경
select addr
     , count(*) as cnt
     , max(kor) max_kor
     , min(kor) min_kor
     , sum(kor) sum_kor
     , round(avg(kor),0) avg_kor
from sungjuk                           
group by addr
order by round(avg(kor),0) desc;  

//////////////////////////////////////////////////////////////////   
select*from sungjuk;

-- Q3. 총점(tot), 평균(aver) 구하시오
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3;

-- Q4. 평균(aver)이 80점이상 행을 대상으로 주소별 인원수를 인원수순으로 조회하시오
select addr, count(*) cnt
from sungjuk
where aver>=80
group by addr
order by count(*); 


