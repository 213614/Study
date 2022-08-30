-- 파일 → 새로만들기 → 데이터베이스 계층 → 데이터베이스 파일
-- i:\java202207\database\20220830_02_View.sql
-- 테이블은 오라클서버에 저장되므로 같은 이름으로 연습할거면 drop으로 지우고 해야함
///////////////////////////////////////////////////////////////////////////////////////////

    【 뷰 View 】
        - 테이블처럼 사용하는 뷰
        - 테이블에 대한 가상의 테이블로써 테이블처럼 직접 데이터를 소유하지 않고
          검색시에 이용할 수 있도록 정보를 담고 있는 객체 테이블 정보의 부분집합
          
        - SQL문에서 발생된 논리적 테이블을 저장해 놓을 수 있다.(필요할때마다 끌어다가 사용가능)
        - 원본 데이터 손실 방지를 위해 카피해서 view로만 SQL문을 작성하는 경우도 있다
        
        ο 사용목적
            ㆍ테이블에 대한 보안기능을 설정해야 하는 경우
            ㆍ복잡하고, 자주 사용하는 질의 SQL문을 보다 쉽고 간단하게 사용해야 하는 경우
            
        ο 계정에 대해서 뷰 생성 권한 부여 필요
               grant create view to 아이디
                 
         ex.   grant create view to java202207            
         
        ο 뷰 생성 및 수정 형식
               create or replace view 뷰이름 (최초의 경우는 create 그 이후론 replace로 업데이트됨)   
               → replace : 이미 존재하는 뷰의 내용을 수정함
               as [SQL문]
              
        ο 뷰 삭제 
               drop view 뷰이름
              
        ο 테이블, 뷰 목록 확인
               select*from tab;                              -- 모든 객체 종류 확인
               select*from tab where tabtype = 'TABLE';      -- 테이블 목록 확인
               select*from tab where tabtype = 'VIEW';       -- 뷰 목록 확인
               
///////////////////////////////////////////////////////////////////////////////////////////

-- 성적 테이블 목록 확인
select * from sungjuk;

-- 주소가 서울, 제주 지역의 이름,국영수,주소 조회
select uname,kor,mat,eng,addr
from sungjuk
where addr in ('Seoul','Jeju');

-- 위 논리테이블로 뷰 생성(두번째부터는 수정)
-- create or replace view 뷰이름 as SQL문
create or replace view test1_view 
as 
    select uname,kor,mat,eng,addr
    from sungjuk
    where addr in ('Seoul','Jeju');

-- 생성된 뷰는 테이블처럼 사용 가능
select * from test1_view;

-- 데이터사전(user_views테이블)에서 뷰의 세부 정보 확인 가능
select * from user_views;

select text 
from user_views
where view_name = 'TEST1_VIEW';         -- 뷰 이름 대문자로 써야함
-- SQL문이 일렬로 조회됨

-- test2_view (alias 별칭)
create or replace view test2_view 
as 
    select uname as 이름,kor 국어,mat 수학,eng 영어,addr 주소
    from sungjuk
    where addr in ('Seoul','Jeju');

select * from test2_view;

///////////////////////////////////////////////////////////////////////////////////////////

-- Q1. 수강신청한 학생들의 학번, 총 학점을 뷰로 생성하시오(test3_view)
create or replace view test3_view 
as 
    select SU.hakno, sum(GW.ghakjum) || '학점' as tot
    from tb_sugang SU join tb_gwamok GW
                      on SU.gcode = GW.gcode
    group by SU.hakno;
    
select * from test3_view;

-- test3뷰와 학생테이블 조인해서 학번, 이름, 총학점 조회
select ST.uname, T3.*
from tb_student ST join test3_view T3
                   on ST.hakno = T3.hakno
order by ST.hakno;




