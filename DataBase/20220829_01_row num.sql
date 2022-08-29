-- 파일 → 새로만들기 → 데이터베이스 계층 → 데이터베이스 파일
-- i:\java202207\database\20220829_01_row num.sql
-- 테이블은 오라클서버에 저장되므로 같은 이름으로 연습할거면 drop으로 지우고 해야함
///////////////////////////////////////////////////////////////////////////////////////////

    【 모조 칼럼 】
        - Oracle DBMS에서 기본 제공 
        - 유일성을 가진다. (중복되지X)
        - 페이징(paging) : 한 화면에서 보여주는 데이터의 범위를 결정하는 일련의 방법
                           (모든 정보를 한번에 보여주지 않음)
            ex. 유튜브·네이버 댓글 : 더보기버튼을 통해 데이터를 일정량만 보여준다. (15게-더보기-30개 이런식)
            
            공감순,최신순,과거순···. : order by key값;
                → 칼럼이 있어야함 ex. 최신순 - 글의 날짜값이 저장된 칼럼 desc 
        
        ο rownum 행 번호＊ (페이징 작업시 활용함)
            select uname, address, rownum from tb_student;

        ο rowid 행 주소값 
            select uname, address, rowid from tb_student;

///////////////////////////////////////////////////////////////////////////////////////////

    【 rownum 】
        - 논리적 칼럼이지만 물리적으로 사용 가능
        
-- 줄 번호
select hakno, uname, rownum from tb_student;

-- 줄 번호에 별칭 부여하기
select hakno, uname, rownum as rnum from tb_student;

-- 정렬하면 원래 가지고있는 줄 번호값도 같이 정렬됨 (정렬 후 행번호가 부여되는것이 아님)
select hakno, uname, rownum as rnum from tb_student order by uname;

-- 줄 번호 1~3만 사이만 조회 (rownum + where조건절)
select hakno, uname, rownum from tb_student where rownum between 1 and 3;
                                            -- rownum>=1 and rownum<=3;
                                            
-- 줄 번호 4~6만 조회 : 조회 안됨 (rownum의 사용 위치가 중요) : 이런걸로 페이징하면 조회 안됨
select hakno, uname, rownum from tb_student where rownum between 4 and 6;
                                            -- rownum>=4 and rownum<=6;
                                            
///////////////////////////////////////////////////////////////////////////////////////////

    【 Oracle DB rownum paging 】
        - rownum은 모조 칼럼이기 때문에 조건절에 직접 사용하지 말고, ＊실제 칼럼으로 인식을 먼저 시킨 후＊ 
          그 다음에 사용할 것을 추천한다. 
        ★ rownum 칼럼은 셀프 join후에 줄 번호를 추가하고 조건절에 활용한다.
          
-- 예제1. 줄 번호(rownum)을 이용하여 줄 번호 4~6행 조회
-- 1) 이름 순 조회   : 줄 번호까지 함께 정렬 : 뒤죽박죽
select hakno, uname, rownum as rnum 
from tb_student 
order by uname;
-- 2) 다른 칼럼 정렬 후 AA 논리테이블 생성 후 줄 번호(rownum) 붙이기 : 1의 결과(rownum빼고)를 셀프조인 후 줄번호 추가
select hakno, uname, address
from tb_student 
order by uname;

select hakno, uname, address, rownum as rnum
from (
        select hakno, uname, address
        from tb_student 
        order by uname
)AA;
-- 3) 2의 결과를 BB 논리테이블 생성 후(self join) where 조건절 붙여서 4~6행 조회하기
select *
from (
        select hakno, uname, address, rownum as rnum
        from (
                select hakno, uname, address
                from tb_student 
                order by uname
        )AA
)BB
where rnum between 4 and 6;              -- = rnum>=4 and rnum<=6;
-- 4) 테이블 별칭 생략
select *
from (
        select hakno, uname, address, rownum as rnum
        from (
                select hakno, uname, address
                from tb_student 
                order by uname
        )
)
where rnum between 4 and 6;   
