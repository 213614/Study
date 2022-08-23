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

//////////////////////////////////////////////////////////////////220823

     【 2차 그룹 】 = 2차·3차 정렬처럼 

-- 1) 주소별 순으로 조회하시오
select addr, kor, eng, mat 
from sungjuk 
order by addr, kor;     --→ 주소별로 정렬 그 안에서 국어 점수별로 정렬


-- 2) 주소별(1차) 그룹을 하고, 그 그룹내에서 같은 국어점수(2차)로 그룹화
select addr, kor    -- ★ group by는 select 할 때 그룹지어진 목록만 볼 수 있음.
from sungjuk
group by addr, kor
order by addr;


-- 3) 1차로 그룹지어진 값을 또 조회하기
-- 제주도에 20점 맞은 사람 몇 명인지, 서울에서 90점 맞은 사람이 몇 명인지
-- = 각 지역별에서 동점자들의 수를 조회할 수 있다
select addr, kor, count(*) 
from sungjuk
group by addr, kor
order by addr;

-- 국,영,수 점수가 같은 것 끼리 묶기 ( = 동점자 몇명인지 체크할 수 있음)
select kor, eng, mat, count(*) 
from sungjuk
group by kor, eng, mat          -- 국어점수 같은 애들 그룹 그안에서 수학점수 같은 애들 그룹 그 안에서 영어점수 같은 애들 그룹 = 세 과목 다 동점   
order by kor, eng, mat;         

select*from sungjuk;

////////////////////////////////////////////////////////////////////////////////

     【 having 조건절 】 - group by
         -- where 조건절 / on 조건절
         - where 조건절 쓰듯이 쓰면됨
         - having 조건절은 group by 와 같이 사용하는 조건절
         - 그룹화를 하고 난 후에 조건절을 추가
         - 형식: having 조건
   
         -- where과 having의 차이
         -- where - group by : 조건 먼저 준 후 그룹화, 전체 테이블 자체에 먼저 조건을 줄 수 있다.
         -- group by - having : 그룹화 먼저 시킨 후 조건, 그룹화 되어진 새로운 테이블에 조건을 준다.
         -- where-group by = 조건이 맞는 애들끼리 그룹화
         -- group by-having = 그룹 내에서 조건에 해당되는 애들을 조회 
   

-- 1) 주소별 인원수를 조회하시오
select addr, count(*)
from sungjuk
group by addr;

-- 2) 주소별 인원수가 3인 행을 조회하시오
select addr, count(*)
from sungjuk
group by addr
having count(*)=3;

-- 2-1) 주소별 인원수가 3이상인 행을 조회하시오
select addr, count(*)
from sungjuk
group by addr
having count(*)>=3;

////////////////////////////////////////////////////////////////////////////////

-- Q5. 주소별 국어평균값이 50이상 행을 내림차순으로 조회하시오 
--    (단, 평균값은 소수점없이 반올림)
-- 풀이순서: 주소별로 그룹화(group by) → 그룹내에서 평균값 50이상 조건(having) → 내림차순 조회(order by)
select addr, round(avg(kor),0) avg_kor
from sungjuk
group by addr 
having round(avg(kor),0)>=50
order by round(avg(kor),0) desc;

-- 강사님 풀이
1) 주소별 국어 평균값 구하기
select addr, avg(kor)
from sungjuk
group by addr;
-- 소수점이 떨어지지 않는다.


2) 국어 평균값 소수점 반올림하고 소수점은 없애기
select addr, round(avg(kor), 0)
from sungjuk
group by addr;
-- group by에 의해 도출된 테이블에서 조건을 추가한다.


3) 2번 결과에서 국어평균값이 50점 이상인(탤런트X) 조건 추가하기 (최최최종.sql)
select addr, round(avg(kor), 0)
from sungjuk
group by addr
having round(avg(kor), 0)>=50;
---> 이 값을 자바로 옮기는 것이당.


4) 3번 결과에서 국어평균값 기준으로 정렬하기 (진짜_최최최최종.sql)
select addr, round(avg(kor), 0)
from sungjuk
group by addr
having round(avg(kor), 0)>=50
order by round(avg(kor), 0) desc;

5) 4의 결과에서 국어 평균값 칼럼명을 avg_kor로 변경      ＊최종＊
select addr, round(avg(kor), 0) avg_kor
from sungjuk
group by addr
having round(avg(kor), 0)>=50
order by round(avg(kor), 0) desc;

////////////////////////////////////////////////////////////////////////////////

-- Q6. 평균(aver)이 70이상 행을 대상으로 주소별 인원수를 구한 후,
--     그 인원수가 2미만 행을 인원수 순으로 조회하시오
-- 풀이순서: 평균 70이상 행 먼저 구함 (where절) → 주소별 인원수 그룹화(group by + count)
--          → 해당 인원수가 2 미만 (having) → 인원수 순으로 조회 (order by)

-- 문5는 전체 대상으로 조건, 그룹화 / 문6은 그룹 내에서 조건을 달고 그 해당 그룹만 조회 
select addr, count(*) cnt
from sungjuk
where aver>=70
group by addr
having count(*)<2
order by count(*);

-- 강사님 풀이 
1) 전체 행 조회
select*from sungjuk;

2) 평균(aver)값이 70이상 행 조회
select*
from sungjuk
where aver>=70;

3) 2의 결과에서 주소별 인원수를 구하시오
select addr, count(*)       -- select는 코드 작성시 항상 마지막에 적는다.
from sungjuk
where aver>=70
group by addr;

4) 3의 결과에서 해당 인원수가 2 미만인 행을 구하시오
select addr, count(*)      
from sungjuk
where aver>=70
group by addr
having count(*)<2;      -- count를 as로 바꾼 이름을 넣으면 오류가 된다 그냥 그대로 적어야함(having이던 where던 group던) 

5) 4의 결과에서 인원수 순으로 조회하시오 ＊최종＊
select addr, count(*) 
from sungjuk
where aver>=70
group by addr
having count(*)<2
order by count(*); 

////////////////////////////////////////////////////////////////////////////////

     【 case when ~ then end 구문 】= (JS에서의) if문 + case문
            - select 안에 작성한다. 
            - 형식:
                    CASE WHEN 조건1 THEN 조건만족시 값1
                         WHEN 조건2 THEN 조건만족시 값2
                         WHEN 조건3 THEN 조건만족시 값3
                                    ...
                         ELSE 값  (위 조건에 만족하지 않으면 무조건적으로 입력될 값 / 생략가능)
                     END 결과컬럼명 (then 값이 들어갈 칼럼)
                     
-- 이름과 주소 조회
select uname, addr
from sungjuk;

-- DB에서 데이터를 저장할때는 정보 그대로보다는 코드화해서 저장하는 경우가 많다
-- ex.  여성/남성 으로 저장해도 되지만 f/m으로 저장한다 = 저장 후 출력할때는 여성/남성으로 
--      사용자가 보게끔 한다 = 손실 데이터가 적어짐 : f/m같은 걸 구분코드라 한다. 
-- ex2. 영화 예매 사이트에서 영화 장르를 액션/코믹/애니메이션을 구분코드로 코드화시켜 저장한다. act/com/ani
-- ex3. 의류 쇼핑몰에서 남성복/여성복 or 상의/하의 이런걸 구분코드로 코드화해서 저장 

-- 이름과 주소 조회 (단, 주소는 한글로 바꿔서 보여주고싶다)
--                                     ↓ 여기선 이게 구분코드 (f/m or act/com/ani)
select uname, addr, case when addr = 'Seoul' then '서울'  -- addr가 'Seoul'이면 '서울'로 출력된다
                         when addr = 'Jeju'  then '제주'
                         when addr = 'Busan' then '부산'
                         when addr = 'Suwon' then '수원'
                         -- else는 생략가능 
                     end as juso    -- case문을 닫고 '서울', '제주', '부산', '수원'을 juso라는 칼럼에 담아주세요
                                    -- as 생략 가능
from sungjuk
order by juso;

////////////////////////////////////////////////////////////////////////////////

-- Q7. 이름, 국어, 학점을 조회하시오. 
--       학점 : 국어점수 90이상 'A학점'
--                      80이상 'B학점'
--                      70이상 'C학점'
--                      60이상 'D학점'
--                      나머지 'F학점'

select uname, kor, case when kor>=90 then 'A'
                        when kor>=80 then 'B'
                        when kor>=70 then 'C'
                        when kor>=60 then 'D'
                        else 'F'
                    end grade         -- as 생략 가능 / 한글가능(따옴표 없이)      
from sungjuk
order by kor desc;


-- between연산자로도 가능!                          작은수 and 큰수 여야한다 (90~100 사이는 A) 
select uname 이름, kor 국어점수, case when kor between 90 and 100 then 'A'       
                                     when kor between 80 and 89  then 'B'
                                     when kor between 70 and 79  then 'C'
                                     when kor between 60 and 69  then 'D'
                                     else 'F'
                                end 국어학점        
from sungjuk
order by kor desc;

-- 나혼자 연습 : 국어 학점별로 그룹화하고 그 학점별 인원수 조회 + 국어 성적순으로 내림차순
select kor, case when kor>=90 then 'A'
                 when kor>=80 then 'B'
                 when kor>=70 then 'C'
                 when kor>=60 then 'D'
                 else 'F'
            end as grade
    ,count(*) cnt    
from sungjuk
group by  kor
order by kor desc;





