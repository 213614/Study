-- 파일 → 새로만들기 → 데이터베이스 계층 → 데이터베이스 파일
-- i:\java202207\database\0220822_02_시퀀스
-- 테이블은 오라클서버에 저장되므로 같은 이름으로 연습할거면 drop으로 지우고 해야함
//////////////////////////////////////////////////////////////////

    【 자동으로 일련번호 부여 】
        : 데이터를 테이블에 인서트시 필요에 따라 번호를 부여할 수 있음
          (특정 칼럼에 일련번호 부여 : 번호끼리 동일한 값이 안나오게 조심)
          ex. 어떠한 행을 특정하기 위해 일련 번호를 부여한다 
          
          - Oracle DB : sequence 생성
          - Maria,MySQL 등 M으로 시작하는 DB : identity 생성
          
          : 대체적으로 한번 쓴 일련번호는 재사용하지 않는다(원하다면 옵션에서 설정)
          : = 삭제된 일련번호는 비우고 생성된다. (ex. 3을 지웠다고 다시 그 3으로 번호가 재정렬되지않음)
          
    【 숫자(대부분 정수)/문자열/날짜 : DB에서 주로 다루는 데이터들 】
    
//////////////////////////////////////////////////////////////////

-- 'sungjuk' 테이블 삭제
drop table sungjuk;
commit;

-- 'sungjuk' 테이블 생성
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

//////////////////////////////////////////////////////////////////

-- 행 추가 test
insert into sungjuk(snum, uname, kor, eng, mat, addr, wdate)
values (1, '홍길동', 89, 85, 90, 'Seoul', '2022/08/22' );  -- → 날짜형 데이터는 문자열 형태로 표현
--      ↑ 시퀀스를 이용해서 자동으로 넣어 줄 수 있음  ↑ 일일히할때는 문자열이지만 자동 date함수 쓸수있음
--                                                  : 현재 시스템의 시간에 맞춰줌 (js에서 date객체와 같은 기능)

-- 기존 레코드 전체 삭제
delete from sungjuk;
commit;

//////////////////////////////////////////////////////////////////

    【 시퀀스 sequence 】
        - 일련번호 자동 생성
        - 시퀀스 생성 명령어
            create sequence 시퀀스명;
            -- 옵션들은 생성 시퀀스명 이후로 차례대로 추가한다
            -- (옵션으로 따로 지정하지 않으면 시작값은 1씩해서 오름차순으로 간다)
            increment by 증가값 start with 시작값; 
            
        - 시퀀스 삭제 명령어
            drop sequence 시퀀스명;
        
-- 'sungjuk'테이블에서 사용할 시퀀스 생성
create sequence sungjuk_seq;

-- 'sungjuk'테이블에서 사용할 시퀀스 삭제
drop sequence sungjuk_seq;

-- 시퀀스를 이용해서 일련번호 행추가 
insert into sungjuk(snum, uname, kor, eng, mat, addr, wdate)
values (sungjuk_seq.nextval, '홍길동', 89, 85, 90, 'Seoul', '2022/08/22' );
                   -- ↑ 괄호가 없는 함수 

select*from sungjuk;

//////////////////////////////////////////////////////////////////

    【 sysdate 함수 】 
        - 괄호 없는 함수
        - 시스템의 현재 날짜정보를 가져온다
        ※ 문자열로 작성하는 것이 아님! 
        
insert into sungjuk(snum, uname, kor, eng, mat, addr, wdate)
values (sungjuk_seq.nextval, '홍길동', 89, 85, 90, 'Seoul', sysdate);

//////////////////////////////////////////////////////////////////

-- Q. snum이 2번인 행 삭제 
delete
from sungjuk
where snum=2;






