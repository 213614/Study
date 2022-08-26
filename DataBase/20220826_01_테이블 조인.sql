-- 파일 → 새로만들기 → 데이터베이스 계층 → 데이터베이스 파일
-- i:\java202207\database\20220826_01_테이블 조인
-- 테이블은 오라클서버에 저장되므로 같은 이름으로 연습할거면 drop으로 지우고 해야함
///////////////////////////////////////////////////////////////////////////////////////////

    【 테이블 조인 】
        - join ~ on 명령어(SQL문)를 통해 만들어지는 논리적 테이블이다 
        - 여러개의 테이블을 하나의 테이블처럼 사용하는 것
        - 두개 이상의 테이블을 결합하여 데이터를 추출하는 기법
        - 두 테이블의 공통값을 이용하여 칼럼을 조합하는 수단
        - 연결고리 = PK, FK
        - ANSI(표준)SQL문                         --(Oracle DB, Maria DB에서 문법적 차이가 있음)
                select 칼럼명 
                from 테이블1 join 테이블2          -- 많이 한다고 좋은건 아님(정보가 많이 쪼개져있다는 뜻)
                on 조건절;                         -- ANSI(표준)SQL문
                                                  -- 테이블의 공통 칼럼 연결(ex. 학번, 교과목코드같은 PK-FK)
                
        - Oracle DB Join SQL문 
                select 칼럼명
                from 테이블1, 테이블2
                on 조건절;

        ex.     select T1.*, T2.*                 -- T1이 교집합 테이블(수강신청,예매,구매 등 장바구니)
                from T1 join T2                   
                on T1.x=T2.x;                     -- T1의 x칼럼과 T2의 x칼럼이 같다(조건)
                                                  -- 테이블명.칼럼명
                                    
        ex.     select T1.*, T2.*, T3.*           -- : *은 만능문자고 보고싶은 칼럼만 적어도 됨 
                from T1 join T2
                on T1.x = T2.x join T3            -- 3개의 테이블 조인
                on T1.y = T3.y
                
        ex.     select T1.*, T2.*, T3.*, T4.*
                from T1 join T2
                on T1.x = T2.x join T3
                on T1.y = T3.y join T4            -- 4개의 테이블 조인
                on T1.z = T4.Z; 
                
    【 조건절 】 
        ο where  
        ο having (group by)
        ο on     (join)

    【 물리적·논리적 테이블 】
        : 물리적 테이블과 논리적 테이블은 서로 동등한 관계이다
        
        ο 물리적 테이블 : 실제 create table한 테이블
        ο 논리적 테이블 : SQL문에 의해 가공된 테이블 (실제 create하지 않았음)
        
        ex. select*from tb_student;             : 물리적 테이블
            select count(*) from tb_student;    : 논리적 테이블
                      
//////////////////////////////////////////////////////////////////

    【 inner join 】

-- 학번을 기준으로 수강 테이블과 학생 테이블 조인 (inner join) : 가장 기본이된다
select tb_sugang.*, tb_student.* 
from tb_sugang join tb_student        -- 먼저 쓰는 테이블이 기준(교집합테이블)
        --    ↑ join앞에 inner말이 생략된 것 
-- = from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;

-- ↕ 결과값은 같다. 테이블간의 교집합 조인, inner 생략 가능
select tb_sugang.*, tb_student.* 
from tb_sugang inner join tb_student       
on tb_sugang.hakno = tb_student.hakno;

-- 수강신청한 학생들의 학번, 과목코드, 이름 이메일 조회
select tb_sugang.*, tb_student.uname,tb_student.email
from tb_sugang inner join tb_student       
on tb_sugang.hakno = tb_student.hakno;

-- 과목코드를 기준으로 수강테이블과 과목테이블 조인
select tb_sugang.*, tb_gwamok.gname,tb_gwamok.ghakjum
from tb_sugang join tb_gwamok      
on tb_sugang.gcode = tb_gwamok.gcode;

-- 3개 테이블 조인 : 수강테이블.* + 학생테이블.이름 + 과목테이블. 과목명
select tb_sugang.*, tb_student.uname, tb_gwamok.gname
from tb_sugang join tb_student       
on tb_sugang.hakno = tb_student.hakno join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;

-- 테이블 명 alias로 임시 변경 가능 (as랑 같음) : alias 적지 않고 그냥 뒤에 별칭을 붙이면 됨(적으면 오류남)
select SU.*, ST.uname, ST.email
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno;

select SU.*, GW.gname, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode;

select SU.*, ST.uname, ST.email, GW.gname, GW.ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
order by SU.hakno, SU.gcode;            -- 정렬 가능

-- 조회시 테이블간에 중복되지 않은 칼럼명은 테이블 명 생략 
-- = 한쪽 테이블에만 있는 칼럼은 테이블 명 생략 가능(한곳에만 있으니 구분할 필요X)
select SU.*, uname, email, gname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
order by SU.hakno, SU.gcode;

-- 공통된 칼럼(중복된 칼럼)은 소속 테이블 명을 정확히 명시해야한다. 안그러면 오류남(ORA-00918: 열의 정의가 애매합니다)
select gcode, hakno         --  SU.gcode, ST.hakno 이런식으로 정확히 명시해야한다.
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode; 

//////////////////////////////////////////////////////////////////

commit;

select*from tb_student;
select*from tb_gwamok;
select*from tb_sugang;

select count(*) from tb_student;        -- 6
select count(*) from tb_gwamok;         -- 9
select count(*) from tb_sugang;         -- 13

//////////////////////////////////////////////////////////////////
-- ★ 1~3번 제대로 다시 풀어보기 ★ 

-- Q1. 수강신청을 한 학생들 중에서 '제주'에 사는 학생들만 학번, 이름, 주소를 조회하시오
select SU.hakno, uname, email, address
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno
where ST.address = '제주';

-- 강사님 코드
-- 1) 수강신청한 학생들 목록 보기
select*from tb_sugang;
-- 2) 학생테이블에서 주소를 끌어오기위해 수강테이블과 조인
select SU.*, uname, address 
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno;
-- 3) '제주'만 조회하기
select SU.*, uname, address 
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno
where address = '제주';

-- 수강테이블 join 학생테이블으로 만든 논리적 테이블(칼럼4, 레코드10)
select SU.hakno, SU.gcode, uname, address       -- *를 자꾸 쓰면 자바 연동했을때 불편함(칼럼명이 가려져서)
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno;
-- ★ 가공된 논리적 테이블의 이름을 'AA'라고 지정하고 다시 재가공할 수 있다 ★
select AA.hakno, AA.gcode, AA.uname, AA.address         -- = AA.*
from (
        select SU.hakno, SU.gcode, uname, address       -- 칼럼명을 오픈해야하는 이유 : 논리적테이블을 재가공할때 내용을 보기 위해  
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno                          -- 세미콜론 조심
      ) AA
where  AA.address='제주';

-- !error! : ORA-00904: "AA"."EMAIL": 부적합한 식별자 : AA안에 ST.email이 없는데 AA.email을 셀렉해서 오류남
-- select AA.hakno, AA.gcode, AA.uname, AA.address, AA.email    
-- from (
--         select SU.hakno, SU.gcode, uname, address     
--         from tb_sugang SU join tb_student ST
--         on SU.hakno = ST.hakno                         
--       ) AA
-- where  AA.address='제주';

-- 논리테이블 별칭 생략 가능 = AA 생략 가능 / Join이 많아지면 헷갈리므로 적어놓는것
select hakno, gcode, uname, address                     -- 칼럼명이 노출된 상태에서(from안에) *는 가능
from (
        select SU.hakno, SU.gcode, uname, address     
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno                          
      ) 
where  address='제주';

─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─

-- Q2. 지역별로 수강신청 인원수, 지역을 조회하시오
--     서울 2명                  (형태만 참고)
--     제주 1명
-- 틀린코드 : 이러면 학번별로 몇개수강했는지 나옴 
-- select SU.hakno, address, count(*) cnt
-- from tb_sugang SU join tb_student ST
-- on SU.hakno = ST.hakno
-- group by SU.hakno, address; 
-- 아래 강사님 코드 참고해서 짠거 (정답코드)
-- 1) 수강신청 명단 조회
select hakno from tb_sugang group by hakno
-- 2) 학생 테이블과 조인 후 주소로 그룹화, 카운트 
select ST.address, count(*) || '명' as sugnan_cnt
from (
        select hakno from tb_sugang group by hakno
     ) AA join tb_student ST 
on AA.hakno = ST.hakno
group by ST.address;

-- 강사님 코드
-- 1) 수강신청한 학생들 명단(학번)
select distinct(hakno) from tb_sugang order by hakno;
-- = 
select hakno from tb_sugang group by hakno;     -- group by절은 기본적으로 order by를 가지고있다
-- 2) 수강신청한 학번명단(위 논리테이블)의 주소를 학생테이블에서 가져오기(join)
select AA.hakno, ST.address
from (
        select hakno from tb_sugang group by hakno
      ) AA join tb_student ST
on AA.hakno = ST.hakno;
-- 3) 위 논리 테이블을 새로운 BB테이블로 만들고 주소별로 그룹 후 행의 갯수 구하기(count)
select address, count(*) || '명' as cnt
from (
        select AA.hakno, ST.address
        from (
                select hakno from tb_sugang group by hakno
              ) AA join tb_student ST
        on AA.hakno = ST.hakno
) BB 
group by address;

-- 영은님 코드
-- 참조 : https://gent.tistory.com/274
select ST.address, count(distinct(ST.hakno)) || '명' cnt   -- 카운트(학번별로 중복값은 1개씩만) 
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno
group by address;

─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─

-- Q3. 과목별 수강 신청 인원수, 과목코드, 과목명를 조회하시오 
--     d001 HTML    2명         (형태만 참고)
--     d002 포토샵   1명
--     p001 OOP     2명
-- 1) 
select SU.gcode,SU.hakno, gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode;
-- 2)
select gcode, gname, count(*) || '명' as sugnan_cnt
from (
        select SU.gcode,SU.hakno, gname
        from tb_sugang SU join tb_gwamok GW
        on SU.gcode = GW.gcode
)
group by gcode, gname
order by gcode;

-- 강사님코드
-- 1) 수강 테이블 조회
select*from tb_sugang order by gcode;
-- 2) 수강 테이블에서 과목코드가 동일한 행 그룹
select gcode, count(*)
from tb_sugang
group by gcode;
-- 3) 2 결과를 AA테이블로 생성
select AA.gcode, GW.gname, concat(AA.cnt, '명')
from(
        select gcode, count(*) cnt
        from tb_sugang
        group by gcode
) AA join tb_gwamok GW
on AA.gcode = GW.gcode
order by AA.gcode;

─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─

-- Q4. 학번별 수강신청과목의 총학점을 학번별순으로 조회하시오
--     g1001  홍길동  9학점      (형태만 참고)
--     g1002  홍길동  6학점
--     g1005  진달래  9학점
select SU.hakno, ST.uname , sum(GW.ghakjum) || '학점' as tot_hakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
group by SU.hakno, ST.uname
order by SU.hakno;

-- 1) (논리테이블 join 방법)
select SU.hakno,SU.gcode, uname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;
-- 2)
select hakno, uname, sum(ghakjum) || '학점' as tot_hakjum
from (
        select SU.hakno,SU.gcode, uname, ghakjum
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno join tb_gwamok GW
        on SU.gcode = GW.gcode
)
group by hakno, uname       -- select에서 uname하려고 2차그룹화 : 어차피 학번이같으면 한사람임
order by hakno;

-- 강사님코드
-- 1) 수강 테이블에서 학번별로 조회
select hakno,gcode from tb_sugang order by hakno;

-- 2) 수강 테이블에 과목코드가 일치하는 학점을 과목 테이블에서 가져와서 join
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW 
on SU.gcode = GW.gcode;

-- 3) 2의 결과를 가지고 AA테이블 생성, 학번별 그룹화, 학점의 합계 구하기
select AA.hakno, sum(AA.ghakjum) as hap
from ( 
        select SU.hakno, SU.gcode, GW.ghakjum
        from tb_sugang SU join tb_gwamok GW 
        on SU.gcode = GW.gcode
) AA 
group by AA.hakno;

-- 4) 3의 결과를 가지고 BB테이블 생성, 학생 테이블과 조인해서 이름만 가져오기
select BB.hakno, ST.uname, concat(BB.hap,'학점') as hap      -- 안에서 sum했으니까 그냥 별칭으로 가져오면 됨
from (
        select AA.hakno, sum(AA.ghakjum) as hap
        from ( 
                select SU.hakno, SU.gcode, GW.ghakjum
                from tb_sugang SU join tb_gwamok GW 
                on SU.gcode = GW.gcode
        ) AA 
        group by AA.hakno
) BB join tb_student ST
on BB.hakno = ST.hakno
order by BB.hakno;

-- 강사님 코드 2 (다른 방법)
-- 1) 수강+학생+과목 3개 테이블 join
select SU.hakno, SU.gcode, uname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode

-- 2) 조건추가 
select SU.hakno, ST.uname , sum(GW.ghakjum) || '학점' as hap
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
group by SU.hakno, ST.uname
order by SU.hakno;

─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─

-- Q5. 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오
--     g1001  p001  OOP         (형태만 참고)
--     g1001  p003  JSP         : 학번을 변수처리하면 사용자가 로그인할때 아이디 학번값으로
--     g1001  d001  HTML        : 대입하면 각자의 수강정보를 볼수있게만들수있다
select SU.hakno,SU.gcode, gname
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
where SU.hakno = 'g1001'            -- 실제 자바랑 연동하면 학번은 변수처리 ↑
order by SU.gcode;
-- 논리테이블 join 방법 
select hakno, gcode, gname
from (
        select SU.hakno,SU.gcode, gname
        from tb_sugang SU join tb_student ST
                          on SU.hakno = ST.hakno join tb_gwamok GW
                                                 on SU.gcode = GW.gcode
)
where hakno = 'g1001'
order by gcode;

─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─

-- Q6. 수강신청을 한 학생들의 학번, 이름 조회
select SU.hakno, uname
from tb_sugang SU join tb_student ST 
                  on SU.hakno = ST.hakno
group by SU.hakno, uname
order by SU.hakno;

-- 강사님코드 (서브쿼리 사용)
-- 1) 수강신청을 한 학생들의 학번 조회
select distinct(hakno) from tb_sugang;          -- = group by hakno;

-- 2) 
select hakno, uname
from tb_student
where hakno in (select distinct(hakno) from tb_sugang);
-- = hakno = 'g1001' or hakno = 'g1002' or hakno = 'g1005' or hakno = 'g1006' ;
-- = hakno in ('g1001','g1002','g1005','g1006');

─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─

-- Q7. 수강신청을 하지 않은 학생들의 학번, 이름 조회

--구글링(테이블1과 테이블2의 칼럼 수가 맞아야해서 이름 출력 못함)
--select tb_student.hakno from tb_student
--minus
--select tb_sugang.hakno from tb_sugang

select ST.hakno, uname
from tb_student ST left outer join tb_sugang SU         -- left outer join : 왼쪽테이블 기준으로 차집합 
                   on ST.hakno = SU.hakno
where ST.hakno not in (select hakno from tb_sugang)     -- = (select distinct(hakno) from tb_sugang) 
order by ST.hakno;

-- 강사님코드 : ..테이블 조인도 필요없이 걍 서브쿼리.,,
select hakno, uname
from tb_student
where hakno not in (select distinct(hakno) from tb_sugang)
order by hakno;


















