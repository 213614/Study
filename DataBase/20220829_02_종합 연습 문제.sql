-- ���� �� ���θ���� �� �����ͺ��̽� ���� �� �����ͺ��̽� ����
-- i:\java202207\database\20220829_02_���� ���� ����.sql
-- ���̺��� ����Ŭ������ ����ǹǷ� ���� �̸����� �����ҰŸ� drop���� ����� �ؾ���
///////////////////////////////////////////////////////////////////////////////////////////
select count(*) from tb_student;        -- 6
select count(*) from tb_sugang;         -- 14
select count(*) from tb_gwamok;         -- 9
///////////////////////////////////////////////////////////////////////////////////////////

-- Q1. ������ �������߿��� ������ ���� ���� �������� ������û�� ����� ��ȸ�Ͻÿ�
--    (�й�, �̸�, �����ڵ�)
--     g1005, ���޷�, d002 
-- 1) ������ ������ �� �ְ� ���� ������ ��ȸ                                                      
select max(ghakjum) from tb_gwamok where gcode like 'd%'
-- 2) �л� + ���� + ���� ���̺� ���� �� ���ǿ� �°� ��ȸ 
select ST.hakno, uname, SU.gcode
from tb_student ST join tb_sugang SU
                   on ST.hakno = SU.hakno join tb_gwamok GW
                                          on SU.gcode = GW.gcode
where ghakjum = (select max(ghakjum) from tb_gwamok where gcode like 'd%')
      and GW.gcode like 'd%';
                                
-- ����� �ڵ�
-- 1) ������ ������ ���� ��ȸ
select * from tb_gwamok where gcode like 'd%' order by ghakjum desc;
-- 2) ������ ������ �� ������ ���� ���� ������ ��ȸ
select max(ghakjum) from tb_gwamok where gcode like 'd%';      -- 5 
-- 3) 2�� ������� ���� ����(5����)�� ������ ������ ������ �ִ� �࿡�� �����ڵ� ��ȸ
--    = ������ ������ �� ������ ���� ���� �����ڵ� ��ȸ(��, �ߺ��� ������ ���ٴ� ����)
select gcode from tb_gwamok 
where ghakjum = (select max(ghakjum) from tb_gwamok where gcode like 'd%')
      and gcode like 'd%';          -- d002
-- 4) 3�� ������� ���� �����ڵ�(d002)�� ������û�� �л��� ��� ��ȸ
select gcode, hakno
from tb_sugang 
where gcode = (
               select gcode from tb_gwamok 
               where ghakjum = (select max(ghakjum) from tb_gwamok where gcode like 'd%')
               and gcode like 'd%'
               );
-- 5) 4�� ����� AA��� ���̺�� ���� �� �л� ���̺�� ����, �̸����� ��ȸ�ϱ�
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


����������������������������������������������������������������������������������������������������������������������������������


-- Q2. �й��� ������û�� �������� ���ϰ� �й��� �����ؼ� �ٹ�ȣ 4~6�� ��ȸ�Ͻÿ�
--    (��, ������û���� ���� �л��� �������� 0���� ǥ��) : nvl() / left join
--     g1004, 0, 4
--     g1005, 12, 5
--     g1006, 3, 6
-- =  �й��� ������û �� �л����� ������(������û ���� ���� �л��� ������ 0���� ó��)

-- 1) �л� + �������̺� left join �� ��ü �л� �� ������û, ���� ��ȸ
select distinct(ST.hakno), uname, SU.gcode
from tb_student ST left join tb_sugang SU
                   on ST.hakno = SU.hakno
order by ST.hakno;
-- 2) 1�� ������� �������̺� left join �� �й�, �������ڵ�, ������ null���� 0���� ��ü�ؼ� ��ȸ
select hakno, AA.gcode, nvl(GW.ghakjum,0) as hakjum
from (
        select distinct(ST.hakno), uname, SU.gcode
        from tb_student ST left join tb_sugang SU
                           on ST.hakno = SU.hakno
        order by ST.hakno
) AA left join tb_gwamok GW
     on AA.gcode = GW.gcode
-- 3) 2�� ����� �й��� ���� ����, �й��� ���� 
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
-- 4) 3�� ����� �� ��ȣ ���̱� 
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
-- 5) �� ��ȣ 4~6���̸� ��ȸ
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

--------------------------------------�� ���� ����ε� �� 1~2�ܰ� ���̱� 

-- 1) ���̺� ���� left join �� ����(nu11�� 0���� ��ü), �й�, �̸�, �����, �����ڵ� ��ȸ, �й� �� ����
select ST.hakno, uname, gname, GW.gcode, nvl(ghakjum,0) as ghakjum
from tb_student ST left join tb_sugang SU
                   on ST.hakno = SU.hakno left join tb_gwamok GW
                                          on SU.gcode = GW.gcode
order by ST.hakno;                              
-- 2)  �й��� ���� �հ� ��ȸ 
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
-- 3) 2�� ������� �� ��ȣ �ο�
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
-- 4) �� ��ȣ 4 ~ 6�ุ ��ȸ 
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

-- ����� �ڵ� 
-- 1) �л� ��ȸ
select hakno, uname from tb_student order by hakno;
-- 2) ������û�� ������ ���� ��������
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
                  on SU.gcode = GW.gcode;
-- 3) �й� �� �� ���� ���ϱ�
select SU.hakno, sum(GW.ghakjum) as tot 
from tb_sugang SU join tb_gwamok GW
                  on SU.gcode = GW.gcode
group by SU.hakno;
-- 4) 3�� ����� �л����̺� left join : ������û���� ���� �л��鵵 ������ �� �ֵ���  
select ST.hakno, uname, tot
from tb_student ST left join (
                                select SU.hakno, sum(GW.ghakjum) as tot 
                                from tb_sugang SU join tb_gwamok GW
                                                  on SU.gcode = GW.gcode
                                group by SU.hakno
                              ) AA
                    on ST.hakno = AA.hakno;
-- 5) �� ������ null�� ��� 0���� ó��, �й� ������ ���� 
select ST.hakno, uname, nvl(tot,0)
from tb_student ST left join (
                                select SU.hakno, sum(GW.ghakjum) as tot 
                                from tb_sugang SU join tb_gwamok GW
                                                  on SU.gcode = GW.gcode
                                group by SU.hakno
                              ) AA
                    on ST.hakno = AA.hakno
order by ST.hakno;
-- 6) 5�� ����� rownum �߰� : �� ��ȣ�� �ִ� ���¿��� ���� = �߸���
select ST.hakno, uname, nvl(tot,0), rownum
from tb_student ST left join (
                                select SU.hakno, sum(GW.ghakjum) as tot 
                                from tb_sugang SU join tb_gwamok GW
                                                  on SU.gcode = GW.gcode
                                group by SU.hakno
                              ) AA
                    on ST.hakno = AA.hakno
order by ST.hakno;
-- 6-1) 5�� ����� ���� �����ϰ� rownum �߰� = �����ڵ�
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
-- 7) rownum 4~6�ุ ��ȸ
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


����������������������������������������������������������������������������������������������������������������������������������


-- Q3. �й����� ������û �������� ���ϰ�, ������������ �������� ������
--     ������ ���� 1�Ǹ� ��ȸ�Ͻÿ� (�й�, �̸�, ������) 
--�������̺� ���߰� ���ּ���
--(�������� �� ���� ���̿��� ���Ȯ���ϱⰡ ���� �ָ� �մϴ�)
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p005');
commit;

-- Q2�� �信�� ���� �� select�� ����
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
                order by tot desc       -- ������ ����� �������� �� rownum �ο��ؾ���
        )
)
where rnum = 1;

-- ����� �ڵ�
-- 1) �����ڵ尡 ��ġ�ϴ� ���� ��������
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
                  on SU.gcode = GW.gcode;
-- 2) �й����� �׷�ȭ �� ������ ���ϱ�, ������ �� ������������ ����
select SU.hakno, sum(GW.ghakjum) as ������
from tb_sugang SU join tb_gwamok GW
                  on SU.gcode = GW.gcode
group by SU.hakno
order by ������ desc;
-- 3) 2�� ����� AA���̺�� ���� �� �л����̺� �����ؼ� �̸� �������� + �� ��ȣ�ο�
select AA.hakno, ST.uname, ������, rownum as rnum
from (
        select SU.hakno, sum(GW.ghakjum) as ������
        from tb_sugang SU join tb_gwamok GW
                          on SU.gcode = GW.gcode
        group by SU.hakno
        order by ������ desc
)AA join tb_student ST
    on AA.hakno = ST.hakno;
-- 4) ���� ���� �� ���ǿ� �°� ��ȸ
select *
from (
select AA.hakno, ST.uname, ������, rownum as rnum
from (
        select SU.hakno, sum(GW.ghakjum) as ������
        from tb_sugang SU join tb_gwamok GW
                          on SU.gcode = GW.gcode
        group by SU.hakno
        order by ������ desc
)AA join tb_student ST
    on AA.hakno = ST.hakno
)
where rnum = 1;
