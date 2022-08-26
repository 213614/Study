-- ���� �� ���θ���� �� �����ͺ��̽� ���� �� �����ͺ��̽� ����
-- i:\java202207\database\20220826_01_���̺� ����
-- ���̺��� ����Ŭ������ ����ǹǷ� ���� �̸����� �����ҰŸ� drop���� ����� �ؾ���
///////////////////////////////////////////////////////////////////////////////////////////

    �� ���̺� ���� ��
        - join ~ on ��ɾ�(SQL��)�� ���� ��������� ���� ���̺��̴� 
        - �������� ���̺��� �ϳ��� ���̺�ó�� ����ϴ� ��
        - �ΰ� �̻��� ���̺��� �����Ͽ� �����͸� �����ϴ� ���
        - �� ���̺��� ���밪�� �̿��Ͽ� Į���� �����ϴ� ����
        - ����� = PK, FK
        - ANSI(ǥ��)SQL��                         --(Oracle DB, Maria DB���� ������ ���̰� ����)
                select Į���� 
                from ���̺�1 join ���̺�2          -- ���� �Ѵٰ� ������ �ƴ�(������ ���� �ɰ����ִٴ� ��)
                on ������;                         -- ANSI(ǥ��)SQL��
                                                  -- ���̺��� ���� Į�� ����(ex. �й�, �������ڵ尰�� PK-FK)
                
        - Oracle DB Join SQL�� 
                select Į����
                from ���̺�1, ���̺�2
                on ������;

        ex.     select T1.*, T2.*                 -- T1�� ������ ���̺�(������û,����,���� �� ��ٱ���)
                from T1 join T2                   
                on T1.x=T2.x;                     -- T1�� xĮ���� T2�� xĮ���� ����(����)
                                                  -- ���̺��.Į����
                                    
        ex.     select T1.*, T2.*, T3.*           -- : *�� ���ɹ��ڰ� ������� Į���� ��� �� 
                from T1 join T2
                on T1.x = T2.x join T3            -- 3���� ���̺� ����
                on T1.y = T3.y
                
        ex.     select T1.*, T2.*, T3.*, T4.*
                from T1 join T2
                on T1.x = T2.x join T3
                on T1.y = T3.y join T4            -- 4���� ���̺� ����
                on T1.z = T4.Z; 
                
    �� ������ �� 
        �� where  
        �� having (group by)
        �� on     (join)

    �� ������������ ���̺� ��
        : ������ ���̺�� ���� ���̺��� ���� ������ �����̴�
        
        �� ������ ���̺� : ���� create table�� ���̺�
        �� ���� ���̺� : SQL���� ���� ������ ���̺� (���� create���� �ʾ���)
        
        ex. select*from tb_student;             : ������ ���̺�
            select count(*) from tb_student;    : ���� ���̺�
                      
//////////////////////////////////////////////////////////////////

    �� inner join ��

-- �й��� �������� ���� ���̺�� �л� ���̺� ���� (inner join) : ���� �⺻�̵ȴ�
select tb_sugang.*, tb_student.* 
from tb_sugang join tb_student        -- ���� ���� ���̺��� ����(���������̺�)
        --    �� join�տ� inner���� ������ �� 
-- = from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;

-- �� ������� ����. ���̺��� ������ ����, inner ���� ����
select tb_sugang.*, tb_student.* 
from tb_sugang inner join tb_student       
on tb_sugang.hakno = tb_student.hakno;

-- ������û�� �л����� �й�, �����ڵ�, �̸� �̸��� ��ȸ
select tb_sugang.*, tb_student.uname,tb_student.email
from tb_sugang inner join tb_student       
on tb_sugang.hakno = tb_student.hakno;

-- �����ڵ带 �������� �������̺�� �������̺� ����
select tb_sugang.*, tb_gwamok.gname,tb_gwamok.ghakjum
from tb_sugang join tb_gwamok      
on tb_sugang.gcode = tb_gwamok.gcode;

-- 3�� ���̺� ���� : �������̺�.* + �л����̺�.�̸� + �������̺�. �����
select tb_sugang.*, tb_student.uname, tb_gwamok.gname
from tb_sugang join tb_student       
on tb_sugang.hakno = tb_student.hakno join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;

-- ���̺� �� alias�� �ӽ� ���� ���� (as�� ����) : alias ���� �ʰ� �׳� �ڿ� ��Ī�� ���̸� ��(������ ������)
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
order by SU.hakno, SU.gcode;            -- ���� ����

-- ��ȸ�� ���̺��� �ߺ����� ���� Į������ ���̺� �� ���� 
-- = ���� ���̺��� �ִ� Į���� ���̺� �� ���� ����(�Ѱ����� ������ ������ �ʿ�X)
select SU.*, uname, email, gname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
order by SU.hakno, SU.gcode;

-- ����� Į��(�ߺ��� Į��)�� �Ҽ� ���̺� ���� ��Ȯ�� ����ؾ��Ѵ�. �ȱ׷��� ������(ORA-00918: ���� ���ǰ� �ָ��մϴ�)
select gcode, hakno         --  SU.gcode, ST.hakno �̷������� ��Ȯ�� ����ؾ��Ѵ�.
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
-- �� 1~3�� ����� �ٽ� Ǯ��� �� 

-- Q1. ������û�� �� �л��� �߿��� '����'�� ��� �л��鸸 �й�, �̸�, �ּҸ� ��ȸ�Ͻÿ�
select SU.hakno, uname, email, address
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno
where ST.address = '����';

-- ����� �ڵ�
-- 1) ������û�� �л��� ��� ����
select*from tb_sugang;
-- 2) �л����̺��� �ּҸ� ����������� �������̺�� ����
select SU.*, uname, address 
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno;
-- 3) '����'�� ��ȸ�ϱ�
select SU.*, uname, address 
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno
where address = '����';

-- �������̺� join �л����̺����� ���� ���� ���̺�(Į��4, ���ڵ�10)
select SU.hakno, SU.gcode, uname, address       -- *�� �ڲ� ���� �ڹ� ���������� ������(Į������ ��������)
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno;
-- �� ������ ���� ���̺��� �̸��� 'AA'��� �����ϰ� �ٽ� �簡���� �� �ִ� ��
select AA.hakno, AA.gcode, AA.uname, AA.address         -- = AA.*
from (
        select SU.hakno, SU.gcode, uname, address       -- Į������ �����ؾ��ϴ� ���� : �������̺��� �簡���Ҷ� ������ ���� ����  
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno                          -- �����ݷ� ����
      ) AA
where  AA.address='����';

-- !error! : ORA-00904: "AA"."EMAIL": �������� �ĺ��� : AA�ȿ� ST.email�� ���µ� AA.email�� �����ؼ� ������
-- select AA.hakno, AA.gcode, AA.uname, AA.address, AA.email    
-- from (
--         select SU.hakno, SU.gcode, uname, address     
--         from tb_sugang SU join tb_student ST
--         on SU.hakno = ST.hakno                         
--       ) AA
-- where  AA.address='����';

-- �����̺� ��Ī ���� ���� = AA ���� ���� / Join�� �������� �򰥸��Ƿ� ������°�
select hakno, gcode, uname, address                     -- Į������ ����� ���¿���(from�ȿ�) *�� ����
from (
        select SU.hakno, SU.gcode, uname, address     
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno                          
      ) 
where  address='����';

����������������������������������������������������������������������������������������������������������������������������������

-- Q2. �������� ������û �ο���, ������ ��ȸ�Ͻÿ�
--     ���� 2��                  (���¸� ����)
--     ���� 1��
-- Ʋ���ڵ� : �̷��� �й����� ������ߴ��� ���� 
-- select SU.hakno, address, count(*) cnt
-- from tb_sugang SU join tb_student ST
-- on SU.hakno = ST.hakno
-- group by SU.hakno, address; 
-- �Ʒ� ����� �ڵ� �����ؼ� §�� (�����ڵ�)
-- 1) ������û ��� ��ȸ
select hakno from tb_sugang group by hakno
-- 2) �л� ���̺�� ���� �� �ּҷ� �׷�ȭ, ī��Ʈ 
select ST.address, count(*) || '��' as sugnan_cnt
from (
        select hakno from tb_sugang group by hakno
     ) AA join tb_student ST 
on AA.hakno = ST.hakno
group by ST.address;

-- ����� �ڵ�
-- 1) ������û�� �л��� ���(�й�)
select distinct(hakno) from tb_sugang order by hakno;
-- = 
select hakno from tb_sugang group by hakno;     -- group by���� �⺻������ order by�� �������ִ�
-- 2) ������û�� �й����(�� �����̺�)�� �ּҸ� �л����̺��� ��������(join)
select AA.hakno, ST.address
from (
        select hakno from tb_sugang group by hakno
      ) AA join tb_student ST
on AA.hakno = ST.hakno;
-- 3) �� �� ���̺��� ���ο� BB���̺�� ����� �ּҺ��� �׷� �� ���� ���� ���ϱ�(count)
select address, count(*) || '��' as cnt
from (
        select AA.hakno, ST.address
        from (
                select hakno from tb_sugang group by hakno
              ) AA join tb_student ST
        on AA.hakno = ST.hakno
) BB 
group by address;

-- ������ �ڵ�
-- ���� : https://gent.tistory.com/274
select ST.address, count(distinct(ST.hakno)) || '��' cnt   -- ī��Ʈ(�й����� �ߺ����� 1������) 
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno
group by address;

����������������������������������������������������������������������������������������������������������������������������������

-- Q3. ���� ���� ��û �ο���, �����ڵ�, ����� ��ȸ�Ͻÿ� 
--     d001 HTML    2��         (���¸� ����)
--     d002 ���伥   1��
--     p001 OOP     2��
-- 1) 
select SU.gcode,SU.hakno, gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode;
-- 2)
select gcode, gname, count(*) || '��' as sugnan_cnt
from (
        select SU.gcode,SU.hakno, gname
        from tb_sugang SU join tb_gwamok GW
        on SU.gcode = GW.gcode
)
group by gcode, gname
order by gcode;

-- ������ڵ�
-- 1) ���� ���̺� ��ȸ
select*from tb_sugang order by gcode;
-- 2) ���� ���̺��� �����ڵ尡 ������ �� �׷�
select gcode, count(*)
from tb_sugang
group by gcode;
-- 3) 2 ����� AA���̺�� ����
select AA.gcode, GW.gname, concat(AA.cnt, '��')
from(
        select gcode, count(*) cnt
        from tb_sugang
        group by gcode
) AA join tb_gwamok GW
on AA.gcode = GW.gcode
order by AA.gcode;

����������������������������������������������������������������������������������������������������������������������������������

-- Q4. �й��� ������û������ �������� �й��������� ��ȸ�Ͻÿ�
--     g1001  ȫ�浿  9����      (���¸� ����)
--     g1002  ȫ�浿  6����
--     g1005  ���޷�  9����
select SU.hakno, ST.uname , sum(GW.ghakjum) || '����' as tot_hakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
group by SU.hakno, ST.uname
order by SU.hakno;

-- 1) (�����̺� join ���)
select SU.hakno,SU.gcode, uname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;
-- 2)
select hakno, uname, sum(ghakjum) || '����' as tot_hakjum
from (
        select SU.hakno,SU.gcode, uname, ghakjum
        from tb_sugang SU join tb_student ST
        on SU.hakno = ST.hakno join tb_gwamok GW
        on SU.gcode = GW.gcode
)
group by hakno, uname       -- select���� uname�Ϸ��� 2���׷�ȭ : ������ �й��̰����� �ѻ����
order by hakno;

-- ������ڵ�
-- 1) ���� ���̺��� �й����� ��ȸ
select hakno,gcode from tb_sugang order by hakno;

-- 2) ���� ���̺� �����ڵ尡 ��ġ�ϴ� ������ ���� ���̺��� �����ͼ� join
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW 
on SU.gcode = GW.gcode;

-- 3) 2�� ����� ������ AA���̺� ����, �й��� �׷�ȭ, ������ �հ� ���ϱ�
select AA.hakno, sum(AA.ghakjum) as hap
from ( 
        select SU.hakno, SU.gcode, GW.ghakjum
        from tb_sugang SU join tb_gwamok GW 
        on SU.gcode = GW.gcode
) AA 
group by AA.hakno;

-- 4) 3�� ����� ������ BB���̺� ����, �л� ���̺�� �����ؼ� �̸��� ��������
select BB.hakno, ST.uname, concat(BB.hap,'����') as hap      -- �ȿ��� sum�����ϱ� �׳� ��Ī���� �������� ��
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

-- ����� �ڵ� 2 (�ٸ� ���)
-- 1) ����+�л�+���� 3�� ���̺� join
select SU.hakno, SU.gcode, uname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode

-- 2) �����߰� 
select SU.hakno, ST.uname , sum(GW.ghakjum) || '����' as hap
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
group by SU.hakno, ST.uname
order by SU.hakno;

����������������������������������������������������������������������������������������������������������������������������������

-- Q5. �й� g1001�� ������û�� ������ �����ڵ庰�� ��ȸ�Ͻÿ�
--     g1001  p001  OOP         (���¸� ����)
--     g1001  p003  JSP         : �й��� ����ó���ϸ� ����ڰ� �α����Ҷ� ���̵� �й�������
--     g1001  d001  HTML        : �����ϸ� ������ ���������� �����ְԸ�����ִ�
select SU.hakno,SU.gcode, gname
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
where SU.hakno = 'g1001'            -- ���� �ڹٶ� �����ϸ� �й��� ����ó�� ��
order by SU.gcode;
-- �����̺� join ��� 
select hakno, gcode, gname
from (
        select SU.hakno,SU.gcode, gname
        from tb_sugang SU join tb_student ST
                          on SU.hakno = ST.hakno join tb_gwamok GW
                                                 on SU.gcode = GW.gcode
)
where hakno = 'g1001'
order by gcode;

����������������������������������������������������������������������������������������������������������������������������������

-- Q6. ������û�� �� �л����� �й�, �̸� ��ȸ
select SU.hakno, uname
from tb_sugang SU join tb_student ST 
                  on SU.hakno = ST.hakno
group by SU.hakno, uname
order by SU.hakno;

-- ������ڵ� (�������� ���)
-- 1) ������û�� �� �л����� �й� ��ȸ
select distinct(hakno) from tb_sugang;          -- = group by hakno;

-- 2) 
select hakno, uname
from tb_student
where hakno in (select distinct(hakno) from tb_sugang);
-- = hakno = 'g1001' or hakno = 'g1002' or hakno = 'g1005' or hakno = 'g1006' ;
-- = hakno in ('g1001','g1002','g1005','g1006');

����������������������������������������������������������������������������������������������������������������������������������

-- Q7. ������û�� ���� ���� �л����� �й�, �̸� ��ȸ

--���۸�(���̺�1�� ���̺�2�� Į�� ���� �¾ƾ��ؼ� �̸� ��� ����)
--select tb_student.hakno from tb_student
--minus
--select tb_sugang.hakno from tb_sugang

select ST.hakno, uname
from tb_student ST left outer join tb_sugang SU         -- left outer join : �������̺� �������� ������ 
                   on ST.hakno = SU.hakno
where ST.hakno not in (select hakno from tb_sugang)     -- = (select distinct(hakno) from tb_sugang) 
order by ST.hakno;

-- ������ڵ� : ..���̺� ���ε� �ʿ���� �� ��������.,,
select hakno, uname
from tb_student
where hakno not in (select distinct(hakno) from tb_sugang)
order by hakno;


















