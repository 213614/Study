-- 파일 → 새로만들기 → 데이터베이스 계층 → 데이터베이스 파일
-- i:\java202207\database\20220823_01_서브 쿼리
-- 테이블은 오라클서버에 저장되므로 같은 이름으로 연습할거면 drop으로 지우고 해야함
//////////////////////////////////////////////////////////////////

    【 서브 쿼리 】   
        - SQL문 속 또 다른 SQL문
        - 테이블 내에서 다시 한번 쿼림누에 의해 레코드 조회 및 검색
        - 괄호를 잘 써야함
    
-- 국어 점수의 평균 조회
select avg(kor) from sungjuk;
-- ♣ 국어 점수 평균 소수점 없이 조회
select round(avg(kor),0) from sungjuk;      -- 66 
-- 국어 점수 평균 소수점 없이 조회 + 칼럼명
select round(avg(kor),0) as kor_aver from sungjuk;

--예제1. 국어 평균점수(66)보다 높은 점수들을 조회하시오
select uname,kor
from sungjuk
where kor >= 66 ;      -- where kor >= round(avg(kor),0)로 하면 오류남!
                       -- 66은 절대값이니까 대신 위에 ♣ 달린 쿼리문 자체를 넣으면 된다
                       -- 국어 평균 점수를 구하는 쿼리문이니까! 그게 서브쿼리! 
-- 서브쿼리로 적용시키기 
select uname,kor
from sungjuk
where kor >=(select round(avg(kor),0) from sungjuk);  -- ★서브쿼리! : 괄호 안에 세미콜론 없게 조심

-- Q1. 서울 지역의 국어점수 평균을 구한 후 그 평균보다 높은 점수를 가진 
--     행에 대한 지역, 이름, 국어점수를 조회하시오

-- 1) 서울 지역의 국어점수 평균 (+ 반올림, 소수점없이)
select round(avg(kor),0)
from sungjuk
where addr='Seoul';             -- 73

-- 2)
select addr, uname, kor
from sungjuk
where kor >= ( select round(avg(kor),0)
               from sungjuk
               where addr='Seoul' )
order by addr;

-- Q2. 서울지역의 국어점수 평균보다 잘한 국어점수가 다른 지역에 있는지 조회하시오 
--      = Q1 답에서 서울지역만 빼고 조회

-- 값이 나오긴 했는데 나중에 주소도 점수도 같은 사람이 발생하면 겹쳐서 출력될거같음 강사님처럼 and사용하기
select addr, kor
from sungjuk
where kor >= ( select round(avg(kor),0)
               from sungjuk
               where addr='Seoul' )
group by addr, kor
having   addr in ('Busan','Jeju','Suwon')       -- 강사님처럼 하는게 더 간결
order by kor desc;

-- 강사님 코드
select addr, uname, kor
from sungjuk
where kor >= ( select round(avg(kor),0)
               from sungjuk
               where addr='Seoul' )
      and addr <> 'Seoul';    -- addr != 'Seoul'과 동일


-- Q3. 국어점수의 최소값보다 이하 점수가 수학 또는 영어점수에 있는지 조회하시오
-- 1)
select min(kor) from sungjuk; 
-- 2)
select uname, mat, eng
from sungjuk
where mat<=(select min(kor) from sungjuk) 
      or eng<=(select min(kor) from sungjuk);

-- 강사님 코드
-- 1) 국어 점수 최소값
select min(kor) from sungjuk; 
-- 2) 
select uname,kor, mat, eng
from sungjuk
where mat<=(select min(kor) from sungjuk) 
      or eng<=(select min(kor) from sungjuk);


select*from sungjuk;
commit;