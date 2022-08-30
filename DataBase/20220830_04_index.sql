-- 파일 → 새로만들기 → 데이터베이스 계층 → 데이터베이스 파일
-- i:\java202207\database\20220830_04_index.sql
-- 테이블은 오라클서버에 저장되므로 같은 이름으로 연습할거면 drop으로 지우고 해야함
///////////////////////////////////////////////////////////////////////////////////////////

    【 index 색인 】        
        - 더 빠른 검색을 위한 인덱스
        - 데이터를 빠르게 찾을 수 있는 수단
        - 테이블에 대한 조회 속도를 높여 주는 자료구도
        - PK칼럼은 자동으로 인덱스 생성
        
        - where조건절에 자주 사용하는 칼럼은 index 해놓는다

        - ex. 50메가 = 실제 데이터 저장 80 + 인덱스 등등 20 (or 7:3)

    【 index 방식 】    
        ο full scan
            처음부터 끝까지 일일이 검사하는 방법. 전수조사        
    
        ο index range scan
            이름이 여러개인 경우 목차를 찾아서 페이지를 찾아감
            훨씬 빠름. 별도의 메모리가 있어야 함.
    
        ο index unique scan
            학번은 1개만 존재함. 유일한 값
            
        ο index 생성            
            create index 인덱스명 on 테이블명(칼럼명)
  
        ο 인덱스 삭제
            drop index 인덱스명           
            
///////////////////////////////////////////////////////////////////////////////////////////

 〈 PK가 없는 테이블 〉
 
--테이블생성
create table emp2(
  id        number(5)    
  ,name     varchar2(25)
  ,salary   number(7, 2)
  ,phone    varchar2(15)
  ,dept_id  number(7)
);
--행추가 
insert into emp2(id,name) values (10,'kim');
insert into emp2(id,name) values (20,'park');
insert into emp2(id,name) values (30,'hong');
commit;
            
-- 인덱스 생성 전      
-- f10 계획설명보기 → full scan, cost 2
select*from emp2 where name='hong';     -- sql문안에 커서 놓고 f10

-- 인덱스 생성 후 (색인 페이지가 별도로 생성됨)
create index emp2_name_idx on emp2(name);       -- index 생성
drop   index emp2_name_idx on emp2(name);       -- index 삭제

-- f10 계획설명보기 → full scan, cost 2 : 데이터 양이 적어서 cost 비슷하게 나옴 원래는 인덱스가 훨씬 빠름
select*from emp2 where name='kim';      -- sql문안에 커서 놓고 f10

─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─

 〈 PK가 있는 테이블 〉
 
-- PK는 인덱스가 자동으로 생성되면서 정렬된다
create table emp3 (
    no      number        primary key
    ,name   varchar2(10)
    ,sal    number
);

-- f10 계획설명보기 → full scan, cost 1
select*from emp3 where no=3;

─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─

-- 100만건의 레코드 대상으로 cost 비교
create table emp4(
   no     number
  ,name   varchar2(10)
  ,sal    number
);

drop table emp4;

-- 프로시저를 이용하여 100만행 추가 =========================================================
declare -- 선언문
    -- 변수선언
    i      number       := 1;
    name   varchar(20)  := 'kim';
    sal    number       := 0;
begin
    -- T-SQL문
    while i<=1000000 loop
        if    i mod 2 = 0 then name := 'kim'  || to_char(i); 
                               sal  := 300;
        elsif i mod 3 = 0 then name := 'park' || to_char(i);
                               sal  := 400;
        elsif i mod 5 = 0 then name := 'hong' || to_char(i);
                               sal  := 500;
        else                   name := 'shin' || to_char(i);
                               sal  := 250;
        end if;
        
        insert into emp4(no, name, sal) values (i, name, sal);      -- 행 추가 반복 
        i := i+1;   -- 없으면 무한반복걸리니까 잘 확인
    end loop;                                        
end;
--========================================================================================

commit;

select count(*) from emp4;
select*from emp4;

rollback;


-- 1) 인덱스를 사용하지 않은 경우
select * from emp4 where name='kim466';
--→ FULL scan, cost 904

select * from emp4 where no=466;
--→ FULL scan, cost 903

select * from emp4 where sal>300;
--→ FULL scan, cost 906

-- 2) 인덱스를 사용한 경우
--☞ name칼럼 기준으로 인덱스 생성
create index emp4_name_idx on emp4(name);

select * from emp4 where name='kim466';
--→ RANGE scan, cost 3

--☞ name,sal칼럼으로 인덱스 생성(두가지 한번에 가능)
create index emp4_name_sal_idx on emp4(name, sal);

select * from emp4 where name='kim466' and sal>200;
--→ RANGE scan, cost 3

--☞ no 칼럼 기준으로 인덱스 생성
create index emp4_no_idx on emp4(no);

select * from emp4 where no=466;
--→ RANGE scan, cost 3

///////////////////////////////////////////////////////////////////////////////////////////

        ο 인덱스 데이터 사전
               select*from user_indexes;
            
         ex.   select*from user_indexes where index_name like 'EMP4%';








