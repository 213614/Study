-- 파일 → 새로만들기 → 데이터베이스 계층 → 데이터베이스 파일
-- i:\java202207\database\20220823_02_Oracle 함수
-- 테이블은 오라클서버에 저장되므로 같은 이름으로 연습할거면 drop으로 지우고 해야함
//////////////////////////////////////////////////////////////////

    【 Oracle 함수 】 : JS와 대부분 동일
        ο 문자열 함수 
              - 가상 테이블 dual : 실제로 존재하지 않지만 테이블 만드는 도중 중간중간
                                  결과를 확인할때 임시로 만들어주는 테이블(임시테이블)
                                  
           lower() : 괄호 안에있는 데이터를 전문 소문자로 바꿔줌
                ex. select lower('Hello World') from dual;        -- hello world
                
           upper() : 괄호 안 전부 대문자 
                ex. select upper('Hello World') from dual;        -- HELLO WORLD
                    
           length() : 괄호 안 글자 수 (공백문자 포함)
                ex. select length('Hello World') from dual;       -- 11
                
           substr('',n,m) : ' '안에 문자를 n ~ m번째까지만 잘라서 출력 
                            ※ 1번째부터 시작 (JS는 0번째부터였음)
                ex. select substr('Hello World', 1,5) from dual;  -- Hello 

           instr('n','m') : n문장 안에 m글자가 몇번째 글자인지 출력 
                ex. select instr('Hello World','W') from dual;    -- 7

           lpad('n',m,'o') : n문자열을 m칸내에서 출력하고 왼쪽 빈칸은 o로 채운다     
                ex. select lpad('SKY', 5, '*') from dual;         -- **SKY

           rpad('n',m,'o') : n문자열을 m칸내에서 출력하고 오른쪽 빈칸은 o로 채운다
                ex. select rpad('SKY', 5, '*') from dual;         -- SKY**

           replace ('n', 'm', 'o') : n문자열에 m이라는 글자를 o로 변환(특정 문자 변환)
                ex. select replace('happy', 'p', 'k') from dual;  -- hakky
                
           ASCII문자 변환(아스키 문자) : 십진수를 기반으로 영문 알파벳을 사용하는 문자 인코딩
                select chr(65) from dual;       -- A                      
                select chr(66) from dual;       -- B           
                select chr(97) from dual;       -- a
                select chr(98) from dual;       -- b 
    
           concat('n','m') : 괄호 안 문자열 연결하기 
                ex. select concat('로미오','줄리엣') from dual;     -- 로미오줄리엣
                ex. select concat(uname,'의 평균은'), concat(aver,'입니다.') from sungjuk;
                    --→ 칼럼이랑도 조합 가능 / 결과값: 솔데스크의 평균은 90입니다. 

           || 결합 연산자 : 칼럼명 || '' = 칼럼명 뒤에 ' '을 결합해주세요 
                ex. select uname || '의 평균은' || aver || '입니다.' from sungjuk;   
                                                             -- 솔데스크의 평균은90입니다.
                                                             -- 하나의 칼럼안에 한 문장으로 나옴
                    select uname || '의 평균은' || aver || '입니다.' as str from sungjuk;
                                                             -- 칼럼명을 str로 변경 
                                                             -- str칼럼 안에 솔데스크의 평균은90입니다.
            
        ο 숫자 관련 함수
        
           round(n,m) : n수(실수)를 소수점 반올림 후 m번째까지 출력 (m=0이면 정수만 출력)
                ex. select round(7.221, 1) from dual;   -- 7.2
                
           abs() : 괄호 안의 절대값을 구해줌
                ex. select abs(-7) from dual;           -- 7
                
           mod(n,m) : n÷m의 나머지 연산자 (JS에서 % 나머지 연산자)
                 ex. select mod(5, 3) from dual;        -- 2    
                
           ceil() : 괄호 안의 실수 소수점 올림 
                 ex. select ceil(12.4) from dual;       -- 13
                
           trunc(n, m) : 괄호 안의 n(실수) 소수점 내리고 m번째 자리까지 출력 (m=0은 소수점 없이 정수만 출력)
                 ex. select trunc(13.56, 1) from dual;
   
-- 연습              
select avg(kor)           from sungjuk;         -- 66.36363636363636363636363636363636363636
select ceil(avg(kor))     from sungjuk;         -- 67
select trunc(avg(kor), 2) from sungjuk;         -- 66.36
select round(avg(kor), 2) from sungjuk;         -- 66.36

           to_number('숫자형태의 문자열') : 괄호 안 숫자형태의 문자열(ex.'2')를 숫자형 데이터로 변환
                 ex. select to_number('123')+1 from dual;       -- 124
                     select '100'+1 from dual;                  -- 100 
                     -- ''안에 숫자형 문자가 써있으면 자동으로 to_number함수를 호출하기때문에 조심!
                    
        ο 날짜 관련 함수
        
           sysdate : 시스템의 현재 날짜 및 시간정보를 리턴하는 함수  (JS에서 date객체)     
                 ex. select sysdate from dual;      -- 22/08/23
                     
           extract(n from m) : m에서 n데이터를 추출 
                 ex. sysdate에서 년/월/일 추출
                     select extract(year  from sysdate) from dual;   -- 2022
                     select extract(month from sysdate) from dual;   -- 8
                     select extract(day   from sysdate) from dual;   -- 23
                            --       ↑ 일을 뽑는건 date가 아니라 day니까 조심
                     
                     -- 날짜 데이터의 연산
                     select sysdate+100 from dual;  -- 22/12/01 : 현재 시스템 날짜에서 100일 후 
                     select sysdate-100 from dual;  -- 22/05/15 : 현재 시스템 날짜에서 100일 전         
        
                     -- 두 날짜 사이의 개월수 계산
                     select months_between(sysdate+100, sysdate-100) from dual;
                                                    -- 6.5483870967741935483870967741935483871
                     select months_between('2022/08/23', '2022/05/15') from dual;                               
                                                    -- 3.25806451612903225806451612903225806452
                     select months_between('2022/08/23', '2022/12/01') from dual;                                                       
                                                    -- -3.29032258064516129032258064516129032258
                                                    
           to_date('') : 괄호 안 숫자형태 문자열을 날짜형 데이터로 변환                                           
                 ex. select to_date('2022/10/25') from dual;     
                                                    -- 22/10/25
                     select to_date('2022/10/25') - to_date('2022/10/30') from dual;
                                                    -- -5 (연산도 가능) 

//////////////////////////////////////////////////////////////////

    【 nvl() 함수 】 : mariaDB에선 ifnull()
        : null값이 있을 경우 null값을 다른 값으로 바꿔줌    ＊자주 사용함＊
        형식:  nvl(값, 지정값) : select안에서 사용 
        
        
-- 주소가 'Incheon'인 행의 국어점수 최대값, 인원수을 조회하시오
select nvl(max(kor),0) as kor_max, count(*) cnt
--     → 국어 최대값이 null값이면 0을 대입한다 (인천지역자체가 없으므로 null값이 나올수밖에없음)
--     → 0 자리에 문자열 안됨 
from sungjuk
where addr='Incheon';

-- 강사님 코드
select max(kor), count(*)       -- 최대값(null), 인원수(0)
from sungjuk
where addr='Incheon';

select count(*)+1               -- 0+1 = 1 
from sungjuk
where addr='Incheon';

select max(kor)+1               -- null+1 = (null) → null값은 연산 불가
from sungjuk
where addr='Incheon';

select nvl(max(kor),0)          -- 0 : null값이면 0으로 대체           
from sungjuk
where addr='Incheon';

select nvl(max(kor),0)+1 as max_kor   -- 0+1 = 1            
from sungjuk
where addr='Incheon';

-- 방법론적) 일련번호 snum칼럼의 max값에 +1을 다시 일련번호로 넣어주면 시퀀스처럼 사용할 수 있다
--          그럴때 nvl()를 사용한다

//////////////////////////////////////////////////////////////////

    【 모조 칼럼 】 : 진짜가 아니지만 진짜처럼 쓸 수 있는 칼럼   
        
        ο rownum : 행번호  (＊자주사용＊)
                    
        ο rowid  : 행의 주소값
        
        → 보이지 않지만(물리적으로 만든건 아니지만) 시스템적으로 구성되어 있음 select에 적으면 나타남 
        → 데이터별로 겹치지않는 유일성을 가지고 있으므로 잘 활용할 수 있다
        → 그때그때마다 다른 값으로 나올 수도 있다 
        
        
select snum, uname, addr, rownum, rowid        
from sungjuk;
-- snum(일련번호칼럼)은 필요에 의해 넣은것으로 rownum과 비교하면 안됨

select snum, uname, addr, rownum 
from sungjuk
where rownum>=1 and rownum<=5;
-- rownum이 1 이상 5 이하인 행들만 조회 : 연산자(and/or···.)들과 함께 사용 가능 

select snum, uname, addr, rownum 
from sungjuk
where addr='Seoul';
-- rownum은 현재 조회한 테이블의 행번호를 붙여줄뿐이다. (4개를 조회하면 1~4번으로 나오는 식)
-- 그러니 일련번호(고정값)이랑은 다르다 : 일련번호(snum)는 조건에 맞춰 뽑으면 해당 번호로 나옴
    
select snum, uname, addr, rownum 
from sungjuk
order by uname;
-- order by랑 rownum이 붙으면 원래 가지는 행값이 함께 정렬되므로 순서대로 붙지 않고 뒤죽박죽이 된다
-- = 자신의 행 번호(rownum)을 포함하여 정렬되므로 rownum을 추가하는 시점도 고려해야한다 
    


    
    
    
    