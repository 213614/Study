-- 파일 → 새로만들기 → 데이터베이스 계층 → 데이터베이스 파일
-- i:java202207\database\20220819_02_SQL기초 
-- 테이블은 오라클서버에 저장되므로 같은 이름으로 연습할거면 drop으로 지우고 해야함
//////////////////////////////////////////////////////////////////


    【 sungjuk0 테이블 삭제 】
drop table sungjuk0;


    【 sungjuk 테이블 생성 】
create table sungjuk(
    uname  varchar (50)  not null    -- not null : 빈값을 허용안한다는 제약조건 
                                     --            왠만하면 늘 달아줌 / 영문 50자, 한글 약 16자 가능
    ,kor   int           not null    -- int : 정수 / 소수점을 표현하려면 다른 자료형을 사용
    ,eng   int           not null
    ,mat   int           not null
    ,tot   int           null        -- null : 빈값 허용 제약조건 / 작성하지않아도 기본 설정되어있음
    ,aver  int 
);


    【 샘플 데이터 행 추가 】
insert into sungjuk(uname,kor,eng,mat) values ('홍길동',  70, 85, 100);
insert into sungjuk(uname,kor,eng,mat) values ('무궁화',  30, 30, 40);
insert into sungjuk(uname,kor,eng,mat) values ('진달래',  90, 90, 20);
insert into sungjuk(uname,kor,eng,mat) values ('개나리',  100, 60, 30);
insert into sungjuk(uname,kor,eng,mat) values ('라일락',  30, 80, 40);
insert into sungjuk(uname,kor,eng,mat) values ('봉선화',  80, 80, 20);
insert into sungjuk(uname,kor,eng,mat) values ('대한민국', 10, 65, 35);
insert into sungjuk(uname,kor,eng,mat) values ('해바라기', 30 ,80 ,40);
insert into sungjuk(uname,kor,eng,mat) values ('나팔꽃',  30, 80, 20);
insert into sungjuk(uname,kor,eng,mat) values ('대한민국', 100, 100, 100);


//////////////////////////////////////////////////////////////////
★ 데이터베이스는 정렬이 키워드다 입력순대로 정렬되는것이 아니라 개발자가 조정하는것! ★
//////////////////////////////////////////////////////////////////
-- select ~ from 은 짝꿍

    【 전체 레코드(행) 조회 】
select uname, kor, eng, mat, tot, aver 
from sungjuk;


    【 전체 레코드(행) 갯수(총 줄수) 조회 】
select count(*) from sungjuk;


    【 select  조회 및 검색 】
select kor, eng, mat from sungjuk;  -- 특정 칼럼만 조회 
select tot, aver from sungjuk;          
select * from sungjuk;              -- 모든 칼럼 조회 (*←만능문자)


    【 select - as : 칼럼명을 일시적으로 임의 변경 】
-- 물리적으로 지정해준 칼럼명을 일시적으로 임의 수정하여 사용할 수 있다. 
-- run할 당시에만 변경됨
-- 한글은 공부할때나 가능, 실무에선 안돼! : 한글은 일시적으로 분석해야할때만 추천
select uname as 이름, kor as 국어, eng as 영어, mat as 수학, tot as 총점, aver as 평균 
from sungjuk; 
-- as는 생략 가능 
select kor korea, eng englisg, mat math 
from sungjuk;


    【 count 함수 】Oracle에서 기본으로 제공되는 함수
select count(uname) from sungjuk;   
-- → 성적 테이블 안에 uname 칼럼안의 행의 총 갯수 
select count(kor) from sungjuk;
-- → table:sungjuk > calum:kor > total recode count  
select count(eng) as cut_eng from sungjuk;
-- → 성적 테이블 안에 eng 칼럼안의 행의 총 갯수를 담은 'count(uname)'라는 칼럼명을 
--    임시로(as사용) cut_eng로 변경해서 실행
select count(mat) 수학갯수 from sungjuk;
-- → 위와 동일 / as 생략 가능

select count(tot) from sungjuk;     -- 0
select count(aver) from sungjuk;    -- 0
-- null값은 count해주지 않아서 결과가 0으로 나옴
-- 함수 중 레코드 안에 null값을 특정 값으로 바꾼 후 계산해주는 함수도 있다.

select count(*) from sungjuk;
-- sungjuk 테이블의 전체 행의 갯수(null값이 있는 행까지 다 포함해서 알고싶다면)
-- 칼럼명대신 *(만능문자)를 적으면 된다.
select count(*) as 전체행갯수 from sungjuk;
select count(*) 전체행갯수 from sungjuk;

ｏ물리적 형태 테이블 : 실질적으로 존재 (개발자가 직접 작성해서 가공한 테이블)
ｏ논리적 형태 테이블 : 명령어에 의해 생긴 테이블 ex.count함수 실행시 나오는 테이블

//////////////////////////////////////////////////////////////////

    【 명령어 완료 및 취소 - sqlplus에서 필수사항】
    - commit    : 완료
    - rollback  : 취소
    : select는 조회라 안해도되지만 insert/update/delete같은 테이블에 영향이 가는 
      명령어는 commit(완료) / rollback(취소) 해야한다.
    ※ SQL Developer툴에서 자동커밋 설정해 놓을 수 있다 
        : 도구 → 환경설정 → 데이터베이스 → 객체뷰어 → 자동커밋설정
       
//////////////////////////////////////////////////////////////////
 
delete from sungjuk;
select*from sungjuk;
        
commit;          -- f11
rollback;        -- f12
        
        
        
        
        
        
        
        

      