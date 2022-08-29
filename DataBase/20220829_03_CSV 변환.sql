-- 파일 → 새로만들기 → 데이터베이스 계층 → 데이터베이스 파일
-- i:\java202207\database\20220829_03_CSV 변환.sql
-- 테이블은 오라클서버에 저장되므로 같은 이름으로 연습할거면 drop으로 지우고 해야함
///////////////////////////////////////////////////////////////////////////////////////////

    【 CSV 】
        ο CSV 파일 : 데이터와 데이터를 콤마, 스페이스바, 탭으로 구분되어있는 파일 
                     데이터베이스로 끌어와서 사용 

        ο 공공데이터포털 https://data.go.kr/ 활용

        ο 받은 정보가 유효한지 아닌지는 개발자의 판단.
        
        ο  첫 행이 데이터인지 행 제목인지 구분해야함

〈 도로명 우편번호 테이블 구축하기 〉
--1) zipdoro.csv 준비 (총 258267행)

--2) zipdoro.csv를 저장하는 zipdoro 테이블 생성
create table zipdoro (
     zipno          char(5)         -- 우편번호
    ,zipaddress     varchar(1000)   -- 주소
);
commit;

--3) 가져오기(데이터임포트)와 내보내기(익스포트) 기능 : 접속→테이블→zipdoro→우클릭
    ο 헤더 체크 해제 (첫 행이 제목이 아니고 데이터가 들어있으니까)
    
    ο 선택된 열이 테이블에다 적용할 데이터들 
    
    ο 만들어 놓은 칼럼에 적합한 데이터가 잘 들어갔는지 확인
       - 열 정의에서 대상 테이블 열 이름 확인

select count(*) from zipdoro;

-- Q1. 서울 특별시 강남구로 시작되는 우편번호가 몇개인가
select count(*) gangnam_cnt
from zipdoro
where zipaddress like '서울특별시 강남%';

-- Q2. 한국교원대학교_초중등학교위치.csv를 변환하시오

--1) 한국교원대학교_초중등학교위치.csv를 저장하는 school_location 테이블 생성

create table school_location (
     schid       varchar2(10)                -- 학교id (pk)
    ,schname     varchar2(255)               -- 학교명
    ,schlev      varchar2(20)                -- 학교등급(초·중·고)
    ,schaddr     varchar2(255)               -- 학교 주소 
    ,schdate     varchar2(10)                -- 학교 생성일
    ,cdate       varchar2(10)                -- 학교 변경일
    ,lati        number(20,10)               -- 위도
    ,longi       number(20,10)               -- 경도
);
commit;

drop table school_location;

select count(*) cnt from school_location;           -- 11873

-- Q2-1. null sell 찾기
select *
from school_location
where schaddr is null;

