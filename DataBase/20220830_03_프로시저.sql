-- 파일 → 새로만들기 → 데이터베이스 계층 → 데이터베이스 파일
-- i:\java202207\database\20220830_03_프로시저.sql
-- 테이블은 오라클서버에 저장되므로 같은 이름으로 연습할거면 drop으로 지우고 해야함
///////////////////////////////////////////////////////////////////////////////////////////

    【 PL/SQL (Procedural Language) 프로시저 】
        - 절차적인 데이터베이스 프로그래밍 언어
        ο 변수, 조건문, 반복문
        
        --콘솔창 출력하기 위한 사전 준비작업
        set serveroutput on;

    【 PL/SQL 기본 문법 】        
        ο 변수 선언
            declare
                -- 변수 선언
                a number := 3;          -- 변수명(a) 변수데이터타입(num) 대입연산자(:=) 값(3); 
                b number := 5;
            begin
                -- 콘솔창 출력
                dbms_output.put_line('*실행 결과*');
                dbms_output.put_line(a);
                dbms_output.put_line(b);
                dbms_output.put_line(a+b);
                -- 결합 연산자 ||
                dbms_output.put_line(a || '+' || b || '=' || (a+b));
            end;
        
        ο 조건문  (if문)
            declare
                -- 성적 프로그램  nvarchar2
                uname varchar2(50) := '무궁화';
                kor   number       := 100;
                eng   number       := 95;
                mat   number       := 80;
                aver  number       := (kor+eng+mat)/3;
                grade varchar2(10) := null;
            begin
                if    aver >= 90 then grade := 'A';
                elsif aver >= 80 then grade := 'B';      -- else if말고 elsif라고 작성해야한다
                elsif aver >= 70 then grade := 'C';
                elsif aver >= 60 then grade := 'D';
                else  grade := 'F';
                end if;     -- if문 닫는거 필수★ 
                
                -- 출력
                dbms_output.put_line('*실행 결과*');
                dbms_output.put_line('이름 : ' || uname);
                dbms_output.put_line('국어 : ' || kor);
                dbms_output.put_line('영어 : ' || eng);
                dbms_output.put_line('수학 : ' || mat);
                dbms_output.put_line('평균 : ' || round(aver,2));
                dbms_output.put_line('학점 : ' || grade);               
            end;
 
        ο 반복문  (for문)
            declare
                -- 구구단 출력
                dan number := 4;
                i   number default 0;
            begin
                while i<10 loop
                    i := i+1;
                    exit when i = 10;
                    dbms_output.put_line(dan || '*' || i || '=' || (dan*i));
                end loop;       -- loop문 닫는거 필수★ 
            end;
            
///////////////////////////////////////////////////////////////////////////////////////////            

    【 테이블과 프로시저 연결 】 
        ο sungjuk 테이블 관련 프로시저
            
select*from sungjuk order by snum desc;
select*from sungjuk where snum = 5;

-- 프로시저를 이용해서 snum = 5 행을 조회하시오
declare 
    v_snum  number;
    v_uname varchar2(50);
    v_kor   number;
    v_eng   number;
    v_mat   number;
    v_addr  varchar2(30);
    v_wdate date;
    v_juso  varchar2(30);       -- 한글주소    
begin
    -- SQL문 작성
    select snum, uname, kor, eng, mat, addr, wdate 
    into v_snum, v_uname, v_kor, v_eng, v_mat, v_addr, v_wdate  -- 프로시저 결과값을 변수에 저장
    from sungjuk 
    where snum = 5;
    
    if      v_addr = 'Seoul' then v_juso := '서울';
    elsif   v_addr = 'Jeju'  then v_juso := '제주도';
    elsif   v_addr = 'Suwon' then v_juso := '수원';
    elsif   v_addr = 'Busan' then v_juso := '부산';
    end if;
    
    -- 출력
    dbms_output.put_line('*실행 결과*');
    dbms_output.put_line('번호 : ' || v_snum);
    dbms_output.put_line('이름 : ' || v_uname);
    dbms_output.put_line('국어 : ' || v_kor);
    dbms_output.put_line('영어 : ' || v_eng);
    dbms_output.put_line('수학 : ' || v_mat);
    dbms_output.put_line('주소 : ' || v_addr);
    dbms_output.put_line('주소 : ' || v_juso);
    dbms_output.put_line('작성일 : ' || v_wdate);
end;
        
///////////////////////////////////////////////////////////////////////////////////////////            
        
        ο 프로시저 생성        
            create or replace  procedure 프로시저명

        ο 프로시저 삭제
            drop  procedure 프로시저명

        ο 프로시저 호출
            execute 프로시저명
        
〈 sp_test 프로시저 연습 〉

-- sp_test 프로시저 생성
create or replace procedure sp_test
is
begin
    dbms_output.put_line('sp_test 프로시저 호출');
end;

-- sp_test 프로시저 호출 
execute sp_test;

-- sp_test 프로시저 삭제
drop procedure sp_test;
        
        