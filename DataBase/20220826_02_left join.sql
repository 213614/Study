-- 파일 → 새로만들기 → 데이터베이스 계층 → 데이터베이스 파일
-- i:\java202207\database\20220826_02_left join.sql
-- 테이블은 오라클서버에 저장되므로 같은 이름으로 연습할거면 drop으로 지우고 해야함
///////////////////////////////////////////////////////////////////////////////////////////

    【 테이블 조인의 종류 】
        ο inner join
            ㆍ 두 테이블에 공통으로 존재하는 칼럼을 이용하는 방식
            ㆍ inner 생략가능
            ㆍ 기본

        ο left outer join
            ㆍ 왼쪽 테이블의 모든 데이터와 오른쪽 테이블의 동일 데이터를 추출
            ㆍ outer 생략가능

        ο right outer join
           ㆍ 오른쪽 테이블의 모든 데이터와 왼쪽 테이블의 동일 데이터를 추출
           ㆍ outer 생략가능
           
///////////////////////////////////////////////////////////////////////////////////////////

    〈 left join / right join 연습〉
    
        ex. 학생 테이블의 모든 행을 가져오고, 수강 테이블에서 학번이 일치하는 행만 가져오기(null값으로 뜸)
                select ST.*, SU.*
                from tb_student ST left join tb_sugang SU
                                   on ST.hakno = SU.hakno;

-- Q1. left join를 이용해서 수강신청을 하지 않은 학번, 이름, 과목코드 조회하시오
select ST.hakno, uname
from tb_student ST left outer join tb_sugang SU      
                   on ST.hakno = SU.hakno
where ST.hakno not in (select hakno from tb_sugang)  
order by ST.hakno;

-- 강사님 코드
select SU.hakno, uname, SU.hakno, SU.gcode
from tb_student ST left join tb_sugang SU    
                   on ST.hakno = SU.hakno
where SU.hakno is null;

─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─

-- Q2. right join를 이용해서 수강신청을 하지 않은 학번, 이름, 과목코드 조회하시오
select ST.hakno, uname
from tb_sugang SU  right outer join tb_student ST     
                   on ST.hakno = SU.hakno
where ST.hakno not in (select hakno from tb_sugang)  
order by ST.hakno;

-- 강사님 코드
select SU.hakno, uname, SU.hakno, SU.gcode
from tb_sugang SU  right outer join tb_student ST     
                   on ST.hakno = SU.hakno
where SU.hakno is null;

///////////////////////////////////////////////////////////////////////////////////////////

       【 (+)기호를 이용한 테이블 조인 】
                : (+)기호는 일치되지 않는 행이 존재하는 않은 쪽에 붙인다
                : join대신 콤마 사용 
                
select ST.hakno, ST.uname, SU.gcode, SU.hakno
from tb_student ST, tb_sugang SU
where ST.hakno = SU.hakno(+);       -- left join

select ST.hakno, ST.uname, SU.gcode, SU.hakno
from tb_sugang SU, tb_student ST
where SU.hakno(+) = ST.hakno;       -- right join
                

                
                
                
                
                
                