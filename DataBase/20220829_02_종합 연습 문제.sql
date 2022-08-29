-- 파일 → 새로만들기 → 데이터베이스 계층 → 데이터베이스 파일
-- i:\java202207\database\20220829_02_종합 연습 문제.sql
-- 테이블은 오라클서버에 저장되므로 같은 이름으로 연습할거면 drop으로 지우고 해야함
///////////////////////////////////////////////////////////////////////////////////////////
select count(*) from tb_student;        -- 6
select count(*) from tb_sugang;         -- 14
select count(*) from tb_gwamok;         -- 9
///////////////////////////////////////////////////////////////////////////////////////////

-- Q1. 디자인 교과목중에서 학점이 제일 많은 교과목을 수강신청한 명단을 조회하시오
--    (학번, 이름, 과목코드)
--     g1005, 진달래, d002 
-- 1) 디자인 교과목 중 최고 학점 교과목 조회                                                      
select max(ghakjum) from tb_gwamok where gcode like 'd%'
-- 2) 학생 + 수강 + 과목 테이블 조인 후 조건에 맞게 조회 
select ST.hakno, uname, SU.gcode
from tb_student ST join tb_sugang SU
                   on ST.hakno = SU.hakno join tb_gwamok GW
                                          on SU.gcode = GW.gcode
where ghakjum = (select max(ghakjum) from tb_gwamok where gcode like 'd%')
      and GW.gcode like 'd%';
                                
-- 강사님 코드
-- 1) 디자인 교과목 학점 조회
select * from tb_gwamok where gcode like 'd%' order by ghakjum desc;
-- 2) 디자인 교과목 중 학점이 제일 높은 교과목 조회
select max(ghakjum) from tb_gwamok where gcode like 'd%';      -- 5 
-- 3) 2의 결과에서 나온 학점(5학점)과 동일한 학점을 가지고 있는 행에서 과목코드 조회
--    = 디자인 교과목 중 학점이 제일 높은 과목코드 조회(단, 중복된 학점이 없다는 조건)
select gcode from tb_gwamok 
where ghakjum = (select max(ghakjum) from tb_gwamok where gcode like 'd%')
      and gcode like 'd%';          -- d002
-- 4) 3의 결과에서 나온 과목코드(d002)를 수강신청한 학생의 명단 조회
select gcode, hakno
from tb_sugang 
where gcode = (
               select gcode from tb_gwamok 
               where ghakjum = (select max(ghakjum) from tb_gwamok where gcode like 'd%')
               and gcode like 'd%'
               );
-- 5) 4의 결과를 AA라는 테이블로 만든 후 학생 테이블과 조인, 이름까지 조회하기
select gcode, AA.hakno, ST.uname
from (
        select gcode, hakno
        from tb_sugang 
        where gcode = (
                       select gcode from tb_gwamok 
                       where ghakjum = (select max(ghakjum) from tb_gwamok where gcode like 'd%')
                       and gcode like 'd%'
                       )
)AA join tb_student ST
    on AA.hakno = ST.hakno;


─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─


-- Q2. 학번별 수강신청한 총학점을 구하고 학번별 정렬해서 줄번호 4~6행 조회하시오
--    (단, 수강신청하지 않은 학생의 총학점도 0으로 표시) : nvl() / left join
--     g1004, 0, 4
--     g1005, 12, 5
--     g1006, 3, 6
-- =  학번별 수강신청 한 학생들의 총학점(수강신청 하지 않은 학생의 학점은 0으로 처리)

-- 1) 학생 + 수강테이블 left join 후 전체 학생 및 수강신청, 과목 조회
select distinct(ST.hakno), uname, SU.gcode
from tb_student ST left join tb_sugang SU
                   on ST.hakno = SU.hakno
order by ST.hakno;
-- 2) 1의 결과에서 과목테이블 left join 후 학번, 교과목코드, 학점에 null값을 0으로 대체해서 조회
select hakno, AA.gcode, nvl(GW.ghakjum,0) as hakjum
from (
        select distinct(ST.hakno), uname, SU.gcode
        from tb_student ST left join tb_sugang SU
                           on ST.hakno = SU.hakno
        order by ST.hakno
) AA left join tb_gwamok GW
     on AA.gcode = GW.gcode
-- 3) 2의 결과에 학번별 학점 총합, 학번순 정렬 
select hakno, sum(hakjum) as tot
from (
        select hakno, AA.gcode, nvl(GW.ghakjum,0) as hakjum
        from (
                select distinct(ST.hakno), uname, SU.gcode
                from tb_student ST left join tb_sugang SU
                                   on ST.hakno = SU.hakno
                order by ST.hakno
        ) AA left join tb_gwamok GW
             on AA.gcode = GW.gcode
)
group by hakno
order by hakno;
-- 4) 3의 결과에 줄 번호 붙이기 
select hakno, tot, rownum as rnum
from (
        select hakno, sum(hakjum) as tot
        from (
                select hakno, AA.gcode, nvl(GW.ghakjum,0) as hakjum
                from (
                        select distinct(ST.hakno), uname, SU.gcode
                        from tb_student ST left join tb_sugang SU
                                           on ST.hakno = SU.hakno
                        order by ST.hakno
                ) AA left join tb_gwamok GW
                     on AA.gcode = GW.gcode
        )
        group by hakno
        order by hakno
);
-- 5) 줄 번호 4~6사이만 조회
select * 
from(
        select hakno, tot, rownum as rnum
        from (
                select hakno, sum(hakjum) as tot
                from (
                        select hakno, AA.gcode, nvl(GW.ghakjum,0) as hakjum
                        from (
                                select distinct(ST.hakno), uname, SU.gcode
                                from tb_student ST left join tb_sugang SU
                                                   on ST.hakno = SU.hakno
                                order by ST.hakno
                        ) AA left join tb_gwamok GW
                             on AA.gcode = GW.gcode
                )
                group by hakno
                order by hakno
        )
)
where rnum between 4 and 6;

--------------------------------------↕ 같은 결과인데 위 1~2단계 줄이기 

-- 1) 테이블 세개 left join 후 학점(nu11은 0으로 대체), 학번, 이름, 과목명, 과목코드 조회, 학번 순 정렬
select ST.hakno, uname, gname, GW.gcode, nvl(ghakjum,0) as ghakjum
from tb_student ST left join tb_sugang SU
                   on ST.hakno = SU.hakno left join tb_gwamok GW
                                          on SU.gcode = GW.gcode
order by ST.hakno;                              
-- 2)  학번별 학점 합계 조회 
select hakno, sum(ghakjum)
from (
        select ST.hakno, uname, gname, GW.gcode, nvl(ghakjum,0) as ghakjum
        from tb_student ST left join tb_sugang SU
                           on ST.hakno = SU.hakno left join tb_gwamok GW
                                                  on SU.gcode = GW.gcode
        order by ST.hakno
)
group by hakno
order by hakno;
-- 3) 2의 결과값에 줄 번호 부여
select hakno, tot, rownum as rnum
from(
        select hakno, sum(ghakjum) as tot
        from (
                select ST.hakno, uname, gname, GW.gcode, nvl(ghakjum,0) as ghakjum
                from tb_student ST left join tb_sugang SU
                                   on ST.hakno = SU.hakno left join tb_gwamok GW
                                                          on SU.gcode = GW.gcode
                order by ST.hakno
        )
        group by hakno
        order by hakno
);
-- 4) 줄 번호 4 ~ 6행만 조회 
select hakno, tot, rnum
from (
        select hakno, tot, rownum as rnum
        from(
                select hakno, sum(ghakjum) as tot
                from (
                        select ST.hakno, uname, gname, GW.gcode, nvl(ghakjum,0) as ghakjum
                        from tb_student ST left join tb_sugang SU
                                           on ST.hakno = SU.hakno left join tb_gwamok GW
                                                                  on SU.gcode = GW.gcode
                        order by ST.hakno
                )
                group by hakno
                order by hakno
        )
)
where rnum between 4 and 6;

-- 강사님 코드 
-- 1) 학생 조회
select hakno, uname from tb_student order by hakno;
-- 2) 수강신청한 과목의 학점 가져오기
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
                  on SU.gcode = GW.gcode;
-- 3) 학번 별 총 학점 구하기
select SU.hakno, sum(GW.ghakjum) as tot 
from tb_sugang SU join tb_gwamok GW
                  on SU.gcode = GW.gcode
group by SU.hakno;
-- 4) 3의 결과에 학생테이블 left join : 수강신청하지 않은 학생들도 가져올 수 있도록  
select ST.hakno, uname, tot
from tb_student ST left join (
                                select SU.hakno, sum(GW.ghakjum) as tot 
                                from tb_sugang SU join tb_gwamok GW
                                                  on SU.gcode = GW.gcode
                                group by SU.hakno
                              ) AA
                    on ST.hakno = AA.hakno;
-- 5) 총 학점이 null인 경우 0으로 처리, 학번 순으로 정렬 
select ST.hakno, uname, nvl(tot,0)
from tb_student ST left join (
                                select SU.hakno, sum(GW.ghakjum) as tot 
                                from tb_sugang SU join tb_gwamok GW
                                                  on SU.gcode = GW.gcode
                                group by SU.hakno
                              ) AA
                    on ST.hakno = AA.hakno
order by ST.hakno;
-- 6) 5의 결과에 rownum 추가 : 줄 번호가 있는 상태에서 정렬 = 잘못됨
select ST.hakno, uname, nvl(tot,0), rownum
from tb_student ST left join (
                                select SU.hakno, sum(GW.ghakjum) as tot 
                                from tb_sugang SU join tb_gwamok GW
                                                  on SU.gcode = GW.gcode
                                group by SU.hakno
                              ) AA
                    on ST.hakno = AA.hakno
order by ST.hakno;
-- 6-1) 5의 결과에 셀프 조인하고 rownum 추가 = 정답코드
select hakno, uname, tot2, rownum rnum
from (
        select ST.hakno, uname, nvl(tot,0) tot2
        from tb_student ST left join (
                                        select SU.hakno, sum(GW.ghakjum) as tot 
                                        from tb_sugang SU join tb_gwamok GW
                                                          on SU.gcode = GW.gcode
                                        group by SU.hakno
                                      ) AA
                            on ST.hakno = AA.hakno
        order by ST.hakno
);
-- 7) rownum 4~6행만 조회
select *
from (
        select hakno, uname, tot2, rownum rnum
        from (
                select ST.hakno, uname, nvl(tot,0) tot2
                from tb_student ST left join (
                                                select SU.hakno, sum(GW.ghakjum) as tot 
                                                from tb_sugang SU join tb_gwamok GW
                                                                  on SU.gcode = GW.gcode
                                                group by SU.hakno
                                              ) AA
                                    on ST.hakno = AA.hakno
                order by ST.hakno
        )
)
where rnum between 4 and 6;            -- = rnum >= 4 and rnum <= 6;


─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─·─


-- Q3. 학번별로 수강신청 총학점을 구하고, 총학점순으로 내림차순 정렬후
--     위에서 부터 1건만 조회하시오 (학번, 이름, 총학점) 
--수강테이블에 행추가 해주세요
--(총학점이 다 같은 값이여서 결과확인하기가 조금 애매 합니다)
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p005');
commit;

-- Q2번 답에서 조건 및 select만 수정
select hakno, uname, tot, rnum
from (
        select hakno, uname, tot, rownum as rnum
        from(
                select hakno, uname, sum(ghakjum) as tot
                from (
                        select ST.hakno, uname, gname, GW.gcode, nvl(ghakjum,0) as ghakjum
                        from tb_student ST left join tb_sugang SU
                                           on ST.hakno = SU.hakno left join tb_gwamok GW
                                                                  on SU.gcode = GW.gcode
                        order by ST.hakno
                )
                group by hakno, uname
                order by tot desc       -- 총학점 순대로 내림차순 후 rownum 부여해야함
        )
)
where rnum = 1;

-- 강사님 코드
-- 1) 과목코드가 일치하는 학점 가져오기
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
                  on SU.gcode = GW.gcode;
-- 2) 학번별로 그룹화 후 총학점 구하기, 총학점 순 내림차순으로 정렬
select SU.hakno, sum(GW.ghakjum) as 총학점
from tb_sugang SU join tb_gwamok GW
                  on SU.gcode = GW.gcode
group by SU.hakno
order by 총학점 desc;
-- 3) 2의 결과를 AA테이블로 만든 후 학생테이블 조인해서 이름 가져오기 + 줄 번호부여
select AA.hakno, ST.uname, 총학점, rownum as rnum
from (
        select SU.hakno, sum(GW.ghakjum) as 총학점
        from tb_sugang SU join tb_gwamok GW
                          on SU.gcode = GW.gcode
        group by SU.hakno
        order by 총학점 desc
)AA join tb_student ST
    on AA.hakno = ST.hakno;
-- 4) 셀프 조인 후 조건에 맞게 조회
select *
from (
select AA.hakno, ST.uname, 총학점, rownum as rnum
from (
        select SU.hakno, sum(GW.ghakjum) as 총학점
        from tb_sugang SU join tb_gwamok GW
                          on SU.gcode = GW.gcode
        group by SU.hakno
        order by 총학점 desc
)AA join tb_student ST
    on AA.hakno = ST.hakno
)
where rnum = 1;
